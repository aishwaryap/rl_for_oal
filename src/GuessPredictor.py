#!/usr/bin/python
# A classifier to predict whether if a guess is made from the current state, it will be correct
# This is a separate class so that we have one place to control what features are extracted from the dialog state to
# feed into this classifier

from sklearn.neural_network import MLPRegressor
from operator import itemgetter
import numpy as np

__author__ = 'aishwarya'


class GuessPredictor:
    def __init__(self):
        self.predictor = MLPRegressor()

        # Feature names for debugging
        self.feature_names = [
            'Min kappa in current predicates',
            'Max kappa in current predicates',
            'Second max kappa in current predicates',
            'Avg kappa in current predicates',
            'Score (normalized) of top region',
            'Difference between scores of top and second highest region',
            'Difference between top score and avg score',
            'Decision of top classifier for top region',
            'Is decision of top classifier for second best region same as that of top region? (0-1)',
            'Decision of second best classifier for top region',
            'Is decision of second best classifier for second best region same as that of top region? (0-1)',
            'Difference between decision of top classifier for top region and avg decision of the classifier',
            'Difference between decision of second best classifier for top region and avg decision of the classifier'
        ]

        self.fitted = False

    def compute_guess_scores(self, dialog_state):
        positive_scores = np.zeros(len(dialog_state['active_test_regions']))
        negative_scores = np.zeros(len(dialog_state['active_test_regions']))
        for predicate in dialog_state['decisions']:
            if predicate in dialog_state['current_kappas']:
                positive_scores += (dialog_state['decisions'][predicate] == 1) * (1.0 + dialog_state['current_kappas'][predicate])
                negative_scores += (dialog_state['decisions'][predicate] == 0) * 2.0
        scores = positive_scores - negative_scores
        scores = scores.tolist()
        return scores

    def get_features(self, dialog_state):
        feature_vector = list()

        # Obtain and sort kappas of current predicates
        current_kappas = dialog_state['current_kappas'].items()
        current_kappas.sort(key=itemgetter(1))

        # Calculate decision scores of candidate regions
        scores = self.compute_guess_scores(dialog_state)
        max_score = max(scores)
        max_score_indices = [idx for (idx, score) in enumerate(scores) if score == max_score]
        max_score_idx = np.random.choice(max_score_indices)
        second_max_score = max_score
        if len(max_score_indices) > 1:
            max_score_indices.remove(max_score_idx)
            second_max_score_idx = np.random.choice(max_score_indices)
        else:
            second_max_score = sorted(scores)[-2]
            second_max_score_indices = [idx for (idx, score) in enumerate(scores) if score == second_max_score]
            second_max_score_idx = np.random.choice(second_max_score_indices)

        # Min kappa in current predicates
        if len(current_kappas) >= 1:
            feature_vector.append(current_kappas[0][1])
        else:
            feature_vector.append(0.0)

        # Max kappa in current predicates
        if len(current_kappas) >= 1:
            feature_vector.append(current_kappas[-1][1])
        else:
            feature_vector.append(0.0)

        # Second max kappa in current predicates
        if len(current_kappas) >= 2:
            feature_vector.append(current_kappas[-2][1])
        else:
            feature_vector.append(0.0)

        # Avg kappa in current predicates
        if len(current_kappas) >= 1:
            total_kappa = sum([float(kappa_value) for (predicate, kappa_value) in current_kappas])
            feature_vector.append(total_kappa / len(current_kappas))
        else:
            feature_vector.append(0.0)

        # Score (normalized) of top region
        feature_vector.append(max_score)

        # Difference between scores of top and second highest region
        feature_vector.append(max_score - second_max_score)

        # Difference between top score and avg score
        feature_vector.append(max_score - (sum(scores) / len(scores)))

        # Decision of top classifier for top region
        if len(current_kappas) >= 1:
            top_classifier = current_kappas[-1][0]
            feature_vector.append(float(dialog_state['decisions'][top_classifier][max_score_idx] > 0))
        else:
            feature_vector.append(0.0)

        # Is decision of top classifier for second best region same as that of top region?
        if len(current_kappas) >= 1:
            top_classifier = current_kappas[-1][0]
            top_region_decision = (dialog_state['decisions'][top_classifier][max_score_idx] > 0)
            second_region_decision = (dialog_state['decisions'][top_classifier][second_max_score_idx] > 0)
            feature_vector.append(float(top_region_decision != second_region_decision))
        else:
            feature_vector.append(1.0)

        # Decision of second best classifier for top region
        if len(current_kappas) >= 2:
            second_best_classifier = current_kappas[-2][0]
            feature_vector.append(float(dialog_state['decisions'][second_best_classifier][max_score_idx] > 0))
        else:
            feature_vector.append(0.0)

        # Is decision of second best classifier for second best region same as that of top region?
        if len(current_kappas) >= 2:
            second_best_classifier = current_kappas[-2][0]
            top_region_decision = (dialog_state['decisions'][second_best_classifier][max_score_idx] > 0)
            second_region_decision = (dialog_state['decisions'][second_best_classifier][second_max_score_idx] > 0)
            feature_vector.append(float(top_region_decision != second_region_decision))
        else:
            feature_vector.append(1.0)

        # Difference between decision of top classifier for top region and avg decision of the classifier
        if len(current_kappas) >= 1:
            top_classifier = current_kappas[-1][0]
            decisions = [float(x) for x in (dialog_state['decisions'][top_classifier] > 0)]
            top_region_decision = (dialog_state['decisions'][top_classifier][max_score_idx] > 0)
            avg_decision = sum(decisions) / len(decisions)
            feature_vector.append(top_region_decision - avg_decision)
        else:
            feature_vector.append(1.0)

        # Difference between decision of second best classifier for top region and avg decision of the classifier
        if len(current_kappas) >= 2:
            second_best_classifier = current_kappas[-2][0]
            decisions = [float(x) for x in (dialog_state['decisions'][second_best_classifier] > 0)]
            avg_decision = sum(decisions) / len(decisions)
            top_region_decision = (dialog_state['decisions'][second_best_classifier][max_score_idx] > 0)
            feature_vector.append(top_region_decision - avg_decision)
        else:
            feature_vector.append(1.0)

        return feature_vector

    # Return probability that the guess made from current state is correct
    def get_target(self, dialog_state):
        scores = self.compute_guess_scores(dialog_state)
        max_score = max(scores)
        max_score_indices = [idx for (idx, score) in enumerate(scores) if score == max_score]
        target_idx = dialog_state['active_test_regions'].tolist().index(dialog_state['target_region'])
        if target_idx in max_score_indices:
            return 1.0 / len(max_score_indices)
        else:
            return 0.0

    def update(self, dialog_state):
        feature_vector = np.array([self.get_features(dialog_state)])
        if len(feature_vector.shape) == 1:
            feature_vector = feature_vector.reshape(1, -1)
        target = np.array([self.get_target(dialog_state)])
        self.predictor.partial_fit(feature_vector, target)

    def compute_update(self, dialog_state):
        feature_vector = self.get_features(dialog_state)
        target = self.get_target(dialog_state)
        return {'guess_predictor_feature': feature_vector, 'guess_predictor_target': target}

    def perform_updates(self, updates):
        feature_vectors = np.array([update['guess_predictor_feature'] for update in updates])
        if len(feature_vectors.shape) == 1:
            feature_vectors = feature_vectors.reshape(1, -1)
        target_values = np.array([update['guess_predictor_target'] for update in updates])

        self.predictor.partial_fit(feature_vectors, target_values)
        self.fitted = True

    def get_guess_success_prob(self, dialog_state):
        feature_vector = np.array([self.get_features(dialog_state)])
        if len(feature_vector.shape) == 1:
            feature_vector = feature_vector.reshape(1, -1)
        if not self.fitted:
            return 0.0
        success_prob = self.predictor.predict(feature_vector)
        return success_prob
