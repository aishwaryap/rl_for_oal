#!/usr/bin/python

from argparse import ArgumentParser
import os
import ast
import math
import csv
import numpy as np
import pickle


def get_f1(classifier, train_features, train_labels, val_labels):
    features = [train_features[region] for (region, label) in val_labels]
    labels = [label for (region, label) in val_labels]
    preds = classifier.predict(features)
    tp = sum([(labels[idx] == 1 and preds[idx] == 1) for idx in range(len(labels))])
    tn = sum([(labels[idx] == 0 and preds[idx] == 0) for idx in range(len(labels))])
    fp = sum([(labels[idx] == 0 and preds[idx] == 1) for idx in range(len(labels))])
    fn = sum([(labels[idx] == 1 and preds[idx] == 0) for idx in range(len(labels))])
    if (tp + fp) == 0:
        precision = 0
    else:
        precision = float(tp) / (tp + fp)
    if (tp + fn) == 0:
        recall = 0
    else:
        recall = float(tp) / (tp + fn)
    if (precision + recall) == 0:
        f1 = 0
    else:
        f1 = (2 * precision * recall) / (precision + recall)
    return [precision, recall, f1]


def main(args):
    agent_dir = os.path.join(args.output_path, args.agent_name)
    print 'Loading kappas ...'
    kappas_file = os.path.join(agent_dir, 'kappas.csv')
    with open(kappas_file) as handle:
        kappas = ast.literal_eval(handle.read().strip())

    print 'Loading regions ...'
    regions_filename = os.path.join(args.dataset_dir, 'classifiers/data/test_regions.txt')
    with open(regions_filename) as regions_file:
        all_regions = regions_file.read().split('\n')

    batch_regions = all_regions[args.batch_num * args.regions_batch_size:
                                min((args.batch_num + 1) * args.regions_batch_size, len(all_regions))]
    split_point = int(math.floor(0.6 * len(batch_regions)))
    train_regions = batch_regions[:split_point]
    test_regions = batch_regions[split_point:]
    test_regions_set = set(test_regions)

    print 'Loading features ...'
    features_file = os.path.join(args.dataset_dir, 'classifiers/data/features/test/' + str(args.batch_num) + '.csv')

    test_features = []
    train_features = dict()
    with open(features_file) as handle:
        reader = csv.reader(handle, delimiter=',')
        row_idx = 0
        for row in reader:
            if row_idx < split_point:
                train_features[train_regions[row_idx]] = [float(x) for x in row]
            else:
                test_features = test_features + [[float(x) for x in row]]
            row_idx += 1
    test_features = np.array(test_features)

    print 'Loading descriptions ...'
    region_descriptions_filename = os.path.join(args.dataset_dir, 'region_descriptions.csv')
    region_descriptions_dict = dict()
    with open(region_descriptions_filename) as handle:
        reader = csv.reader(handle, delimiter=',')
        for row in reader:
            if row[0] in test_regions_set:
                region_descriptions_dict[row[0]] = row[1].split('_')

    output_file = open(args.output_file, 'w')
    output_writer = csv.writer(output_file, delimiter=',')

    all_preds = dict()

    for label_name in kappas:
        print 'Analyzing label', label_name, '...'
        classifier_file = os.path.join(agent_dir, 'classifiers/' + label_name + '.pkl')
        train_labels_file = os.path.join(agent_dir, 'labels/train/' + label_name + '.pkl')
        val_labels_file = os.path.join(agent_dir, 'labels/train/' + label_name + '.pkl')

        with open(classifier_file, 'rb') as handle:
            classifier = pickle.load(handle)

        with open(train_labels_file) as handle:
            train_labels = pickle.load(handle)

        if os.path.isfile(val_labels_file):
            with open(val_labels_file) as handle:
                val_labels = pickle.load(handle)
        else:
            continue

        train_metrics = get_f1(classifier, train_features, train_labels, val_labels)

        preds = classifier.predict(test_features)
        all_preds[label_name] = preds

        labels = [int(label_name in region_descriptions_dict[region]) for region in test_regions]
        tp = sum([(labels[idx] == 1 and preds[idx] == 1) for idx in range(len(test_regions))])
        tn = sum([(labels[idx] == 0 and preds[idx] == 0) for idx in range(len(test_regions))])
        fp = sum([(labels[idx] == 0 and preds[idx] == 1) for idx in range(len(test_regions))])
        fn = sum([(labels[idx] == 1 and preds[idx] == 0) for idx in range(len(test_regions))])
        num_p = sum([(labels[idx] == 1) for idx in range(len(test_regions))])
        num_n = sum([(labels[idx] == 0) for idx in range(len(test_regions))])

        if (tp + fp) == 0:
            precision = 0
        else:
            precision = float(tp) / (tp + fp)
        if (tp + fn) == 0:
            recall = 0
        else:
            recall = float(tp) / (tp + fn)
        if (precision + recall) == 0:
            f1 = 0
        else:
            f1 = (2 * precision * recall) / (precision + recall)

        output_writer.writerow([label_name, kappas[label_name]] + train_metrics +
                               [num_p, num_n, precision, recall, f1])

    output_file.close()

    ranks_file = open(args.ranks_file, 'w')
    ranks_writer = csv.writer(ranks_file, delimiter=',')

    for (region, description) in region_descriptions_dict.items():
        positive_scores = np.zeros(test_regions)
        negative_scores = np.zeros(test_regions)
        for predicate in description:
            if predicate in all_preds.keys():
                positive_scores += (all_preds[predicate] == 1) * (1.0 + kappas[predicate])
                negative_scores += (all_preds[predicate] == 0) * 2.0
        scores = positive_scores - negative_scores
        scores = scores.tolist()
        order = scores.argsort()
        ranks = order.argsort()
        region_idx = test_regions.index(region)
        ranks_writer.writerow(region, ' '.join(description), ranks[region_idx])

    ranks_file.close()


if __name__ == '__main__':
    arg_parser = ArgumentParser()
    arg_parser.add_argument('--dataset-dir', type=str, default='/scratch/cluster/aish/VisualGenome/',
                            help='Path to Visual Genome dataset')
    arg_parser.add_argument('--output-path', type=str, default='/scratch/cluster/aish/rl_for_oal/',
                            help='Path to where agent directories are')
    arg_parser.add_argument('--agent-name', type=str, required=True,
                            help='Dir name following output-path')
    arg_parser.add_argument('--batch-num', type=int, default=0,
                            help='Test batch')
    arg_parser.add_argument('--output-file', type=str, default=None,
                            help='File to write output stats')
    arg_parser.add_argument('--ranks-file', type=str, default=None,
                            help='File to write ranks')
    arg_parser.add_argument('--regions-batch-size', type=int, default=65536,
                            help='Number of data points per features file')

    args = arg_parser.parse_args()

    if args.output_file is None:
        args.output_file = '../logs/classifier_analysis/' + args.agent_name + '.csv'
        args.output_file = '../logs/classifier_analysis/' + args.agent_name + '_ranks.csv'
    main(args)