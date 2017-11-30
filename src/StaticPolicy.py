#!/usr/bin/python
# Basic structure of a policy, and some default functionality

import numpy as np
import random
import pickle
from AbstractPolicy import AbstractPolicy
from argparse import ArgumentParser

__author__ = 'aishwarya'


class StaticPolicy(AbstractPolicy):
    # max_questions - Max questions before a guess
    # yes_no_prob - Probability of choosing a yes no question when both types are valid
    # max_avg_kappa - Ask a yes-no question if average Kappa is below this
    # min_num_unknown_predicates - Min # of unknown predicates to be present to ask for positive label
    # on_topic - True if only on topic questions allowed. Else False
    def __init__(self, max_questions, yes_no_prob, max_avg_kappa, min_num_unknown_predicates, on_topic):
        super(StaticPolicy, self).__init__(on_topic)
        self.max_questions = max_questions
        self.yes_no_prob = yes_no_prob
        self.max_avg_kappa = max_avg_kappa
        self.min_num_unknown_predicates = min_num_unknown_predicates
        self.on_topic = on_topic

    # Returns True if asking for a positive example is currently a valid action
    def ask_example_valid(self, dialog_state):
        predicates_queried = dialog_state['labels_acquired'].keys()
        if self.on_topic:
            candidates = set(dialog_state['current_predicates']).difference(predicates_queried)
        else:
            candidates = set(dialog_state['predicates_without_classifiers']).difference(predicates_queried)
        return len(candidates) > self.min_num_unknown_predicates

    # Returns True if asking a yes-no question is currently a valid action
    def yes_no_valid(self, dialog_state):
        if self.on_topic:
            kappas = [kappa for (predicate, kappa) in dialog_state['all_kappas'].items()
                      if predicate in dialog_state['current_predicates']]
        else:
            kappas = [kappa for (predicate, kappa) in dialog_state['all_kappas'].items()]
        num_candidates = len(kappas) + len(dialog_state['predicates_without_classifiers'])
        avg_kappa = sum(kappas) / float(num_candidates)
        return avg_kappa < self.max_avg_kappa

    def get_next_action(self, dialog_state):
        next_action = dict()

        if dialog_state['num_dialog_turns'] >= self.max_questions:
            next_action['action'] = 'make_guess'
            next_action['guess'] = self.get_guess(dialog_state)
            return next_action

        else:
            ask_example_valid = self.ask_example_valid(dialog_state)
            yes_no_valid = self.yes_no_valid(dialog_state)

            if ask_example_valid and yes_no_valid:
                r = random.random()
                if r <= self.yes_no_prob:
                    next_action['action'] = 'ask_label'
                    next_action['predicate'], next_action['region'] = self.get_label_question(dialog_state)
                    return next_action
                else:
                    next_action['action'] = 'ask_positive_example'
                    next_action['predicate'] = self.get_predicate_for_example(dialog_state)
                    return next_action
            elif ask_example_valid:
                next_action['action'] = 'ask_positive_example'
                next_action['predicate'] = self.get_predicate_for_example(dialog_state)
                return next_action
            elif yes_no_valid:
                next_action['action'] = 'ask_label'
                next_action['predicate'], next_action['region'] = self.get_label_question(dialog_state)
                return next_action
            else:
                next_action['action'] = 'make_guess'
                next_action['guess'] = self.get_guess(dialog_state)
                return next_action


if __name__ == '__main__':
    # Instantiates a static policy and saves it as a pickle
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--max-questions', type=int, default=5,
                            help='Max questions before guessing')
    arg_parser.add_argument('--yes-no-prob', type=float, default=0.7,
                            help='Probability of a question being a yes-no, when both types are valid')
    arg_parser.add_argument('--max-avg-kappa', type=float, default=0.1,
                            help='Max avg of Kappa in beam to ask a yes no question')
    arg_parser.add_argument('--min-num-unknown-predicates', type=int, default=10,
                            help='Min number of unknown predicates to have before asking for positive examples')
    arg_parser.add_argument('--on-topic', action="store_true", default=False,
                            help='Ask only on topic questions')
    arg_parser.add_argument('--save-file', type=str, required=True,
                            help='File to save pickled policy')

    args = arg_parser.parse_args()

    policy = StaticPolicy(args.max_questions, args.yes_no_prob, args.max_avg_kappa, args.min_num_unknown_predicates,
                          args.on_topic)

    with open(args.save_file, 'wb') as save_file:
        pickle.dump(policy, save_file)
