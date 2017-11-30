#!/usr/bin/python
# Basic structure of a policy, and some default functionality

import numpy as np

__author__ = 'aishwarya'


class AbstractPolicy:
    def __init__(self, on_topic, classifier_manager):
        self.on_topic = on_topic
        self.classifier_manager = classifier_manager

    def get_guess(self, dialog_state):
        positive_scores = np.zeros(len(dialog_state['candidate_regions']))
        negative_scores = np.zeros(len(dialog_state['candidate_regions']))
        for predicate in dialog_state['decisions']:
            if dialog_state['decisions'][predicate] > 0:
                positive_scores += dialog_state['current_kappas'][predicate]
            else:
                negative_scores += dialog_state['current_kappas'][predicate]
        scores = positive_scores / (positive_scores + negative_scores)
        scores = scores.tolist()
        max_score = max(scores)
        max_score_idx = scores.index(max_score)
        return dialog_state['candidate_regions'][max_score_idx], max_score

    # Return regions that haven't been labelled in the current dialog for this predicate
    def get_label_question(self, dialog_state):
        if self.on_topic:
            unknown_cur_dialog_predicates = [predicate for predicate in dialog_state['current_predicates']
                                             if predicate in dialog_state['predicates_without_classifiers']]
            known_cur_dialog_predicates = [predicate for predicate in dialog_state['current_predicates']
                                           if predicate in dialog_state['all_kappas']]
            predicates = unknown_cur_dialog_predicates + known_cur_dialog_predicates
            prob_numerators = [1.0] * len(unknown_cur_dialog_predicates) + \
                              [(1.0 - dialog_state['all_kappas'][predicate])
                               for predicate in known_cur_dialog_predicates]
        else:
            known_predicates = [predicate for predicate in dialog_state['all_kappas'].keys()]
            predicates = dialog_state['predicates_without_classifiers'] + known_predicates
            # Sample a predicate with probability proportional to 1 - confidence in lowest confidence object
            prob_numerators = [1.0] * len(dialog_state['predicates_without_classifiers']) + \
                              [(1.0 - dialog_state['all_kappas'][predicate]) for predicate in known_predicates]

        probs = [(v / sum(prob_numerators)) for v in prob_numerators]
        predicate = np.random.choice(predicates, p=probs)

        if predicate not in dialog_state['labels_acquired']:
            candidate_regions = dialog_state['candidate_regions']
        else:
            regions_labelled = [region for (region, label) in dialog_state['labels_acquired'][predicate]]
            candidate_regions = set(dialog_state['candidate_regions']).difference(regions_labelled)

        region = np.random.choice(candidate_regions)
        return predicate, region

    def get_predicate_for_example(self, dialog_state):
        predicates_queried = dialog_state['labels_acquired'].keys()
        if self.on_topic:
            candidates = set(dialog_state['current_predicates']).difference(predicates_queried)
        else:
            candidates = set(dialog_state['predicates_without_classifiers']).difference(predicates_queried)
        return np.random.choice(candidates)

    # By default update does nothing
    def update(self, prev_dialog_state, next_action, next_dialog_state):
        pass