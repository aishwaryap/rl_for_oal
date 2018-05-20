#!/usr/bin/python
#
# Updates using Advantage Actor Critic

import numpy as np
import pickle
from argparse import ArgumentParser
from ParallelRLPolicy import ParallelRLPolicy

__author__ = 'aishwarya'


class AdvantageActorCriticRLPolicy(ParallelRLPolicy):
    def __init__(self, save_file, on_topic, classifier_manager, model_type, separate_guess_predictor, gamma,
                 candidate_questions_beam_size, min_prob_weight, max_prob_weight, max_prob_kappa,
                 initial_guess_predictor, ablate_feature, ablate_feature_group, alpha):
        super(AdvantageActorCriticRLPolicy, self).__init__(save_file, on_topic, classifier_manager, model_type,
                                                           separate_guess_predictor, gamma,
                                                           candidate_questions_beam_size, min_prob_weight,
                                                           max_prob_weight, max_prob_kappa, initial_guess_predictor,
                                                           ablate_feature, ablate_feature_group)

        if separate_guess_predictor:
            self.num_features = 13
        else:
            self.num_features = 25
        if self.ablate_feature is not None:
            self.num_features -= 1
        if self.ablate_feature_group == 'query':
            self.num_features -= 7
        elif self.ablate_feature_group == 'guess':
            if separate_guess_predictor:
                self.num_features -= 1
            else:
                self.num_features -= 13
        # print 'ablate_feature =', ablate_feature, ', self.num_features =', self.num_features

        self.policy_weights = self.get_zero_vector(self.num_features)
        self.alpha = alpha

    # A util to get a zero vector because the command is non-intuitive
    def get_zero_vector(self, size):
        return np.matrix(np.zeros(size)).T

    def get_features(self, dialog_state, action):
        f = super(AdvantageActorCriticRLPolicy, self).get_features(dialog_state, action) + [1.0]
        return np.matrix(f).T

    def get_next_action(self, dialog_state):
        candidate_actions = self.get_candidate_actions(dialog_state)
        candidate_actions_features = [self.get_features(dialog_state, action) for action in candidate_actions]
        prob_weights = [(self.policy_weights.T * f).item(0, 0) for f in candidate_actions_features]
        prob_numerators = np.exp(prob_weights)
        if sum(prob_numerators) == 0.0:
            chosen_action_idx = np.random.choice(range(len(candidate_actions)))
        else:
            probs = [w / sum(prob_numerators) for w in prob_numerators]
            chosen_action_idx = np.random.choice(range(len(candidate_actions)), p=probs)
        return candidate_actions[chosen_action_idx]

    def get_v(self, dialog_state):
        candidate_actions = self.get_candidate_actions(dialog_state)
        q_values = [self.get_q(dialog_state, action) for action in candidate_actions]
        candidate_actions_features = [self.get_features(dialog_state, action) for action in candidate_actions]
        prob_weights = [(self.policy_weights.T * f).item(0, 0) for f in candidate_actions_features]
        if sum(prob_weights) == 0.0:
            probs = [1.0 / len(candidate_actions)] * len(candidate_actions)
        else:
            probs = [w / sum(prob_weights) for w in prob_weights]
        v = 0.0
        for idx in range(len(candidate_actions)):
            v += probs[idx] * q_values[idx]
        return v

    def compute_update(self, prev_dialog_state, next_action, next_dialog_state, reward):
        critic_update = super(AdvantageActorCriticRLPolicy, self).compute_update(prev_dialog_state, next_action,
                                                                                 next_dialog_state, reward)
        # print 'In ActorCriticRLPolicy.compute_update'
        critic_update['feature'] = np.squeeze(np.array(critic_update['feature'].T), axis=0)

        candidate_actions = self.get_candidate_actions(prev_dialog_state)
        candidate_actions_features = [self.get_features(prev_dialog_state, action) for action in candidate_actions]
        prob_weights = [(self.policy_weights.T * f).item(0, 0) for f in candidate_actions_features]
        if sum(prob_weights) == 0.0:
            probs = [1.0 / len(candidate_actions)] * len(candidate_actions)
        else:
            probs = [w / sum(prob_weights) for w in prob_weights]

        # \sum_a' pi(s, a') * f(s, a')
        state_feature_expectation = sum([probs[i] * candidate_actions_features[i]
                                         for i in range(len(candidate_actions))])

        if next_dialog_state is None:
            td_error = reward - self.get_v(prev_dialog_state)
        else:
            td_error = reward + self.gamma * self.get_v(next_dialog_state) - self.get_v(prev_dialog_state)

        update = {
            'z': self.get_features(prev_dialog_state, next_action) - state_feature_expectation,
            'td_error': td_error
        }
        update.update(critic_update)
        return update

    def perform_updates(self, updates):
        super(AdvantageActorCriticRLPolicy, self).perform_updates(updates)
        for update in updates:
            if 'is_weight' in update:
                self.policy_weights = self.policy_weights + update['is_weight'] * self.alpha * update['z'] \
                                                            * update['td_error']
            else:
                self.policy_weights = self.policy_weights + self.alpha * update['z'] * update['td_error']


if __name__ == '__main__':
    # Instantiates a static policy and saves it as a pickle
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--model-type', type=str, required=True,
                            help='"mlp" or "linear"')
    arg_parser.add_argument('--gamma', type=float, default=0.9,
                            help='Gamma for Q learning update')
    arg_parser.add_argument('--alpha', type=float, default=1.0,
                            help='Alpha in policy update')
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

    # These args are going to be ignored - they remain for ease of script reuse
    arg_parser.add_argument('--separate-guess-predictor', action="store_true", default=False,
                            help='Add this flag if a separate guess predictor is present')
    arg_parser.add_argument('--guess-predictor-file', type=str, default=None,
                            help='File with pickled guess predictor')

    args = arg_parser.parse_args()

    policy = AdvantageActorCriticRLPolicy(args.save_file, args.on_topic, None, args.model_type, False,
                                          args.gamma, args.candidate_questions_beam_size, args.min_prob_weight,
                                          args.max_prob_weight, args.max_prob_kappa, None,
                                          args.ablate_feature, args.ablate_feature_group, args.alpha)
    policy.save()
