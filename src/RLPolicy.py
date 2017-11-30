#!/usr/bin/python
# Basic structure of a policy, and some default functionality

from sklearn.neural_network import MLPRegressor
from sklearn.linear_model import SGDRegressor
from GuessPredictor import GuessPredictor
from AbstractPolicy import AbstractPolicy

__author__ = 'aishwarya'


class RLPolicy(AbstractPolicy):
    # This should have the same classifier manager as the dialog agent
    def __init__(self, on_topic, classifier_manager, model_type, separate_guess_predictor,
                 initial_guess_predictor=None):
        super(RLPolicy, self).__init__(on_topic, classifier_manager)

        if model_type == 'mlp':
            self.q = MLPRegressor()
        elif model_type == 'linear':
            self.q = SGDRegressor()
        else:
            raise NotImplementedError('Only model types available are \'mlp\' and \'linear\'')

        self.separate_guess_predictor = separate_guess_predictor
        self.guess_predictor = initial_guess_predictor
        if initial_guess_predictor is None:
            self.guess_predictor = GuessPredictor()

        # Feature names for debugging
        if self.separate_guess_predictor:
            self.feature_names = ['guess_success_prob']
        else:
            self.feature_names = self.guess_predictor.feature_names
        self.feature_names = self.feature_names + \
            [
                'Evaluating score of make_guess (0-1)',
                'Evaluating score of ask_positive_example (0-1)',
                'Question is on-topic (0-1)',
                'Predicate has a classifier (0-1)',
                'Margin of object',
                'Density of object',
                'Fraction of k nearest neighbours of the object which are unlabelled',
                'Prev kappa of classifier of predicate',
                'Frequency of use of the predicate - normalized',
                'Number of system turns used - normalized',
                'Fraction of previous dialogs using this predicate that have succeeded'
            ]

    def get_features(self, dialog_state, action):
        feature_vector = list()

        if self.separate_guess_predictor:
            # Guess success prob
            feature_vector.append(self.guess_predictor.get_guess_success_prob(dialog_state))
        else:
            # Get guess features
            feature_vector = feature_vector + self.guess_predictor.get_features(dialog_state)

        # Evaluating score of make_guess (0-1)
        feature_vector.append(float(action['action'] == 'make_guess'))

        # Evaluating score of ask_positive_example (0-1)
        feature_vector.append(float(action['action'] == 'ask_positive_example'))

        # Question is on-topic (0-1)
        feature_vector.append(float(self.on_topic))

        # Predicate has a classifier (0-1)
        feature_vector.append(float(action['predicate'] in dialog_state['predicates_without_classifiers']))

        # Margin of object