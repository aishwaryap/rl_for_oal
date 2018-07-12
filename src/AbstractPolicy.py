#!/usr/bin/python
# Basic structure of a policy, and some default functionality

import numpy as np
import math
import pickle
import os

__author__ = 'aishwarya'


class AbstractPolicy(object):
    def __init__(self, save_file, on_topic, classifier_manager, min_prob_weight, max_prob_weight,
                 max_prob_kappa):
        self.on_topic = on_topic
        self.classifier_manager = classifier_manager
        self.save_file = save_file
        self.min_prob_weight = min_prob_weight
        self.max_prob_weight = max_prob_weight
        self.max_prob_kappa = max_prob_kappa

    def get_prob_weight(self, predicate):
        kappa = self.classifier_manager.get_kappa(predicate)
        if kappa < self.max_prob_kappa:
            return self.min_prob_weight + (
                (kappa / self.max_prob_kappa) * float(self.max_prob_weight - self.min_prob_weight))
        else:
            return self.min_prob_weight + (
                ((1.0 - kappa) / (1.0 - self.max_prob_kappa)) * float(self.max_prob_weight - self.min_prob_weight))

    def get_guess(self, dialog_state):
        positive_scores = np.zeros(len(dialog_state['active_test_regions']))
        negative_scores = np.zeros(len(dialog_state['active_test_regions']))
        for predicate in dialog_state['current_predicates']:
            if predicate in dialog_state['current_kappas']:
                positive_scores += (dialog_state['decisions'][predicate] == 1) * (1.0 + dialog_state['current_kappas'][predicate])
                negative_scores += (dialog_state['decisions'][predicate] == 0) * 2.0
        # if np.count_nonzero((positive_scores + negative_scores)) == 0:
        #     max_score = 0
        #     max_score_idx = np.random.choice(range(len(dialog_state['candidate_regions'])))
        # else:
            # scores = positive_scores / (positive_scores + negative_scores)
        scores = positive_scores - negative_scores
        scores = scores.tolist()
        max_score = max(scores)
        max_score_idx = scores.index(max_score)
        action = {
                    'action': 'make_guess',
                    'guess': dialog_state['active_test_regions'][max_score_idx],
                    'score': max_score
                  }
        return action

    # For a predicate, find regions that aren't labelled, either in the classifier manager or in the dialog
    def get_label_question_regions(self, predicate, dialog_state):
        # print '\n\t\tIn get_label_question_regions for', predicate
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
        output = [region for region in dialog_state['active_train_regions'] if region not in previously_labelled_regions
                  and region not in regions_labelled_in_dialog]
        # print '\n\n\nGot regions for', predicate
        return output

    def get_min_margin_region(self, predicate, active_train_regions, dialog_state):
        # print 'In AbstractPolicy.get_min_margin_region'
        data_points = np.array([dialog_state['active_train_regions_features'][region] for region in active_train_regions])
        # print 'data_points.shape = ', data_points.shape
        margins = self.classifier_manager.get_margins(predicate, data_points).tolist()
        # print 'margins = ', margins
        min_margin = min(margins)
        min_margin_region = active_train_regions[margins.index(min_margin)]
        # print 'min_margin_region = ', min_margin_region
        return min_margin_region

    # Find valid label questions
    def get_label_question_candidates(self, dialog_state, beam_size=None):
        # print 'In get_label_question_candidates'
        # print 'type(dialog_agent.policy.classifier_manager) =', type(self.classifier_manager)
        # print 'dialog_agent.policy.classifier_manager.__class__.__name__ =', self.classifier_manager.__class__.__name__
        # print 'dialog_agent.policy.classifier_manager.train_labels.keys() =', \
        #     self.classifier_manager.train_labels.keys()[:10]
        # print 'dialog_agent.policy.classifier_manager.val_labels.keys() =', \
        #     self.classifier_manager.val_labels.keys()[:10]
        # print 'dialog_agent.policy.classifier_manager.kappas.keys() =', \
        #     self.classifier_manager.kappas.keys()[:10]
        # print

        if self.on_topic:
            unknown_cur_dialog_predicates = [predicate for predicate in dialog_state['current_predicates']
                                             if predicate in dialog_state['predicates_without_classifiers']]
            known_cur_dialog_predicates = [predicate for predicate in dialog_state['current_predicates']
                                           if predicate in self.classifier_manager.kappas.keys()]
            predicates = unknown_cur_dialog_predicates + known_cur_dialog_predicates
            # prob_numerators = [1.0] * len(unknown_cur_dialog_predicates) + \
            #                   [(100.0 + 100*self.classifier_manager.kappas[predicate])
            #                    for predicate in known_cur_dialog_predicates]
        else:
            known_predicates = [predicate for predicate in self.classifier_manager.kappas.keys()]
            predicates = dialog_state['predicates_without_classifiers'] + known_predicates
            # Sample a predicate with probability proportional to 1 - confidence in lowest confidence object
            # prob_numerators = [1.0] * len(dialog_state['predicates_without_classifiers']) + \
            # [(100.0 + 100*self.classifier_manager.kappas[predicate]) for predicate in known_predicates]

        # print '\t\t\tpredicates =', predicates
        prob_numerators = [self.get_prob_weight(predicate) for predicate in predicates]

        questions = list()
        if beam_size is None:
            # print '\t\t\tBeam size is None'
            for predicate in predicates:
                possible_regions = self.get_label_question_regions(predicate, dialog_state)
                # print '\t\t\tFor predicate', predicate, 'regions =', possible_regions
                questions += [(predicate, region) for region in possible_regions]
            # print '\t\t\tquestions =', questions

        else:
            if len(predicates) > beam_size:
                # print '\t\t\tlen(predicates) > beam_size'
                probs = [(v / sum(prob_numerators)) for v in prob_numerators]

                while len(questions) < beam_size and len(predicates) > 0:
                    num_questions_needed = min(beam_size - len(questions), len(predicates))
                    selected_predicates = np.random.choice(predicates, p=probs, size=num_questions_needed, replace=False)
                    # print '\t\t\tselected_predicates =', selected_predicates
                    for predicate in selected_predicates:
                        possible_regions = self.get_label_question_regions(predicate, dialog_state)
                        # print '\t\t\tFor predicate', predicate, 'regions =', possible_regions
                        if len(possible_regions) > 0:
                            min_margin_region = self.get_min_margin_region(predicate, possible_regions, dialog_state)
                            questions += [(predicate, min_margin_region)]
                    # print '\t\t\tExited for loop'
                    selected_predicate_indices = [predicates.index(p) for p in selected_predicates]
                    # print '\t\t\tGot selected_predicate_indices'
                    remaining_indices = [idx for idx in range(len(predicates)) if idx not in selected_predicate_indices]
                    # print '\t\t\tGot remaining_indices'
                    predicates = [predicates[idx] for idx in remaining_indices]
                    # print '\t\t\tRemaining predicates =', predicates
                    prob_numerators = [prob_numerators[idx] for idx in remaining_indices]
                    probs = [(v / sum(prob_numerators)) for v in prob_numerators]
                # print '\t\t\tquestions =', questions
            elif len(predicates) > 0:
                # print '\t\t\tlen(predicates) > 0'
                # If the beam is larger than the number of predicates, add the smallest number of questions per
                # predicate that will make it longer than the beam
                possible_questions = list()
                question_prob_numerators = list()
                num_regions_per_predicate = int(math.ceil(beam_size / float(len(predicates))))
                # print 'num_regions_per_predicate =', num_regions_per_predicate
                for (predicate_idx, predicate) in enumerate(predicates):
                    possible_regions = self.get_label_question_regions(predicate, dialog_state)
                    # print '\t\t\tFor predicate', predicate, 'regions =', possible_regions
                    predicate_questions = list()
                    if len(possible_regions) < num_regions_per_predicate:
                        predicate_questions = [(predicate, region) for region in possible_regions]
                    else:
                        data_points = np.array(
                            [dialog_state['active_train_regions_features'][region] for region in possible_regions])
                        margins = self.classifier_manager.get_margins(predicate, data_points)
                        margins_argsort = np.argsort(margins).tolist()
                        predicate_questions += [(predicate, region) for region in
                                                [possible_regions[x] for x in margins_argsort[:num_regions_per_predicate]]]
                    possible_questions += predicate_questions
                    question_prob_numerators += [prob_numerators[predicate_idx]] * len(predicate_questions)

                if beam_size > len(possible_questions):
                    # print '\t\t\tbeam_size > len(possible_questions)'
                    questions = possible_questions
                else:
                    # print '\t\t\tElse of beam_size > len(possible_questions)'
                    question_indices = range(len(possible_questions))
                    probs = [v / float(sum(question_prob_numerators)) for v in question_prob_numerators]
                    chosen_question_indices = np.random.choice(question_indices, p=probs, size=beam_size, replace=False)
                    questions = [possible_questions[idx] for idx in chosen_question_indices]
                # print '\t\t\tquestions =', questions

        question_actions = [{'action': 'ask_label', 'predicate': predicate, 'region': region}
                            for (predicate, region) in questions]

        # print '\n Label question candidates:', question_actions, '\n'

        return question_actions

    def get_example_question_candidates(self, dialog_state, beam_size=None):
        # predicates_queried = dialog_state['labels_acquired'].keys()
        # if self.on_topic:
        #     candidates = set(dialog_state['current_predicates']).difference(predicates_queried)
        # else:
        #     candidates = set(dialog_state['predicates_without_classifiers']).difference(predicates_queried)
        candidates = dialog_state['seen_predicates']

        if beam_size is None or beam_size > len(candidates):
            chosen_predicates = candidates
        else:
            chosen_predicates = np.random.choice(list(candidates), size=beam_size, replace=False)

        question_actions = [{'action': 'ask_positive_example', 'predicate': predicate}
                            for predicate in chosen_predicates]
        # print '\n Example question candidates:', question_actions, '\n'
        return question_actions

    # By default update does nothing
    def update(self, prev_dialog_state, next_action, next_dialog_state, reward):
        pass

    def save(self):
        classifier_manager = self.classifier_manager
        self.classifier_manager = None
        with open(self.save_file, 'wb') as handle:
            pickle.dump(self, handle)
        self.classifier_manager = classifier_manager

    def compute_update(self, prev_dialog_state, next_action, next_dialog_state, reward):
        pass

    def perform_updates(self, updates):
        pass