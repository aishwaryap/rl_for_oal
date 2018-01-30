#!/usr/bin/python
# Functions useful to all dialog agents

import numpy as np
import copy
import os
from argparse import ArgumentParser
from datetime import datetime     # For profiling
import pickle

# Imports for unpickling
from StaticPolicy import StaticPolicy
from RLPolicy import RLPolicy

__author__ = 'aishwarya'


class DialogAgent:
    def __init__(self, agent_name, classifier_manager, policy, seen_predicates_file, predicates_with_classifiers_file,
                 per_turn_reward, success_reward, failure_reward, max_turns,
                 log_filename=None):
        self.agent_name = agent_name
        self.classifier_manager = classifier_manager
        self.policy = policy

        self.per_turn_reward = per_turn_reward
        self.success_reward = success_reward
        self.failure_reward = failure_reward
        self.max_turns = max_turns

        # All predicates the agent has ever seen
        self.seen_predicates_file = seen_predicates_file
        if os.path.isfile(self.seen_predicates_file):
            with open(self.seen_predicates_file) as handle:
                self.seen_predicates = set(handle.read().split('\n'))
        else:
            self.seen_predicates = set()

        # All predicates for which a classifier has been fitted
        self.predicates_with_classifiers_file = predicates_with_classifiers_file
        if os.path.isfile(self.predicates_with_classifiers_file):
            with open(self.predicates_with_classifiers_file) as handle:
                self.predicates_with_classifiers = set(handle.read().split('\n'))
        else:
            self.predicates_with_classifiers = set()

        self.predicates_without_classifiers = set(self.seen_predicates).difference(
                                                  self.predicates_with_classifiers)

        # Fields to maintain dialog state
        self.candidate_regions = None       # Regions under discussion
        self.description = None             # Description to understand
        self.current_predicates = None      # Labels relevant to understanding current description
        self.num_system_turns = None
        self.decisions = None
        self.target_region = None

        # Caching things useful within a dialog
        self.candidate_regions_features = None  # Features of candidate regions
        self.candidate_regions_nbrs = None      # Nearest neighbours of candidate regions
        self.candidate_regions_densities = None # Densities of candidate regions
        self.region_contents = None             # Objects and attributes in candidate regions

        # Labels acquired (within dialog)
        # This is a dict with label name as key, and (region_id, 0/1 label value) as value
        self.labels_acquired = None

        # Some cross dialog stats that the agent accumulates over time
        self.num_dialogs_completed = 0
        self.num_dialogs_successful = 0
        self.total_num_system_turns = 0     # Number of system turns across all dialogs
        self.predicate_uses = dict()        # Number of times a predicate has occurred in target descriptions
        self.predicate_successes = dict()   # Number of successful dialogs per predicate in target descriptions

        self.log_filename = log_filename

    def log(self, log_str):
        if self.log_filename is not None:
            with open(self.log_filename, 'a') as handle:
                handle.write(log_str + '\n')

    # Load things that are required at start of an interaction
    # candidate_regions - List of region IDs (int) of candidate regions
    # description - Normalized string description of region
    def setup_task(self, candidate_regions, description, region_contents, target_region):
        prev_time = datetime.now()

        self.candidate_regions = candidate_regions
        self.description = description
        self.region_contents = region_contents
        self.target_region = target_region
        self.num_system_turns = 0

        # We can just tokenize to get predicates because descriptions have been preprocessed for stemming
        # and removing stopwords
        self.current_predicates = self.description.split('_')
        self.seen_predicates = self.seen_predicates.union(self.current_predicates)
        for predicate in self.current_predicates:
            if predicate not in self.predicates_with_classifiers:
                self.predicates_without_classifiers.add(predicate)

        cur_time = datetime.now()
        # print 'Initial assignments: ' + str(cur_time - prev_time)
        prev_time = datetime.now()

        self.candidate_regions_features = dict()
        self.candidate_regions_densities = dict()
        self.candidate_regions_nbrs = dict()
        for region in self.candidate_regions:
            iter_prev_time = datetime.now()
            self.candidate_regions_features[region] = self.classifier_manager.feature_dict[region]
            iter_cur_time = datetime.now()
            # print '\t\tTime to fetch features = ' + str(iter_cur_time - iter_prev_time)
            iter_prev_time = datetime.now()
            self.candidate_regions_densities[region] = self.classifier_manager.densities[region]
            iter_cur_time = datetime.now()
            # print '\t\tTime to fetch density = ' + str(iter_cur_time - iter_prev_time)
            iter_prev_time = datetime.now()
            self.candidate_regions_nbrs[region] = self.classifier_manager.nbrs[region]
            iter_cur_time = datetime.now()
            # print '\t\tTime to fetch nbrs = ' + str(iter_cur_time - iter_prev_time)
            iter_prev_time = datetime.now()

        cur_time = datetime.now()
        # print 'Fetching region properties: ' + str(cur_time - prev_time)
        prev_time = datetime.now()

        self.decisions = dict()
        self.get_decision_scores()
        self.labels_acquired = dict()

        cur_time = datetime.now()
        # print 'Completing setup: ' + str(cur_time - prev_time)

    def finish_task(self):
        # Precautions to make sure these get reset
        self.candidate_regions = None
        self.description = None
        self.target_region = None
        self.current_predicates = None
        self.num_system_turns = None
        self.candidate_regions_features = None
        self.candidate_regions_densities = None
        self.candidate_regions_nbrs = None
        self.region_contents = None
        self.labels_acquired = None

    def update_decision_score(self, predicate):
        data_points = np.array([self.candidate_regions_features[region] for region in self.candidate_regions])
        decisions = self.classifier_manager.get_decisions(predicate, data_points)
        self.decisions[predicate] = decisions

    def get_decision_scores(self):
        data_points = np.array([self.candidate_regions_features[region] for region in self.candidate_regions])
        for predicate in self.current_predicates:
            decisions = self.classifier_manager.get_decisions(predicate, data_points)
            self.decisions[predicate] = decisions

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
            previous_positive_regions = list()
            if predicate in self.labels_acquired:
                previous_positive_regions = [region for region in self.candidate_regions if (region, 1)
                                             in self.labels_acquired[predicate]]
            new_positive_regions = list(set(positive_regions).difference(previous_positive_regions))
            if len(new_positive_regions) < 1:
                labels_acquired = [(region, 0) for region in self.candidate_regions if region
                                   not in previous_positive_regions]
            else:
                chosen_region = np.random.choice(new_positive_regions)
                labels_acquired = [(chosen_region, 1)]
        self.log('\tLabels acquired = ' + str(labels_acquired))

        if predicate not in self.labels_acquired:
            self.labels_acquired[predicate] = labels_acquired
        else:
            self.labels_acquired[predicate] += labels_acquired

        # self.classifier_manager.update_classifier(predicate, labels_acquired)
        # self.update_decision_score(predicate)

        # if predicate not in self.predicates_with_classifiers:
        #     self.predicates_with_classifiers.add(predicate)
        #     self.predicates_without_classifiers.remove(predicate)

    # Update classifiers with labels acquired in this dialog
    def perform_dialog_classifier_updates(self):
        for predicate in self.labels_acquired:
            self.classifier_manager.update_classifier(predicate, self.labels_acquired)
            self.update_decision_score(predicate)

            if predicate not in self.predicates_with_classifiers:
                self.predicates_with_classifiers.add(predicate)
                self.predicates_without_classifiers.remove(predicate)

    # Simulate the process of asking for a predicate for a region
    def ask_label(self, predicate, region):
        if predicate in self.region_contents[region]:
            labels_acquired = [(region, 1)]
        else:
            labels_acquired = [(region, 0)]
        self.log('\tLabels acquired = ' + str(labels_acquired))

        if predicate not in self.labels_acquired:
            self.labels_acquired[predicate] = labels_acquired
        else:
            self.labels_acquired[predicate] += labels_acquired

        # self.classifier_manager.update_classifier(predicate, labels_acquired)
        # self.update_decision_score(predicate)
        #
        # if predicate not in self.predicates_with_classifiers:
        #     self.predicates_with_classifiers.add(predicate)
        #     self.predicates_without_classifiers.remove(predicate)

    def get_dialog_state(self):
        dialog_state = dict()
        dialog_state['num_system_turns'] = self.num_system_turns
        dialog_state['decisions'] = copy.deepcopy(self.decisions)
        dialog_state['current_predicates'] = self.current_predicates
        dialog_state['seen_predicates'] = self.seen_predicates
        dialog_state['candidate_regions'] = self.candidate_regions
        dialog_state['target_region'] = self.target_region
        dialog_state['current_kappas'] = dict()
        for predicate in self.current_predicates:
            dialog_state['current_kappas'][predicate] = self.classifier_manager.get_kappa(predicate)
        dialog_state['labels_acquired'] = copy.deepcopy(self.labels_acquired)
        dialog_state['predicates_without_classifiers'] = list(self.predicates_without_classifiers)
        dialog_state['candidate_regions_features'] = self.candidate_regions_features
        dialog_state['candidate_regions_densities'] = self.candidate_regions_densities
        dialog_state['candidate_regions_nbrs'] = self.candidate_regions_nbrs
        dialog_state['num_dialogs_completed'] = self.num_dialogs_completed
        dialog_state['num_dialogs_successful'] = self.num_dialogs_successful
        dialog_state['predicate_uses'] = self.predicate_uses
        dialog_state['predicate_successes'] = self.predicate_successes
        return dialog_state

    def update_cross_dialog_stats(self, dialog_stats):
        self.num_dialogs_completed += 1
        self.num_dialogs_successful += int(dialog_stats['success'])
        self.total_num_system_turns += dialog_stats['num_system_turns']
        for predicate in self.current_predicates:
            if predicate not in self.predicate_uses:
                self.predicate_uses[predicate] = 1
            else:
                self.predicate_uses[predicate] += 1
        if dialog_stats['success']:
            for predicate in self.current_predicates:
                if predicate not in self.predicate_successes:
                    self.predicate_successes[predicate] = 1
                else:
                    self.predicate_successes[predicate] += 1

    def run_dialog(self, candidate_regions, target_region, description, region_contents, testing=False):
        start_time = datetime.now()

        self.log('candidate_regions = ' + str(candidate_regions))
        self.log('target_region = ' + str(target_region))
        self.log('description = ' + str(description))
        self.log('region_contents = ' + str(region_contents))

        time_before_setup = datetime.now()
        self.setup_task(candidate_regions, description, region_contents, target_region)
        self.log('Time for setup = ' + format(datetime.now() - time_before_setup))
        print 'Time for setup = ' + format(datetime.now() - time_before_setup)

        dialog_complete = False
        dialog_stats = dict()
        dialog_stats['agent_name'] = self.agent_name
        dialog_stats['num_regions'] = len(candidate_regions)

        while not dialog_complete:
            turn_start_time = datetime.now()

            prev_dialog_state = self.get_dialog_state()
            next_action = self.policy.get_next_action(prev_dialog_state)
            self.log('Turn ' + str(self.num_system_turns) + ' action: ' + next_action['action'])

            reward = self.per_turn_reward

            self.num_system_turns += 1
            if next_action['action'] == 'make_guess':
                guess = next_action['guess']
                if guess == target_region:
                    dialog_stats['success'] = 1
                    reward = self.success_reward
                else:
                    dialog_stats['success'] = 0
                    reward = self.failure_reward
                self.log('\tGuess = ' + str(guess))
                self.log('\tSuccess = ' + str(dialog_stats['success'] == 1))
                dialog_complete = True
                dialog_stats['num_system_turns'] = self.num_system_turns

            elif next_action['action'] == 'ask_positive_example':
                self.ask_positive_example(next_action['predicate'])

            elif next_action['action'] == 'ask_label':
                self.ask_label(next_action['predicate'], next_action['region'])

            else:
                raise RuntimeError('Invalid action :' + str(next_action['action']))

            if self.num_system_turns >= self.max_turns:
                dialog_complete = True
                dialog_stats['success'] = 0
                dialog_stats['num_system_turns'] = self.num_system_turns
                reward = self.failure_reward

            if dialog_complete:
                next_dialog_state = None
            else:
                next_dialog_state = self.get_dialog_state()

            if not testing:
                self.policy.update(prev_dialog_state, next_action, next_dialog_state, reward)

            self.log('Turn ' + str(self.num_system_turns - 1)
                     + ' time = ' + format(datetime.now() - turn_start_time))
            print 'Turn ' + str(self.num_system_turns - 1) \
                  + ' time = ' + format(datetime.now() - turn_start_time)

        self.perform_dialog_classifier_updates()
        self.update_cross_dialog_stats(dialog_stats)
        self.finish_task()

        self.log('Dialog time = ' + format(datetime.now() - start_time))
        self.log('--------------------------------------------------------------\n')

        return dialog_stats

    def save(self, save_filename):
        with open(self.seen_predicates_file, 'w') as handle:
            handle.write('\n'.join(self.seen_predicates))

        with open(self.predicates_with_classifiers_file, 'w') as handle:
            handle.write('\n'.join(self.predicates_with_classifiers))

        self.classifier_manager.save()
        self.classifier_manager = None
        self.policy.save()
        self.policy.classifier_manager = None
        with open(save_filename, 'wb') as save_file:
            pickle.dump(self, save_file)


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

    arg_parser.add_argument('--per-turn-reward', type=float, default=-1,
                            help='Reward for non-terminating turns')
    arg_parser.add_argument('--success-reward', type=float, default=100,
                            help='Reward for successful dialog')
    arg_parser.add_argument('--failure-reward', type=float, default=-100,
                            help='Reward for failed dialog')
    arg_parser.add_argument('--max-turns', type=int, default=100,
                            help='Terminate the dialog after this many turns')

    args = arg_parser.parse_args()

    with open(args.policy_file, 'rb') as policy_file:
        loaded_policy = pickle.load(policy_file)

    # Needs to be instantiated without a classifier manager to be pickled
    dialog_agent = DialogAgent(args.agent_name, None, loaded_policy, args.seen_predicates_file,
                               args.predicates_with_classifiers_file, args.per_turn_reward,
                               args.success_reward, args.failure_reward, args.max_turns,
                               args.log_filename)
    dialog_agent.save(args.save_file)
