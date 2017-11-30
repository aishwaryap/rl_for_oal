#!/usr/bin/python
# Functions useful to all dialog agents

import numpy as np
import copy
import os
from argparse import ArgumentParser
from datetime import datetime     # For profiling
import pickle

__author__ = 'aishwarya'


class DialogAgent:
    def __init__(self, agent_name, classifier_manager, policy, seen_predicates_file, predicates_with_classifiers_file,
                 log_filename=None):
        self.agent_name = agent_name
        self.classifier_manager = classifier_manager
        self.policy = policy

        # All predicates the agent has ever seen
        self.seen_predicates_file = seen_predicates_file
        if os.path.isfile(self.seen_predicates_file):
            with open(self.seen_predicates_file) as handle:
                self.seen_predicates = handle.read().split('\n')
        else:
            self.seen_predicates = list()

        # All predicates for which a classifier has been fitted
        self.predicates_with_classifiers_file = predicates_with_classifiers_file
        if os.path.isfile(self.predicates_with_classifiers_file):
            with open(self.predicates_with_classifiers_file) as handle:
                self.predicates_with_classifiers = handle.read().split('\n')
        else:
            self.predicates_with_classifiers = list()

        # Fields to maintain dialog state
        self.candidate_regions = None       # Regions under discussion
        self.description = None             # Description to understand
        self.current_predicates = None      # Labels relevant to understanding current description
        self.num_system_turns = None
        self.decisions = None
        self.target_region = None

        # Caching things useful within a dialog
        self.candidate_regions_features = None  # Features of candidate regions
        self.region_contents = None             # Objects and attributes in candidate regions
        self.classifiers_modified = None        # Classifiers that have been modified within this dialog (optimization)

        # Labels acquired (within dialog)
        # This is a dict with label name as key, and (region_id, 0/1 label value) as value
        self.labels_acquired = None

        self.log_file = None
        if log_filename is not None:
            self.log_file = open(log_filename, 'w')

    # Load things that are required at start of an interaction
    # candidate_regions - List of region IDs (int) of candidate regions
    # description - Normalized string description of region
    def setup_task(self, candidate_regions, description, region_contents, target_region):
        self.candidate_regions = candidate_regions
        self.description = description
        self.region_contents = region_contents
        self.target_region = target_region
        self.num_system_turns = 0

        # We can just tokenize to get predicates because descriptions have been preprocessed for stemming
        # and removing stopwords
        self.current_predicates = self.description.split('_')
        self.seen_predicates += self.current_predicates

        self.candidate_regions_features = dict()
        for region in self.candidate_regions:
            self.candidate_regions_features[region] = self.classifier_manager.features_dict[region]
        self.classifiers_modified = self.current_predicates
        self.decisions = dict()
        self.update_decision_scores()

        self.labels_acquired = dict()
        self.classifiers_modified = list()

    def finish_task(self):
        # Precautions to make sure these get reset
        self.candidate_regions = None
        self.description = None
        self.target_region = None
        self.current_predicates = None
        self.num_system_turns = None
        self.candidate_regions_features = None
        self.region_contents = None
        self.labels_acquired = None
        self.classifiers_modified = None

    def update_decision_scores(self):
        predicates_to_update = set(self.current_predicates).intersection(self.classifiers_modified)
        for predicate in predicates_to_update:
            decisions = self.classifier_manager.get_decisions(predicate, self.candidate_regions_features)
            self.decisions[predicate] = decisions
        self.classifiers_modified = list()

    # Simulate the process of asking for an example
    def ask_positive_example(self, predicate):
        # Find regions in the domain of discourse for which this predicate holds
        positive_regions = list()
        for region in self.candidate_regions:
            if predicate in self.region_contents[region]:
                positive_regions.append(region)

        if len(positive_regions) < 1:
            # No positive regions. You get to know that all are negative
            labels_acquired = [(region, 0) for region in self.candidate_regions]
        else:
            # Check which regions have been previously annotated as positive in this dialog
            previous_positive_regions = [region for region in self.candidate_regions if (region, 1)
                                         in self.labels_acquired[predicate]]
            new_positive_regions = set(positive_regions).difference(previous_positive_regions)
            if len(new_positive_regions) < 1:
                labels_acquired = [(region, 0) for region in self.candidate_regions if region
                                   not in previous_positive_regions]
            else:
                chosen_region = np.random.choice(new_positive_regions)
                labels_acquired = [(chosen_region, 1)]

        if predicate not in self.labels_acquired:
            self.labels_acquired[predicate] = labels_acquired
        else:
            self.labels_acquired[predicate] += labels_acquired

        self.classifier_manager.update_classifier(predicate, labels_acquired)
        self.classifier_manager.update_kappa(predicate)
        self.classifiers_modified.append(predicate)
        self.predicates_with_classifiers.append(predicate)
        self.update_decision_scores()

    # Simulate the process of asking for a predicate for a region
    def ask_label(self, predicate, region):
        if predicate in self.region_contents[region]:
            labels_acquired = [(region, 1)]
        else:
            labels_acquired = [(region, 0)]

        if predicate not in self.labels_acquired:
            self.labels_acquired[predicate] = labels_acquired
        else:
            self.labels_acquired[predicate] += labels_acquired

        self.classifier_manager.update_classifier(predicate, labels_acquired)
        self.classifier_manager.update_kappa(predicate)
        self.predicates_with_classifiers.append(predicate)
        self.update_decision_scores()

    def get_dialog_state(self):
        dialog_state = dict()
        dialog_state['num_system_turns'] = self.num_system_turns
        dialog_state['decisions'] = copy.deepcopy(self.decisions)
        dialog_state['current_predicates'] = self.current_predicates
        dialog_state['candidate_regions'] = self.candidate_regions
        dialog_state['target_region'] = self.target_region
        dialog_state['all_kappas'] = self.classifier_manager.kappas
        dialog_state['current_kappas'] = dict()
        for predicate in self.current_predicates:
            dialog_state['current_kappas'] = self.classifier_manager.get_kappa(predicate)
        dialog_state['labels_acquired'] = copy.deepcopy(self.labels_acquired)
        dialog_state['predicates_without_classifiers'] = [predicate for predicate in self.seen_predicates
                                                          if predicate not in self.predicates_with_classifiers]
        return dialog_state

    def run_dialog(self, candidate_regions, target_region, description, region_contents):
        start_time = datetime.now()

        if self.log_file is not None:
            self.log_file.write('candidate_regions = ' + str(candidate_regions) + '\n')
            self.log_file.write('target_region = ' + str(target_region) + '\n')
            self.log_file.write('description = ' + str(description) + '\n')
            self.log_file.write('region_contents = ' + str(region_contents) + '\n')

        time_before_setup = datetime.now()
        self.setup_task(candidate_regions, description, region_contents, target_region)
        if self.log_file is not None:
            self.log_file.write('Time for setup = ' + format(datetime.now() - time_before_setup) + '\n')

        dialog_complete = False
        dialog_stats = dict()
        dialog_stats['agent_name'] = self.agent_name
        dialog_stats['num_regions'] = len(candidate_regions)

        while not dialog_complete:
            turn_start_time = datetime.now()

            prev_dialog_state = self.get_dialog_state()
            next_action = self.policy.get_next_action(prev_dialog_state)

            if next_action['action'] == 'make_guess':
                guess = next_action['guess']
                if guess == target_region:
                    dialog_stats['success'] = 1
                else:
                    dialog_stats['success'] = 0
                dialog_complete = True
                dialog_stats['num_system_turns'] = self.num_system_turns

            elif next_action['action'] == 'ask_positive_example':
                self.ask_positive_example(next_action['predicate'])

            elif next_action['action'] == 'ask_label':
                self.ask_label(next_action['predicate'], next_action['region'])

            else:
                raise RuntimeError('Invalid action :' + str(next_action['action']))

            self.num_system_turns += 1
            if dialog_complete:
                next_dialog_state = None
            else:
                next_dialog_state = self.get_dialog_state()

            self.policy.update(prev_dialog_state, next_action, next_dialog_state)

            if self.log_file is not None:
                self.log_file.write('Turn ' + str(self.num_system_turns - 1)
                                    + ' time = ' + format(datetime.now() - turn_start_time) + '\n')

        self.finish_task()

        if self.log_file is not None:
            self.log_file.write('Dialog time = ' + format(datetime.now() - start_time) + '\n')
            self.log_file.write('--------------------------------------------------------------\n\n')

        return dialog_stats

    def shutdown(self):
        if self.log_file is not None:
            self.log_file.close()

        with open(self.seen_predicates_file, 'w') as handle:
            handle.write('\n'.join(self.seen_predicates))

        with open(self.predicates_with_classifiers_file, 'w') as handle:
            handle.write('\n'.join(self.predicates_with_classifiers))


if __name__ == '__main__':
    # Instantiates a dialog agent ans saves it as a pickle
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--agent-name', type=str, required=True,
                            help='Agent name')
    arg_parser.add_argument('--policy-file', type=str, required=True,
                            help='Pickled policy')
    arg_parser.add_argument('--seen-predicates-file', type=str, required=True,
                            help='Text file to track seen predicates')
    arg_parser.add_argument('--predicates-with-classifiers-file', type=str, required=True,
                            help='Text file to track predicates with classifiers')
    arg_parser.add_argument('--log-filename', type=str, required=True,
                            help='Log file')
    arg_parser.add_argument('--save-file', type=str, required=True,
                            help='File to save pickled agent')

    args = arg_parser.parse_args()

    with open(args.policy_file, 'rb') as policy_file:
        loaded_policy = pickle.load(policy_file)

    dialog_agent = DialogAgent(args.agent_name, None, loaded_policy, args.seen_predicates_file,
                               args.predicates_with_classifiers_file, args.log_filename)

    with open(args.save_file, 'wb') as save_file:
        pickle.dump(dialog_agent, save_file)
