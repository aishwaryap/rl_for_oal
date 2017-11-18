#!/usr/bin/python
# Functions useful to all dialog agents

import numpy as np
import copy
from datetime import datetime     # For profiling

__author__ = 'aishwarya'


class DialogAgent:
    def __init__(self, agent_name, classifier_manager, policy, seen_predicates, predicates_with_classifiers,
                 per_turn_reward, correct_guess_reward, wrong_guess_reward, log_filename=None):
        self.agent_name = agent_name
        self.classifier_manager = classifier_manager
        self.policy = policy

        self.per_turn_reward = per_turn_reward
        self.correct_guess_reward = correct_guess_reward
        self.wrong_guess_reward = wrong_guess_reward

        # All predicates the agent has ever seen
        self.seen_predicates = seen_predicates
        # All predicates for which a classifier has been fitted
        self.predicates_with_classifiers = predicates_with_classifiers

        # Fields to maintain dialog state
        self.candidate_regions = None       # Regions under discussion
        self.description = None             # Description to understand
        self.current_predicates = None      # Labels relevant to understanding current description
        self.num_system_turns = None
        self.decision_scores = None

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
    def setup_task(self, candidate_regions, description, region_contents):
        self.candidate_regions = candidate_regions
        self.description = description
        self.region_contents = region_contents
        self.num_system_turns = 0

        # We can just tokenize to get predicates because descriptions have been preprocessed for stemming
        # and removing stopwords
        self.current_predicates = self.description.split('_')
        self.seen_predicates += self.current_predicates

        self.candidate_regions_features = dict()
        for region in self.candidate_regions:
            self.candidate_regions_features[region] = self.classifier_manager.features_dict[region]
        self.classifiers_modified = self.current_predicates
        self.decision_scores = dict()
        self.update_decision_scores()

        self.labels_acquired = dict()
        self.classifiers_modified = list()

    def finish_task(self):
        # Precautions to make sure these get reset
        self.candidate_regions = None
        self.description = None
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
            kappa = self.classifier_manager.get_kappa(predicate)
            self.decision_scores[predicate] = (kappa * decisions)
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

    # Return regions that haven't been labelled in the current dialog for this predicate
    def get_candidates_for_label_question(self, predicate):
        if predicate not in self.labels_acquired:
            return self.candidate_regions
        else:
            regions_labelled = [region for (region, label) in self.labels_acquired[predicate]]
            return set(self.candidate_regions).difference(regions_labelled)

    # This is mainly needed only in a full RL formalism
    def get_dialog_state(self):
        dialog_state = dict()
        dialog_state['num_system_turns'] = self.num_system_turns
        dialog_state['decision_scores'] = copy.deepcopy(self.decision_scores)
        dialog_state['current_predicates'] = self.current_predicates
        dialog_state['candidate_regions'] = self.candidate_regions
        dialog_state['kappas_beam'] = copy.deepcopy(self.classifier_manager.kappas_beam)
        return dialog_state

    def run_dialog(self, candidate_regions, target_region, description, region_contents):
        start_time = datetime.now()

        if self.log_file is not None:
            self.log_file.write('candidate_regions = ' + str(candidate_regions) + '\n')
            self.log_file.write('target_region = ' + str(target_region) + '\n')
            self.log_file.write('description = ' + str(description) + '\n')
            self.log_file.write('region_contents = ' + str(region_contents) + '\n')

        time_before_setup = datetime.now()
        self.setup_task(candidate_regions, description, region_contents)
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
                guess = self.make_guess()
                if guess == target_region:
                    reward = self.correct_guess_reward
                    dialog_stats['success'] = 1
                else:
                    reward = self.wrong_guess_reward
                    dialog_stats['success'] = 0
                dialog_complete = True
                dialog_stats['num_system_turns'] = self.num_system_turns

            elif next_action['action'] == 'ask_positive_example':
                self.ask_positive_example(next_action['predicate'])
                reward = self.per_turn_reward

            elif next_action['action'] == 'ask_label':
                self.ask_label(next_action['predicate'], next_action['region'])
                reward = self.per_turn_reward

            else:
                raise RuntimeError('Invalid action :' + str(next_action['action']))

            self.num_system_turns += 1
            if dialog_complete:
                next_dialog_state = None
            else:
                next_dialog_state = self.get_dialog_state()

            self.policy.update(prev_dialog_state, next_action, reward, next_dialog_state)

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