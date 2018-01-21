#!/usr/bin/python
# Basic structure of a policy, and some default functionality

import random
from AbstractPolicy import AbstractPolicy
from argparse import ArgumentParser
from datetime import datetime

__author__ = 'aishwarya'


class StaticPolicy(AbstractPolicy):
    # max_questions - Max questions before a guess
    # yes_no_prob - Probability of choosing a yes no question when both types are valid
    # max_avg_kappa - Ask a yes-no question if average Kappa is below this
    # min_num_unknown_predicates - Min # of unknown predicates to be present to ask for positive label
    # on_topic - True if only on topic questions allowed. Else False
    def __init__(self, save_file, max_questions, yes_no_prob, max_avg_kappa, min_num_unknown_predicates, on_topic):
        super(StaticPolicy, self).__init__(save_file, on_topic, classifier_manager=None)
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
        print 'ask_example', len(candidates), 'candidates'
        return len(candidates) > self.min_num_unknown_predicates

    # Returns True if asking a yes-no question is currently a valid action
    def yes_no_valid(self, dialog_state):
        if self.on_topic:
            kappas = [kappa for (predicate, kappa) in self.classifier_manager.kappas.items()
                      if predicate in dialog_state['current_predicates']]
        else:
            kappas = [kappa for (predicate, kappa) in self.classifier_manager.kappas.items()]
        print 'kappas =', kappas
        num_candidates = len(kappas) + len(dialog_state['predicates_without_classifiers'])
        print 'yes_no', num_candidates, 'candidates'
        if num_candidates == 0:
            return False
        avg_kappa = sum(kappas) / float(num_candidates)
        print 'avg_kappa =', avg_kappa
        return avg_kappa < self.max_avg_kappa

    def get_next_action(self, dialog_state):
        print '\n\t\tIn get_next_action'

        print "dialog_state['current_predicates'] =", dialog_state['current_predicates']
        print "dialog_state['predicates_without_classifiers'] =", dialog_state['predicates_without_classifiers']
        print "dialog_state['labels_acquired'] =", dialog_state['labels_acquired']

        start_time = datetime.now()

        if dialog_state['num_system_turns'] >= self.max_questions:
            print 'Hit max questions'
            prev_time = datetime.now()
            next_action = self.get_guess(dialog_state)
            cur_time = datetime.now()
            # print 'Time to evaluate guess =', str(cur_time - prev_time)

        else:
            print 'Didn\'t hit max questions'
            prev_time = datetime.now()
            ask_example_valid = self.ask_example_valid(dialog_state)
            cur_time = datetime.now()
            # print 'Evaluating ask_example_valid =', str(cur_time - prev_time)
            print 'ask_example_valid =', ask_example_valid

            prev_time = datetime.now()
            yes_no_valid = self.yes_no_valid(dialog_state)
            cur_time = datetime.now()
            # print 'Evaluating yes_no_valid =', str(cur_time - prev_time)
            print 'yes_no_valid =', yes_no_valid

            if ask_example_valid and yes_no_valid:
                r = random.random()
                if r <= self.yes_no_prob:
                    prev_time = datetime.now()
                    next_action = self.get_label_question_candidates(dialog_state, beam_size=1)[0]
                    cur_time = datetime.now()
                    # print 'Getting label question =', str(cur_time - prev_time)
                else:
                    prev_time = datetime.now()
                    next_action = self.get_example_question_candidates(dialog_state, beam_size=1)[0]
                    cur_time = datetime.now()
                    # print 'Getting example question =', str(cur_time - prev_time)
            elif ask_example_valid:
                prev_time = datetime.now()
                next_action = self.get_example_question_candidates(dialog_state, beam_size=1)[0]
                cur_time = datetime.now()
                # print 'Getting example question =', str(cur_time - prev_time)
            elif yes_no_valid:
                prev_time = datetime.now()
                next_action = self.get_label_question_candidates(dialog_state, beam_size=1)[0]
                cur_time = datetime.now()
                # print 'Getting label question =', str(cur_time - prev_time)
            else:
                prev_time = datetime.now()
                next_action = self.get_guess(dialog_state)
                cur_time = datetime.now()
                # print 'Getting guess =', str(cur_time - prev_time)

        cur_time = datetime.now()
        # print 'Total time to get action =', str(cur_time - start_time), '\n'

        print 'Next action: ', next_action['action'], '; press enter:'
        # x = raw_input()

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

    policy = StaticPolicy(args.save_file, args.max_questions, args.yes_no_prob, args.max_avg_kappa, args.min_num_unknown_predicates,
                          args.on_topic)
    policy.save()
