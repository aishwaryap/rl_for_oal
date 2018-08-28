#!/usr/bin/python
# Basic structure of a policy, and some default functionality

import random
from AbstractPolicy import AbstractPolicy
from argparse import ArgumentParser
from datetime import datetime

__author__ = 'aishwarya'


class AllQuestionsStaticPolicy(AbstractPolicy):
    # max_questions - Max questions before a guess
    # yes_no_prob - Probability of choosing a yes no question when both types are valid
    # max_avg_kappa - Ask a yes-no question if average Kappa is below this
    # min_num_unknown_predicates - Min # of unknown predicates to be present to ask for positive label
    # on_topic - True if only on topic questions allowed. Else False
    def __init__(self, save_file, on_topic,
                 min_prob_weight, max_prob_weight, max_prob_kappa):
        super(AllQuestionsStaticPolicy, self).__init__(
            save_file, on_topic, classifier_manager=None,
            min_prob_weight=min_prob_weight, max_prob_weight=max_prob_weight,
            max_prob_kappa=max_prob_kappa)
        self.on_topic = on_topic

    def get_next_action(self, dialog_state):
        for predicate in dialog_state['seen_predicates']:
            unlabaled_regions = self.get_label_question_regions(predicate, dialog_state)
            if len(unlabaled_regions) > 0:
                next_action = {'action': 'ask_label', 'predicate': predicate,
                               'region': unlabaled_regions[0]}
                return next_action
        next_action = self.get_guess(dialog_state)
        return next_action


if __name__ == '__main__':
    # Instantiates a static policy and saves it as a pickle
    arg_parser = ArgumentParser()

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

    policy = AllQuestionsStaticPolicy(args.save_file, args.on_topic,
                                      args.min_prob_weight, args.max_prob_weight,
                                      args.max_prob_kappa)
    policy.save()
