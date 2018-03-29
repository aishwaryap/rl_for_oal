#!/usr/bin/python

import numpy as np
from argparse import ArgumentParser
from AbstractPolicy import AbstractPolicy

__author__ = 'aishwarya'


class TaskOrientedPolicy(AbstractPolicy):
    def __init__(self, save_file, on_topic, min_prob_weight, max_prob_weight, max_prob_kappa, kappa_threshold):
        super(TaskOrientedPolicy, self).__init__(save_file, on_topic, classifier_manager=None,
                                                 min_prob_weight=min_prob_weight,
                                                 max_prob_weight=max_prob_weight,
                                                 max_prob_kappa=max_prob_kappa)
        self.kappa_threshold = kappa_threshold

    def get_next_action(self, dialog_state):
        for predicate in dialog_state['current_predicates']:
            if dialog_state['current_kappas'][predicate] < self.kappa_threshold:
                labelled_regions = set()
                if predicate in dialog_state['labels_acquired']:
                    labelled_regions = set([region for (region, label) in dialog_state['labels_acquired'][predicate]])
                unlabelled_regions = [region for region in dialog_state['candidate_regions']
                                      if region not in labelled_regions]
                if len(unlabelled_regions) > 0:
                    next_action = {'action': 'ask_label', 'predicate': predicate, 'region': unlabelled_regions[0]}
                    return next_action

        # If control reaches here, no question was found, so make a guess
        scores = np.zeros(len(dialog_state['candidate_regions']))
        for predicate in dialog_state['current_predicates']:
            if dialog_state['current_kappas'][predicate] < self.kappa_threshold:
                for (idx, region) in enumerate(dialog_state['candidate_regions']):
                    if (region, 1) in dialog_state['labels_acquired'][predicate]:
                        scores[idx] += 1.0
            else:
                scores += (dialog_state['decisions'][predicate] > 0) * dialog_state['current_kappas'][predicate] - \
                          (dialog_state['decisions'][predicate] <= 0) * dialog_state['current_kappas'][predicate]

        scores = scores.tolist()
        max_score = max(scores)
        max_score_idx = scores.index(max_score)
        action = {
            'action': 'make_guess',
            'guess': dialog_state['candidate_regions'][max_score_idx],
            'score': max_score
        }
        return action


if __name__ == '__main__':
    # Instantiates a policy and saves it as a pickle
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--kappa-threshold', type=float, default=2.0,
                            help='Min kappa needed to use classifier while guessing')
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

    policy = TaskOrientedPolicy(args.save_file, args.on_topic, args.min_prob_weight, args.max_prob_weight,
                                args.max_prob_kappa, args.kappa_threshold)
    policy.save()
