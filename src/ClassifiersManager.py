#!/usr/bin/python
# Abstracts out classifier operations to allow caching across multiple dialogs from a single policy

import numpy as np
import pylru
import os
from sklearn.linear_model import SGDClassifier
from sklearn.metrics import cohen_kappa_score

from KeyedFileDict import KeyedFileDict

__author__ = 'aishwarya'


class ClassifiersManager:
    # Maintain separately a beam of the bottom-k kappas (k worst classifiers)
    def __init__(self, feature_dict, classifiers_dir, kappas_file, train_labels_dir, val_labels_dir, densities, nbrs,
                 classifiers_cache_size, labels_cache_size, min_labels_before_val_set, val_label_fraction,
                 max_labels_in_val_set):
        self.feature_dict = feature_dict
        self.densities = densities
        self.nbrs = nbrs

        # Create LRU caches for accessing classifiers, labels and kappas
        classifiers_dict = KeyedFileDict(classifiers_dir, loading_mode='pickle')
        #self.classifiers = pylru.WriteThroughCacheManager(classifiers_dict, classifiers_cache_size)
        self.classifiers = classifiers_dict

        self.kappas = dict()
        if os.path.isfile(kappas_file):
            with open(kappas_file) as handle:
                self.kappas = dict([tuple(line.split(',')) for line in handle.read().split('\n')])

        train_labels_dict = KeyedFileDict(train_labels_dir, loading_mode='pickle')
        self.train_labels = pylru.WriteThroughCacheManager(train_labels_dict, labels_cache_size)
        val_labels_dict = KeyedFileDict(val_labels_dir, loading_mode='pickle')
        self.val_labels = pylru.WriteThroughCacheManager(val_labels_dict, labels_cache_size)
        self.min_labels_before_val_set = min_labels_before_val_set
        self.val_label_fraction = val_label_fraction
        self.max_labels_in_val_set = max_labels_in_val_set

    def get_initial_classifier(self):
        return SGDClassifier(loss='hinge')

    # Return kappa if classifier exists else return 0
    def get_kappa(self, predicate):
        if predicate in self.kappas.keys():
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
            classifier = self.get_initial_classifier()

        new_val_labels = list()
        if predicate not in self.train_labels.keys():
            self.train_labels[predicate] = new_labels
            new_train_labels = new_labels
        elif len(self.train_labels[predicate]) <= self.min_labels_before_val_set or \
                (predicate in self.val_labels.keys() and len(self.val_labels[predicate]) > self.max_labels_in_val_set):
            self.train_labels[predicate] += new_labels
            new_train_labels = new_labels
        else:
            random_nums = np.random.random(size=len(new_labels))
            new_train_labels = [label for (label, idx) in enumerate(new_labels)
                                if random_nums[idx] > self.val_label_fraction]
            new_val_labels = [label for (label, idx) in enumerate(new_labels)
                              if random_nums[idx] <= self.val_label_fraction]
            self.train_labels[predicate] += new_train_labels
            if predicate not in self.val_labels.keys():
                self.val_labels[predicate] = new_val_labels
            else:
                self.val_labels[predicate] += new_val_labels

        if len(new_train_labels) > 0:
            regions = [region for (region, label) in new_train_labels]
            labels = [label for (region, label) in new_train_labels]
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

        if predicate in self.val_labels.keys():
            self.compute_val_set_kappa(predicate)
        else:
            self.compute_crossval_kappa(predicate)

    # Compute kappa on val set
    def compute_val_set_kappa(self, predicate):
        classifier = self.classifiers[predicate]
        if classifier is not None and predicate in self.val_labels.keys():
            regions = [region for (region, label) in self.val_labels[predicate]]
            labels = [label for (region, label) in self.val_labels[predicate]]
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

    # Compute kappa by leave one out cross validation on train set
    def compute_crossval_kappa(self, predicate):
        if predicate in self.train_labels.keys():
            regions = [region for (region, label) in self.train_labels[predicate]]
            labels = [label for (region, label) in self.train_labels[predicate]]
            features = None
            for region in regions:
                feature = self.feature_dict[region]
                if features is None:
                    features = feature
                else:
                    features = np.vstack((features, feature))
            if len(features.shape) == 1:
                features = np.expand_dims(features, 0)

            preds = list()
            for idx in range(len(labels)):
                classifier = self.get_initial_classifier()
                train_features = np.vstack((features[:idx, :], features[idx+1:, :]))
                train_labels = labels[:idx] + labels[idx+1:]
                classifier.fit(train_features, train_labels)
                pred = classifier.predict(features[idx, :])
                preds.append(pred)

            # Compute Kappa and normalize to 0-1
            kappa = (cohen_kappa_score(labels, preds) + 1.0) / 2.0
            self.kappas[predicate] = kappa
