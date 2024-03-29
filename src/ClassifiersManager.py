#!/usr/bin/python
# Abstracts out classifier operations to allow caching across multiple dialogs from a single policy

import numpy as np
import pylru
import os
from sklearn.linear_model import SGDClassifier
from sklearn.metrics import cohen_kappa_score
from sklearn.metrics import f1_score
from sklearn.utils.class_weight import compute_class_weight
import ast
import math

from KeyedFileDict import KeyedFileDict

__author__ = 'aishwarya'


class ClassifiersManager:
    # Maintain separately a beam of the bottom-k kappas (k worst classifiers)
    def __init__(self, active_train_feature_dict, active_test_feature_dict, classifiers_dir, kappas_file,
                 train_labels_dir, val_labels_dir, active_train_densities, active_test_densities, active_train_nbrs,
                 active_test_nbrs, classifiers_cache_size, labels_cache_size, min_labels_before_val_set,
                 val_label_fraction, max_labels_in_val_set):
        self.active_train_feature_dict = active_train_feature_dict
        self.active_test_feature_dict = active_test_feature_dict
        self.active_train_densities = active_train_densities
        self.active_test_densities = active_test_densities
        self.active_train_nbrs = active_train_nbrs
        self.active_test_nbrs = active_test_nbrs

        # Create LRU caches for accessing classifiers, labels and kappas
        classifiers_dict = KeyedFileDict(classifiers_dir, loading_mode='pickle')
        # self.classifiers = pylru.WriteThroughCacheManager(classifiers_dict, classifiers_cache_size)
        self.classifiers = classifiers_dict

        self.kappas_file = kappas_file
        self.kappas = dict()
        if os.path.isfile(kappas_file):
            with open(kappas_file) as handle:
                ast.literal_eval(handle.read().strip())

        train_labels_dict = KeyedFileDict(train_labels_dir, loading_mode='pickle')
        # self.train_labels = pylru.WriteThroughCacheManager(train_labels_dict, labels_cache_size)
        self.train_labels = train_labels_dict

        val_labels_dict = KeyedFileDict(val_labels_dir, loading_mode='pickle')
        # self.val_labels = pylru.WriteThroughCacheManager(val_labels_dict, labels_cache_size)
        self.val_labels = val_labels_dict

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
        if predicate in self.classifiers.keys():
            classifier = self.classifiers[predicate]
            if classifier is not None:
                return classifier.predict(data_points)
        return np.zeros(len(data_points))

    # Update a classifier with new known labels
    # new_labels is a list of (region_id, 0/1) pairs
    def update_classifier(self, predicate, new_labels):
        classifier = self.classifiers[predicate]
        if classifier is None:
            classifier = self.get_initial_classifier()

        if predicate not in self.train_labels.keys():
            self.train_labels[predicate] = new_labels
            new_train_labels = new_labels
        elif len(self.train_labels[predicate]) <= self.min_labels_before_val_set or \
                (predicate in self.val_labels.keys() and len(self.val_labels[predicate]) > self.max_labels_in_val_set):
            self.train_labels[predicate] += new_labels
            new_train_labels = new_labels
        else:
            new_positive_labels = [(region, label) for (region, label) in new_labels]
            new_negative_labels = [(region, label) for (region, label) in new_labels]
            np.random.shuffle(new_positive_labels)
            np.random.shuffle(new_negative_labels)
            num_positive_val_labels = int(math.floor(self.val_label_fraction * len(new_positive_labels)))
            num_negative_val_labels = int(math.floor(self.val_label_fraction * len(new_negative_labels)))

            new_val_labels = new_positive_labels[:num_positive_val_labels] \
                             + new_negative_labels[:num_negative_val_labels]
            new_train_labels = new_positive_labels[num_positive_val_labels:] \
                               + new_negative_labels[num_negative_val_labels:]
            np.random.shuffle(new_train_labels)
            np.random.shuffle(new_val_labels)

            self.train_labels[predicate] += new_train_labels
            if len(new_val_labels) > 0:
                if predicate not in self.val_labels.keys():
                    self.val_labels[predicate] = new_val_labels
                else:
                    self.val_labels[predicate] += new_val_labels

        if len(new_train_labels) > 0:
            # print 'predicate =', predicate
            # print 'new_train_labels =', new_train_labels
            regions = [region for (region, label) in new_train_labels]
            labels = [label for (region, label) in new_train_labels]

            features = []
            for region in regions:
                if region in self.active_train_feature_dict.keys():
                    feature = self.active_train_feature_dict[region]
                else:
                    feature = self.active_test_feature_dict[region]
                features += [feature]
            features = np.array(features)
            if len(features.shape) == 1:
                features = features.reshape(1, -1)

            train_labels = [label for (region, label) in self.train_labels[predicate]]
            # print 'train_labels =', train_labels
            if np.unique(train_labels).shape[0] < 2:
                class_weights = [0.5, 0.5]
            else:
                class_weights = compute_class_weight('balanced', classes=[0, 1], y=train_labels)
            # print 'class_weights =', class_weights
            # print 'labels =', labels
            sample_weights = [class_weights[label] for label in labels]

            classifier.partial_fit(features, labels, classes=[0, 1], sample_weight=sample_weights)
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
            if len(regions) != len(labels):
                raise RuntimeError('len(regions) = ' + str(len(regions)) + ', len(labels) = ' + str(len(labels)))
            if len(set(labels)) == 2:
                features = list()
                labels_to_use = list()
                for (idx, region) in enumerate(regions):
                    if region in self.active_train_feature_dict.keys():
                        feature = self.active_train_feature_dict[region]
                        features += [feature]
                        labels_to_use.append(labels[idx])
                    elif region in self.active_test_feature_dict.keys():
                        feature = self.active_test_feature_dict[region]
                        features += [feature]
                        labels_to_use.append(labels[idx])
                if len(features) == 0:
                    return
                features = np.array(features)
                if len(features.shape) == 1:
                    features = features.reshape(1, -1)
                preds = classifier.predict(features)

                # Compute Kappa and normalize to 0-1
                # kappa = (cohen_kappa_score(labels, preds, labels=[0, 1]) + 1.0) / 2.0
                kappa = f1_score(labels_to_use, preds)
                # print 'In compute_val_set_kappa, labels = ', labels, ', preds =', preds, ', kappa =', kappa,
                # print 'press enter'
                # x = raw_input()
                self.kappas[predicate] = kappa

    # Compute kappa by leave one out cross validation on train set
    def compute_crossval_kappa(self, predicate):
        if predicate in self.train_labels.keys():
            regions = [region for (region, label) in self.train_labels[predicate]]
            labels = [label for (region, label) in self.train_labels[predicate]]
            if len(set(labels)) == 2:
                features = list()
                labels_to_use = list()
                for (idx, region) in enumerate(regions):
                    if region in self.active_train_feature_dict.keys():
                        feature = self.active_train_feature_dict[region]
                        features += [feature]
                        labels_to_use.append(labels[idx])
                    elif region in self.active_test_feature_dict.keys():
                        feature = self.active_test_feature_dict[region]
                        features += [feature]
                        labels_to_use.append(labels[idx])
                if len(features) == 0:
                    return
                features = np.array(features)
                if len(features.shape) == 1:
                    features = features.reshape(1, -1)

                preds = list()
                for idx in range(len(labels_to_use)):
                    # classifier = self.get_initial_classifier()
                    classifier = SGDClassifier(loss='hinge', class_weight='balanced')
                    train_features = np.vstack((features[:idx, :], features[idx+1:, :]))
                    train_labels = np.array(labels_to_use[:idx] + labels_to_use[idx+1:])
                    if np.unique(train_labels).shape[0] == 2:
                        classifier.fit(train_features, train_labels)
                        pred = classifier.predict(features[idx, :].reshape(1, -1)).tolist()[0]
                        preds.append(pred)
                    else:
                        preds.append(labels_to_use[idx])

                # Compute Kappa and normalize to 0-1
                # kappa = (cohen_kappa_score(labels, preds, labels=[0, 1]) + 1.0) / 2.0
                kappa = f1_score(labels_to_use, preds)
                # print 'In compute_crossval_kappa, labels = ', labels, ', preds =', preds, ', kappa =', kappa,
                # print 'press enter'
                # x = raw_input()
                self.kappas[predicate] = kappa

    def save(self):
        with open(self.kappas_file, 'w') as handle:
            handle.write(str(self.kappas))
