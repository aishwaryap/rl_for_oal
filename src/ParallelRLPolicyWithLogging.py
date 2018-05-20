#!/usr/bin/python

import numpy as np
import pickle
import string
from sklearn.neural_network import MLPRegressor
from sklearn.linear_model import SGDRegressor
from GuessPredictor import GuessPredictor
from ParallelRLPolicy import ParallelRLPolicy
from argparse import ArgumentParser

__author__ = 'aishwarya'


class ParallelRLPolicyWithLogging(ParallelRLPolicy):
    # This should have the same classifier manager as the dialog agent
    def __init__(self, save_file, on_topic, classifier_manager, model_type, separate_guess_predictor, gamma,
                 candidate_questions_beam_size, min_prob_weight, max_prob_weight, max_prob_kappa,
                 initial_guess_predictor=None, ablate_feature=None, ablate_feature_group=None):
        super(ParallelRLPolicyWithLogging, self).__init__(save_file, on_topic, classifier_manager, model_type,
                                                          separate_guess_predictor, gamma,
                                                          candidate_questions_beam_size, min_prob_weight,
                                                          max_prob_weight, max_prob_kappa, initial_guess_predictor,
                                                          ablate_feature, ablate_feature_group)

    def compute_update(self, prev_dialog_state, next_action, next_dialog_state, reward):
        current_state_candidate_actions = self.get_candidate_actions(prev_dialog_state)
        if next_action in current_state_candidate_actions:
            current_state_candidate_actions.remove(next_action)
        current_state_action_features = [self.get_features(prev_dialog_state, action)
                                         for action in current_state_candidate_actions]

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
                  'target': target_q,
                  'other_features': current_state_action_features,
                  }

        if self.separate_guess_predictor:
            update.update(self.guess_predictor.compute_update(prev_dialog_state))

        return update


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
    arg_parser.add_argument('--ablate-feature', type=int, default=None,
                            help='Ablate this feature idx')
    arg_parser.add_argument('--ablate-feature-group', type=str, default=None,
                            help='query or guess')
    arg_parser.add_argument('--save-file', type=str, required=True,
                            help='File to save pickled policy')

    args = arg_parser.parse_args()

    initial_guess_predictor = None
    if args.guess_predictor_file is not None:
        with open(args.guess_predictor_file, 'rb') as handle:
            initial_guess_predictor = pickle.load(handle)

    policy = ParallelRLPolicyWithLogging(args.save_file, args.on_topic, None, args.model_type,
                                         args.separate_guess_predictor, args.gamma, args.candidate_questions_beam_size,
                                         args.min_prob_weight, args.max_prob_weight, args.max_prob_kappa,
                                         initial_guess_predictor, args.ablate_feature, args.ablate_feature_group)
    policy.save()