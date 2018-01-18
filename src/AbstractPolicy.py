#!/usr/bin/python
# Basic structure of a policy, and some default functionality

import numpy as np
import math
import pickle
import os

__author__ = 'aishwarya'


class AbstractPolicy(object):
    def __init__(self, save_file, on_topic, classifier_manager):
        self.on_topic = on_topic
        self.classifier_manager = classifier_manager
        self.save_file = save_file

    def get_guess(self, dialog_state):
        positive_scores = np.zeros(len(dialog_state['candidate_regions']))
        negative_scores = np.zeros(len(dialog_state['candidate_regions']))
        for predicate in dialog_state['current_predicates']:
            positive_scores += (dialog_state['decisions'][predicate] > 0) * dialog_state['current_kappas'][predicate]
            negative_scores += (dialog_state['decisions'][predicate] <= 0) * dialog_state['current_kappas'][predicate]
        scores = positive_scores / (positive_scores + negative_scores)
        scores = scores.tolist()
        max_score = max(scores)
        max_score_idx = scores.index(max_score)
        action = {
                    'action' : 'make_guess',
                    'guess' : dialog_state['candidate_regions'][max_score_idx],
                    'score' : max_score
                  }
        return action

    # For a predicate, find regions that aren't labelled, either in the classifier manager or in the dialog
    def get_label_question_regions(self, predicate, dialog_state):
        print '\n\t\tIn get_label_question_regions for', predicate
        previously_labelled_regions = set()
        if predicate in self.classifier_manager.train_labels.keys():
            previously_labelled_regions.union([region for (region, label) in
                                               self.classifier_manager.train_labels[predicate]])
        if predicate in self.classifier_manager.val_labels.keys():
            previously_labelled_regions.union([region for (region, label) in
                                               self.classifier_manager.val_labels[predicate]])
        regions_labelled_in_dialog = set()
        if predicate in dialog_state['labels_acquired']:
            regions_labelled_in_dialog = set([region for (region, label) in dialog_state['labels_acquired'][predicate]])
        output = [region for region in dialog_state['candidate_regions'] if region not in previously_labelled_regions
                  and region not in regions_labelled_in_dialog]
        print '\n\n\nGot regions for', predicate
        return output

    def get_min_margin_region(self, predicate, candidate_regions, dialog_state):
        data_points = np.array([dialog_state['candidate_regions_features'][region] for region in candidate_regions])
        margins = self.classifier_manager.get_margins(predicate, data_points).tolist()
        min_margin = min(margins)
        min_margin_region = candidate_regions[margins.index(min_margin)]
        return min_margin_region

    # Find valid label questions
    def get_label_question_candidates(self, dialog_state, beam_size=None):
        print '\n\t\t\tIn get_label_question_candidates'
        if self.on_topic:
            unknown_cur_dialog_predicates = [predicate for predicate in dialog_state['current_predicates']
                                             if predicate in dialog_state['predicates_without_classifiers']]
            known_cur_dialog_predicates = [predicate for predicate in dialog_state['current_predicates']
                                           if predicate in self.classifier_manager.kappas.keys()]
            predicates = unknown_cur_dialog_predicates + known_cur_dialog_predicates
            prob_numerators = [1.0] * len(unknown_cur_dialog_predicates) + \
                              [(1.0 - self.classifier_manager.kappas[predicate])
                               for predicate in known_cur_dialog_predicates]
        else:
            known_predicates = [predicate for predicate in self.classifier_manager.kappas.keys()]
            predicates = dialog_state['predicates_without_classifiers'] + known_predicates
            # Sample a predicate with probability proportional to 1 - confidence in lowest confidence object
            prob_numerators = [1.0] * len(dialog_state['predicates_without_classifiers']) + \
                              [(1.0 - self.classifier_manager.kappas[predicate]) for predicate in known_predicates]

        print '\t\t\tGot predicates'

        questions = list()
        if beam_size is None:
            for predicate in predicates:
                possible_regions = self.get_label_question_regions(predicate, dialog_state)
                questions += [(predicate, region) for region in possible_regions]

        else:
            if len(predicates) > beam_size:
                probs = [(v / sum(prob_numerators)) for v in prob_numerators]
                selected_predicates = np.random.choice(predicates, p=probs, size=beam_size, replace=False)
                for predicate in selected_predicates:
                    possible_regions = self.get_label_question_regions(predicate, dialog_state)
                    min_margin_region = self.get_min_margin_region(predicate, possible_regions, dialog_state)
                    questions += [(predicate, min_margin_region)]
            else:
                # If the beam is larger than the number of predicates, add the smallest number of questions per
                # predicate that will make it longer than the beam
                possible_questions = list()
                probs = list()
                num_regions_per_predicate = int(math.ceil(beam_size / float(len(predicates))))
                for (predicate_idx, predicate) in enumerate(predicates):
                    possible_regions = self.get_label_question_regions(predicate, dialog_state)
                    predicate_questions = list()
                    if len(possible_regions) < num_regions_per_predicate:
                        predicate_questions = [(predicate, region) for region in possible_regions]
                    else:
                        data_points = np.array(
                            [dialog_state['candidate_regions_features'][region] for region in possible_regions])
                        margins = self.classifier_manager.get_margins(predicate, data_points)
                        margins_argsort = np.argsort(margins).tolist()
                        predicate_questions += [(predicate, region) for region in
                                                possible_regions[margins_argsort[:num_regions_per_predicate]]]
                    possible_questions += predicate_questions
                    probs += [prob_numerators[predicate_idx] / sum(prob_numerators)] * len(predicate_questions)

                if beam_size > len(possible_questions):
                    questions = possible_questions
                else:
                    questions = np.random.choice(possible_questions, p=probs, size=beam_size, replace=False)

        question_actions = [{'action' : 'ask_label', 'predicate': predicate, 'region' : region}
                            for (predicate, region) in questions]
        return question_actions

    def get_example_question_candidates(self, dialog_state, beam_size=None):
        predicates_queried = dialog_state['labels_acquired'].keys()
        if self.on_topic:
            candidates = set(dialog_state['current_predicates']).difference(predicates_queried)
        else:
            candidates = set(dialog_state['predicates_without_classifiers']).difference(predicates_queried)

        if beam_size is None or beam_size > len(candidates):
            chosen_predicates = candidates
        else:
            chosen_predicates = np.random.choice(list(candidates), size=beam_size, replace=False)

        question_actions = [{'action': 'ask_positive_example', 'predicate': predicate}
                            for predicate in chosen_predicates]
        return question_actions

    # By default update does nothing
    def update(self, prev_dialog_state, next_action, next_dialog_state, reward):
        pass

    def save(self):
        self.classifier_manager = None
        with open(self.save_file, 'wb') as handle:
            pickle.dump(self, handle)
