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


class ParallelRLPolicy(AbstractPolicy):
    # This should have the same classifier manager as the dialog agent
    def __init__(self, save_file, on_topic, classifier_manager, model_type, separate_guess_predictor, gamma,
                 candidate_questions_beam_size, min_prob_weight, max_prob_weight, max_prob_kappa,
                 initial_guess_predictor=None):
        super(ParallelRLPolicy, self).__init__(save_file, on_topic, classifier_manager, min_prob_weight,
                                               max_prob_weight, max_prob_kappa)

        self.gamma = gamma
        self.candidate_questions_beam_size = candidate_questions_beam_size

        if model_type == 'mlp':
            self.q = MLPRegressor()
        elif model_type == 'linear':
            self.q = SGDRegressor()
        else:
            raise NotImplementedError('Only model types available are \'mlp\' and \'linear\'')
        self.untrained = True

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
        if 'predicate' in action:
            feature_vector.append(float(action['predicate'] in dialog_state['predicates_without_classifiers']))
        else:
            feature_vector.append(0.0)

        # Margin of object
        if 'region' in action:
            data_point = np.array([dialog_state['candidate_regions_features'][action['region']]])
            feature_vector.append(self.classifier_manager.get_margins(action['predicate'], data_point)[0])
        else:
            feature_vector.append(0.0)

        # Density of object
        if 'region' in action:
            feature_vector.append(dialog_state['candidate_regions_densities'][action['region']])
        else:
            feature_vector.append(0.0)

        # Fraction of k nearest neighbours of the object which are unlabelled
        if 'region' in action:
            # print "dialog_state['labels_acquired'] =", dialog_state['labels_acquired']
            nbrs = [nbr for (nbr, sim) in dialog_state['candidate_regions_nbrs'][action['region']]]
            labelled_regions = [region for (region, label_value) in dialog_state['labels_acquired'].items()]
            labelled_nbrs = [region for region in nbrs if region in labelled_regions]
            feature_vector.append(len(labelled_nbrs) / float(len(nbrs)))
        else:
            feature_vector.append(1.0)

        # Prev kappa of classifier of predicate
        if 'predicate' in action:
            feature_vector.append(self.classifier_manager.get_kappa(action['predicate']))
        else:
            feature_vector.append(1.0)

        # Frequency of use of the predicate - normalized
        if 'predicate' in action and action['predicate'] in dialog_state['predicate_uses']:
            feature_vector.append(dialog_state['predicate_uses'][action['predicate']] /
                              float(dialog_state['num_dialogs_completed']))
        else:
            feature_vector.append(1.0)

        # Number of system turns used - normalized
        feature_vector.append(dialog_state['num_system_turns'] / 10.0)

        # Frequency of use of the predicate - normalized
        if 'predicate' in action and action['predicate'] in dialog_state['predicate_successes'] \
                and action['predicate'] in dialog_state['predicate_uses']:
            feature_vector.append(dialog_state['predicate_successes'][action['predicate']] /
                                  float(dialog_state['predicate_uses'][action['predicate']]))
        else:
            feature_vector.append(1.0)

        return feature_vector

    def get_candidate_actions(self, dialog_state):
        return [self.get_guess(dialog_state)] + \
               self.get_label_question_candidates(dialog_state, self.candidate_questions_beam_size) + \
               self.get_example_question_candidates(dialog_state, self.candidate_questions_beam_size)

    def get_q(self, dialog_state, action):
        if self.untrained:
            return 0.0
        feature_vector = np.array([self.get_features(dialog_state, action)])
        if len(feature_vector.shape) == 1:
            feature_vector = feature_vector.reshape(1, -1)
        return self.q.predict(feature_vector)

    def compute_update(self, prev_dialog_state, next_action, next_dialog_state, reward):
        if next_dialog_state is not None:
            next_state_candidate_actions = self.get_candidate_actions(next_dialog_state)
            q_values = [self.get_q(next_dialog_state, action) for action in next_state_candidate_actions]
            max_q = max(q_values)
            max_q_idx = q_values.index(max_q)
            self.stored_action = next_state_candidate_actions[max_q_idx]
            target_q = reward + self.gamma * max_q
        else:
            self.stored_action = None
            target_q = reward

        update = {'feature': self.get_features(prev_dialog_state, next_action),
                  'target': target_q}

        if self.separate_guess_predictor:
            update.update(self.guess_predictor.compute_update(prev_dialog_state))

        return update

    def perform_updates(self, updates):
        if len(updates) > 0:
            feature_vectors = np.array([update['feature'] for update in updates])
            target_q_values = np.array([update['target'] for update in updates])
            if len(feature_vectors.shape) == 1:
                feature_vectors = feature_vectors.reshape(1, -1)
            self.q.partial_fit(feature_vectors, target_q_values)
            if self.separate_guess_predictor:
                self.guess_predictor.perform_updates(updates)
            self.untrained = False

    def get_next_action(self, dialog_state):
        print 'In ParallelRLPolicy.get_next_action'
        if self.stored_action is not None:
            return self.stored_action
        else:
            candidate_actions = self.get_candidate_actions(dialog_state)
            print 'Got candidate actions'
            q_values = [self.get_q(dialog_state, action) for action in candidate_actions]
            print 'Got q values'
            max_q = max(q_values)
            max_q_idx = q_values.index(max_q)
            return candidate_actions[max_q_idx]


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
    arg_parser.add_argument('--min-prob-weight', type=float, default=1.0,
                            help='Probability for kappa=0 and kappa=1')
    arg_parser.add_argument('--max-prob-weight', type=float, default=100.0,
                            help='Probability for peak point')
    arg_parser.add_argument('--max-prob-kappa', type=float, default=0.8,
                            help='Kappa at which distribution peaks')
    arg_parser.add_argument('--save-file', type=str, required=True,
                            help='File to save pickled policy')

    args = arg_parser.parse_args()

    initial_guess_predictor = None
    if args.guess_predictor_file is not None:
        with open(args.guess_predictor_file, 'rb') as handle:
            initial_guess_predictor = pickle.load(handle)

    policy = ParallelRLPolicy(args.save_file, args.on_topic, None, args.model_type, args.separate_guess_predictor,
                              args.gamma, args.candidate_questions_beam_size, args.min_prob_weight,
                              args.max_prob_weight, args.max_prob_kappa, initial_guess_predictor)
    policy.save()
