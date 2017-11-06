#!/usr/bin/python
# Abstracts out classifier operations to allow caching across multiple dialogs from a single policy

import os
import numpy as np
import pickle
from argparse import ArgumentParser

__author__ = 'aishwarya'


class ClassifiersManager:
    def __init__(self, classifiers_dir, kappas_dir, labels_dir):
        self.classifiers_dir = classifiers_dir
        self.kappas_dir = kappas_dir
        self.labels_dir = labels_dir

        self.classifiers = dict()   # Dict of cached classifiers
        self.kappas = dict()        # Dict of cached kappas
        self.labels = dict()        # Dict of cached known labels

        self.cached_features = dict()   # Cached region features

    def load_kappa(self, predicate):
        # See if this classifier has been loaded
        if predicate in self.kappas:
            return self.kappas[predicate]

        # If a file exists for the classifier, load from file
        kappas_file = os.path.join(self.kappas_dir, predicate)
        if os.path.isfile(kappas_file):
            with open(kappas_file, 'rb') as kappas_file_handle:
                kappas = pickle.load(kappas_file_handle)
        else:
            return None

        # If a classifier was loaded from file, cache it
        self.kappas[predicate] = kappas
        return kappas

    # Return classifier for a predicate
    def load_classifier(self, predicate):
        # See if this classifier has been loaded
        if predicate in self.classifiers:
            return self.classifiers[predicate]

        # If a file exists for the classifier, load from file
        classifier_file = os.path.join(self.classifiers_dir, predicate)
        if os.path.isfile(classifier_file):
            with open(classifier_file, 'rb') as classifier_file_handle:
                classifier = pickle.load(classifier_file_handle)
        else:
            return None

        # If a classifier was loaded from file, cache it
        self.classifiers[predicate] = classifier
        return classifier

    # Save classifier of a predicate to file
    def save_classifier(self, predicate):
        classifier_file = os.path.join(self.classifiers_dir, predicate)
        if os.path.isfile(classifier_file):
            with open(classifier_file, 'wb') as classifier_file_handle:
                pickle.dump(self.classifiers[predicate], classifier_file_handle)

    # Return classifier predictions for data points (returns 0 - majority class if no classifier is present)
    def get_decisions(self, predicate, data_points):
        classifier = self.load_classifier(predicate)
        if classifier is not None:
            return classifier.predict(data_points)
        else:
            return np.zeros(len(data_points))

    # Return classifier margins for data points (returns 0 - majority class if no classifier is present)
    def get_margins(self, predicate, data_points):
        classifier = self.load_classifier(predicate)
        if classifier is not None:
            return classifier.predict(data_points)
        else:
            return np.zeros(len(data_points))


if __name__ == '__main__':
    # Instantiates a file manager ans saves it as a pickle
    arg_parser = ArgumentParser()
    arg_parser.add_argument('--classifiers-dir', type=str, required=True,
                            help='Path to directory for classifiers')
    arg_parser.add_argument('--save-file', type=str, required=True,
                            help='Path to save as pickle')
    args = arg_parser.parse_args()

    classifiers_manager = ClassifiersManager(args.classifiers_dir)

    with open(args.save_file, 'wb') as save_file:
        pickle.dump(classifiers_manager, save_file)