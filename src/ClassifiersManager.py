#!/usr/bin/python
# Abstracts out classifier operations to allow caching across multiple dialogs from a single policy

import numpy as np
import pylru
import random
import os
from sklearn.linear_model import SGDClassifier
from sklearn.metrics import cohen_kappa_score

from KeyedFileDict import KeyedFileDict

__author__ = 'aishwarya'


class ClassifiersManager:
    # Maintain separately a beam of the bottom-k kappas (k worst classifiers)
    def __init__(self, feature_dict, classifiers_dir, kappas_file, labels_dir,
                 classifiers_cache_size, labels_cache_size):
        self.feature_dict = feature_dict

        # Create LRU caches for accessing classifiers, labels and kappas
        classifiers_dict = KeyedFileDict(classifiers_dir)
        self.classifiers = pylru.WriteThroughCacheManager(classifiers_dict, classifiers_cache_size)

        self.kappas = dict()
        if os.path.isfile(kappas_file):
            with open(kappas_file) as handle:
                self.kappas = dict([tuple(line.split(',')) for line in handle.read().split('\n')])

        labels_dict = KeyedFileDict(labels_dir)
        self.labels = pylru.WriteThroughCacheManager(labels_dict, labels_cache_size)

    # Return kappa if classifier exists else return 0
    def get_kappa(self, predicate):
        if predicate in self.kappas:
            return self.kappas[predicate]
        else:
            return 0.0

    # Return classifier predictions for data points (returns 0 - majority class if no classifier is present)
    def get_decisions(self, predicate, data_points):
        classifier = self.classifiers[predicate]
        if classifier is not None:
            return classifier.predict(data_points)
        else:
            return np.zeros(len(data_points))

    # Return classifier margins for data points (returns 0 - majority class if no classifier is present)
    def get_margins(self, predicate, data_points):
        classifier = self.classifiers[predicate]
        if classifier is not None:
            return classifier.predict(data_points)
        else:
            return np.zeros(len(data_points))

    # Update a classifier with new known labels
    # new_labels is a list of (region_id, 0/1) pairs
    def update_classifier(self, predicate, new_labels):
        classifier = self.classifiers[predicate]
        if classifier is None:
            classifier = SGDClassifier(loss='hinge')

        regions = [region for (region, label) in new_labels]
        labels = [label for (region, label) in new_labels]
        features = None
        for region in regions:
            feature = self.feature_dict[region]
            if features is None:
                features = feature
            else:
                features = np.vstack((features, feature))
        if len(features.shape) == 0:
            features = np.expand_dims(features, 0)
        classifier.partial_fit(features, labels, classes=[0, 1])

        self.classifiers[predicate] = classifier
        if predicate in labels:
            self.labels[predicate] += new_labels
        else:
            self.labels[predicate] = new_labels

    # Recompute kappa using up to max_labels known labels
    def update_kappa(self, predicate, min_labels=5, max_labels=4096):
        classifier = self.classifiers[predicate]
        if classifier is not None:
            # You only need to update kappa if the classifier exists
            known_labels = self.labels[predicate]
            if len(known_labels) > min_labels:
                if len(known_labels) > max_labels:
                    labels_to_use = random.sample(range(len(known_labels)), max_labels)
                    known_labels = known_labels[labels_to_use]
                regions = [region for (region, label) in known_labels]
                labels = [label for (region, label) in known_labels]
                features = None
                for region in regions:
                    feature = self.feature_dict[region]
                    if features is None:
                        features = feature
                    else:
                        features = np.vstack((features, feature))
                if len(features.shape) == 0:
                    features = np.expand_dims(features, 0)
                preds = classifier.predict(features)

                # Compute Kappa and normalize to 0-1
                kappa = (cohen_kappa_score(labels, preds) + 1.0) / 2.0
                self.kappas[predicate] = kappa
