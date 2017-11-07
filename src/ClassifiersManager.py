#!/usr/bin/python
# Abstracts out classifier operations to allow caching across multiple dialogs from a single policy

import numpy as np
import pickle
import pylru
import random
from argparse import ArgumentParser
from sklearn.linear_model import SGDClassifier
from sklearn.metrics import cohen_kappa_score

from KeyedFileDict import KeyedFileDict

__author__ = 'aishwarya'


class ClassifiersManager:
    def __init__(self, feature_dict, classifiers_dir, kappas_dir, labels_dir,
                 classifiers_cache_size, kappas_cache_size, labels_cache_size):
        self.feature_dict = feature_dict

        # Create LRU caches for accessing classifiers, labels and kappas
        classifiers_dict = KeyedFileDict(classifiers_dir)
        self.classifiers = pylru.WriteThroughCacheManager(classifiers_dict, classifiers_cache_size)

        kappas_dict = KeyedFileDict(kappas_dir)
        self.kappas = pylru.WriteThroughCacheManager(kappas_dict, kappas_cache_size)

        labels_dict = KeyedFileDict(labels_dir)
        self.labels = pylru.WriteThroughCacheManager(labels_dict, labels_cache_size)

    # Return kappa if classifier exists else return 0
    def get_kappa(self, predicate):
        kappa = self.kappas[predicate]
        if kappa is None:
            kappa = 0.0
        return kappa

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
            if len(known_labels) < min_labels:
                return 0.0
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
            self.kappas[predicate] = (cohen_kappa_score(labels, preds) + 1.0) / 2.0


if __name__ == '__main__':
    # Instantiates a classifier manager ans saves it as a pickle
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--feature-dict-file', type=str, required=True,
                            help='File with feature dict LRU cache')

    arg_parser.add_argument('--classifiers-dir', type=str, required=True,
                            help='Path to directory for classifiers')
    arg_parser.add_argument('--kappas-dir', type=str, required=True,
                            help='Path to directory for kappas')
    arg_parser.add_argument('--labels-dir', type=str, required=True,
                            help='Path to directory for collected labels')

    arg_parser.add_argument('--classifiers-cache-size', type=int, default=256,
                            help='Number of classifiers to keep in cache')
    arg_parser.add_argument('--kappas-cache-size', type=int, default=2048,
                            help='Number of kappas to keep in cache')
    arg_parser.add_argument('--labels-cache-size', type=int, default=2048,
                            help='Number of labels to keep in cache')

    arg_parser.add_argument('--save-file', type=str, required=True,
                            help='Path to save as pickle')
    args = arg_parser.parse_args()

    with open(args.feature_dict_file, 'rb') as feature_dict_file:
        feature_dict = pickle.load(feature_dict_file)

    classifiers_manager = ClassifiersManager(feature_dict, args.classifiers_dir, args.kappas_dir, args.labels_dir,
                                             args.classifiers_cache_size, args.kappas_cache_size,
                                             args.labels_cache_size)

    with open(args.save_file, 'wb') as save_file:
        pickle.dump(classifiers_manager, save_file)
