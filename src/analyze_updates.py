#!/usr/bin/python

import ast
from sklearn.linear_model import SGDRegressor
import numpy as np


def main():
    updates_file = '/scratch/cluster/aish/rl_for_oal/linear/'

    with open(updates_file) as handle:
        updates = list()
        for line in handle:
            updates.append(ast.literal_eval(line.strip()))

    features = [update['feature'] for update in updates]
    targets = [update['target'] for update in updates]

    feature_names = \
        [
            'Min kappa in current predicates',
            'Max kappa in current predicates',
            'Second max kappa in current predicates',
            'Avg kappa in current predicates',
            'Positive score (normalized) of top region',
            'Positive score (normalized) of second best region',
            'Avg positive score (normalized) of regions',
            'Decision of top classifier for top region',
            'Decision of second best classifier for top region',
            'Decision of top classifier for second best region',
            'Decision of second best classifier for second best region',
            'Avg decision of top classifier',
            'Avg decision of second best classifier',
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
    # Feature 13 is 0-1 for make guess

    features_np = np.array(features)
    features_min = np.amin(features_np, axis=0)
    features_max = np.amax(features_np, axis=0)

    for (idx, feature_name) in enumerate(feature_names):
        print feature_name, ':', features_min[idx], '-', features_max[idx]

    x = raw_input()

    indices_evaluating_guess = [idx for idx in range(len(features)) if features[idx][13] == 1]
    print 'Num indices evaluating make guess =', indices_evaluating_guess
    x = raw_input()

    num_batches = 100
    batch_size = len(features) / num_batches

    classifier = SGDRegressor()

    for batch_num in range(num_batches):
        batch_features = features[batch_num * batch_size: (batch_num + 1) * batch_size]
        batch_targets = targets[batch_num * batch_size: (batch_num + 1) * batch_size]

        batch_features_evaluating_guess = [batch_features[idx] for idx in indices_evaluating_guess
                                           if idx >= batch_num * batch_size
                                           and idx < (batch_num + 1) * batch_size]
        batch_targets_evaluating_guess = [batch_targets[idx] for idx in indices_evaluating_guess
                                          if idx >= batch_num * batch_size
                                          and idx < (batch_num + 1) * batch_size]

        if batch_num > 0:
            preds = classifier.predict(batch_features)
            mse = np.sum(np.array(preds) - np.array(batch_targets))
            print 'Batch', batch_num, ', test mse =', mse

            preds = classifier.predict(batch_features_evaluating_guess)
            mse = np.sum(np.array(preds) - np.array(batch_targets_evaluating_guess))
            print 'Batch', batch_num, ', test guess mse =', mse
            print

        classifier.partial_fit(batch_features, batch_targets)

        preds = classifier.predict(batch_targets)
        mse = np.sum(np.array(preds) - np.array(batch_targets))
        print 'Batch', batch_num, ', train mse =', mse

        preds = classifier.predict(batch_features_evaluating_guess)
        mse = np.sum(np.array(preds) - np.array(batch_targets_evaluating_guess))
        print 'Batch', batch_num, ', train guess mse =', mse
