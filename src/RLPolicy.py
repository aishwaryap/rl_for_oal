#!/usr/bin/python
# Basic structure of a policy, and some default functionality

import numpy as np
import pickle
from sklearn.neural_network import MLPRegressor
from sklearn.linear_model import SGDRegressor
from GuessPredictor import GuessPredictor
from AbstractPolicy import AbstractPolicy
from argparse import ArgumentParser

__author__ = 'aishwarya'


class RLPolicy(AbstractPolicy):
    # This should have the same classifier manager as the dialog agent
    def __init__(self, save_file, on_topic, classifier_manager, model_type, separate_guess_predictor, gamma,
                 candidate_questions_beam_size, initial_guess_predictor=None):
        super(RLPolicy, self).__init__(save_file, on_topic, classifier_manager)

        self.gamma = gamma
        self.candidate_questions_beam_size = candidate_questions_beam_size

        if model_type == 'mlp':
            self.q = MLPRegressor()
        elif model_type == 'linear':
            self.q = SGDRegressor()
        else:
            raise NotImplementedError('Only model types available are \'mlp\' and \'linear\'')

        self.separate_guess_predictor = separate_guess_predictor
        self.guess_predictor = initial_guess_predictor
        if initial_guess_predictor is None:
            self.guess_predictor = GuessPredictor()

        # Feature names for debugging
        if self.separate_guess_predictor:
            self.feature_names = ['guess_success_prob']
        else:
            self.feature_names = self.guess_predictor.feature_names
        self.feature_names = self.feature_names + \
            [
                'Evaluating score of make_guess (0-1)',
                'Evaluating score of ask_positive_example (0-1)',
                'Question is on-topic (0-1)',
                'Predicate has a classifier (0-1)',
                'Margin of object',
                'Density of object',
                'Fraction of k nearest neighbours of the object which are unlabelled',
                'Prev kappa of classifier of predicate',
                'Frequency of use of the predicate - normalized',
                'Number of system turns used - normalized',
                'Fraction of previous dialogs using this predicate that have succeeded'
            ]

        # Cache best action for next state
        self.stored_action = None

    def get_features(self, dialog_state, action):
        feature_vector = list()

        if self.separate_guess_predictor:
            # Guess success prob
            feature_vector.append(self.guess_predictor.get_guess_success_prob(dialog_state))
        else:
            # Get guess features
            feature_vector = feature_vector + self.guess_predictor.get_features(dialog_state)

        # Evaluating score of make_guess (0-1)
        feature_vector.append(float(action['action'] == 'make_guess'))

        # Evaluating score of ask_positive_example (0-1)
        feature_vector.append(float(action['action'] == 'ask_positive_example'))

        # Question is on-topic (0-1)
        feature_vector.append(float(self.on_topic))

        # Predicate has a classifier (0-1)
        feature_vector.append(float(action['predicate'] in dialog_state['predicates_without_classifiers']))

        # Margin of object
        data_point = np.array([dialog_state['candidate_regions_features'][action['region']]])
        feature_vector.append(self.classifier_manager.get_margins(action['predicate'], data_point)[0])

        # Density of object
        feature_vector.append(dialog_state['candidate_regions_densities'][action['region']])

        # Fraction of k nearest neighbours of the object which are unlabelled
        nbrs = [nbr for (nbr, sim) in dialog_state['candidate_regions_nbrs'][action['region']]]
        labelled_regions = [region for (region, label_value) in dialog_state['labels_acquired']]
        labelled_nbrs = [region for region in nbrs if region in labelled_regions]
        feature_vector.append(len(labelled_nbrs) / float(len(nbrs)))

        # Prev kappa of classifier of predicate
        feature_vector.append(self.classifier_manager.get_kappa(action['predicate']))

        # Frequency of use of the predicate - normalized
        feature_vector.append(dialog_state['predicate_uses'][action['predicate']] /
                              float(dialog_state['num_dialogs_completed']))

        # Number of system turns used - normalized
        feature_vector.append(dialog_state['num_system_turns'] / 10.0)

        # Frequency of use of the predicate - normalized
        feature_vector.append(dialog_state['predicate_successes'][action['predicate']] /
                              float(dialog_state['predicate_uses'][action['predicate']]))

        return feature_vector

    def get_candidate_actions(self, dialog_state):
        return [self.get_guess(dialog_state)] + \
               self.get_label_question_candidates(dialog_state, self.candidate_questions_beam_size) + \
               self.get_example_question_candidates(dialog_state, self.candidate_questions_beam_size)

    def get_q(self, dialog_state, action):
        feature_vector = [self.get_features(dialog_state, action)]
        return self.q.predict(feature_vector)

    def update(self, prev_dialog_state, next_action, next_dialog_state, reward):
        next_state_candidate_actions = self.get_candidate_actions(next_dialog_state)
        q_values = [self.get_q(next_dialog_state, action) for action in next_state_candidate_actions]
        max_q = max(q_values)
        max_q_idx = q_values.index(max_q)
        self.stored_action = next_state_candidate_actions[max_q_idx]
        target_q = reward + self.gamma * max_q
        self.q.partial_fit([self.get_features(prev_dialog_state, next_action)], [target_q])


if __name__ == '__main__':
    # Instantiates a static policy and saves it as a pickle
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--model-type', type=str, required=True,
                            help='"mlp" or "linear"')
    arg_parser.add_argument('--separate-guess-predictor', action="store_true", default=False,
                            help='Add this flag if a separate guess predictor is present')
    arg_parser.add_argument('--guess-predictor-file', type=str, default=None,
                            help='File with pickled guess predictor')
    arg_parser.add_argument('--gamma', type=float, default=0.9,
                            help='Gamma for Q learning update')
    arg_parser.add_argument('--candidate-questions-beam-size', type=int, default=None,
                            help='Add this argument to limit number of questions considered to some integer')
    arg_parser.add_argument('--on-topic', action="store_true", default=False,
                            help='Ask only on topic questions')
    arg_parser.add_argument('--save-file', type=str, required=True,
                            help='File to save pickled policy')

    args = arg_parser.parse_args()

    initial_guess_predictor = None
    if args.guess_predictor_file is not None:
        with open(args.guess_predictor_file, 'rb') as handle:
            initial_guess_predictor = pickle.load(handle)

    policy = RLPolicy(args.save_file, args.on_topic, None, args.model_type, args.separate_guess_predictor,
                      args.gamma, args.candidate_questions_beam_size, initial_guess_predictor)
    policy.save()
