#!/usr/bin/python
# Class to set up and run experiments

import os
import csv
import numpy as np
import scipy.stats
import math
import pickle
import ast
import pylru
from argparse import ArgumentParser
from RegionDict import RegionDict
from KeyedFileDict import KeyedFileDict
from ClassifiersManager import ClassifiersManager
from datetime import datetime

# Imports for unpickling
from DialogAgent import DialogAgent

__author__ = 'aishwarya'


class ExperimentRunner:
    # min_regions, max_regions, mean_regions, std_dev_regions - Domain of discourse (Paramters for truncated Gaussian)
    def __init__(self, dataset_dir, dialog_stats_filename, testing, batch_num, batch_size,
                 min_regions, max_regions, mean_regions, std_dev_regions):
        self.dataset_dir = dataset_dir
        self.testing = testing

        self.min_regions = min_regions
        self.max_regions = max_regions
        self.mean_regions = mean_regions
        self.std_dev_regions = std_dev_regions

        prev_time = datetime.now()
        all_regions = None
        if self.testing:
            regions_filename = os.path.join(self.dataset_dir, 'classifiers/data/test_regions.txt')
        else:
            regions_filename = os.path.join(self.dataset_dir, 'classifiers/data/train_regions.txt')
        with open(regions_filename) as regions_file:
            all_regions = regions_file.read().split('\n')
        self.batch_regions = all_regions[batch_num * batch_size :
                                         min((batch_num + 1) * batch_size, len(all_regions))]
        self.region_set = set(self.batch_regions)

        cur_time = datetime.now()
        print 'Reading regions: ', str(cur_time - prev_time)
        prev_time = cur_time

        # Load region contents
        region_contents_files = [
            os.path.join(self.dataset_dir, 'indoor/region_objects_unique.csv'),
            os.path.join(self.dataset_dir, 'indoor/region_attributes_unique.csv')
        ]
        self.region_contents = dict()
        for region in self.region_set:
            self.region_contents[region] = list()
        for region_contents_file in region_contents_files:
            file_handle = open(region_contents_file)
            reader = csv.reader(file_handle, delimiter=',')
            for row in reader:
                region_id = row[0]
                if region_id in self.region_set:
                    self.region_contents[region_id] += row[1:]
            file_handle.close()

        cur_time = datetime.now()
        print 'Reading region contents: ', str(cur_time - prev_time)
        prev_time = cur_time

        # Load region descriptions
        region_descriptions_filename = os.path.join(self.dataset_dir, 'region_descriptions.csv')
        self.region_descriptions = dict()
        with open(region_descriptions_filename) as handle:
            reader = csv.reader(handle, delimiter=',')
            for row in reader:
                self.region_descriptions[row[0]] = row[1]

        cur_time = datetime.now()
        print 'Reading region descriptions: ', str(cur_time - prev_time)

        dialog_stats_header = ['agent_name', 'num_regions', 'success', 'num_system_turns']
        self.dialog_stats_file = open(dialog_stats_filename, 'w')
        self.dialog_stats_writer = csv.DictWriter(self.dialog_stats_file, fieldnames=dialog_stats_header, delimiter=',')

    def sample_domain_of_discourse(self):
        # Sample number of regions from a truncated Gaussian
        num_regions = int(math.floor(scipy.stats.truncnorm.rvs(
            (self.min_regions - self.mean_regions) / self.std_dev_regions,
            (self.max_regions - self.mean_regions) / self.std_dev_regions,
            loc=self.mean_regions, scale=self.std_dev_regions, size=1)))

        # Sample num_regions uniformly without replacement
        regions = np.random.choice(self.batch_regions, num_regions)
        return regions

    def run_experiment(self, agent):
        domain_of_discourse = self.sample_domain_of_discourse()
        target_region = np.random.choice(domain_of_discourse)
        # description = self.region_descriptions[target_region]
        description = '_'.join(self.region_contents[target_region])
        contents = dict()
        for region in domain_of_discourse:
            contents[region] = self.region_contents[region]
        dialog_stats = agent.run_dialog(domain_of_discourse, target_region, description, contents)
        self.dialog_stats_writer.writerow(dialog_stats)

    def run_experiments(self, agent, num_dialogs):
        for i in range(num_dialogs):
            print 'Running experiment', i
            self.run_experiment(agent)

    def finish(self):
        self.dialog_stats_file.close()


if __name__ == '__main__':
    # Load relevant components, instantiate an experiment and run it

    prev_time = datetime.now()

    arg_parser = ArgumentParser()

    arg_parser.add_argument('--dataset-dir', type=str, required=True,
                            help='Path to Visual Genome dataset')
    arg_parser.add_argument('--dialog-stats-filename', type=str, required=True,
                            help='File to store dialog stats')

    arg_parser.add_argument('--testing', action="store_true", default=False,
                            help='Add this flag to indicate that these are test dialogs')
    arg_parser.add_argument('--min-regions', type=int, default=3,
                            help='Min regions in discourse')
    arg_parser.add_argument('--max-regions', type=int, default=20,
                            help='Max regions in discourse')
    arg_parser.add_argument('--mean-regions', type=int, default=5,
                            help='Mean regions in discourse')
    arg_parser.add_argument('--std-dev-regions', type=float, default=0.5,
                            help='Std dev of # regions in discourse')

    # Some special params needed to instantiate regions file dict
    arg_parser.add_argument('--regions-batch-size', type=int, default=65536,
                            help='Number of data points per features file')
    arg_parser.add_argument('--features-cache-size', type=int, default=65536,
                            help='Max number of features to be cached')

    # Params needed to instantiate classifiers manager
    arg_parser.add_argument('--classifiers-dir', type=str, required=True,
                            help='Path to directory for classifiers')
    arg_parser.add_argument('--kappas-file', type=str, required=True,
                            help='File for kappas')
    arg_parser.add_argument('--train-labels-dir', type=str, required=True,
                            help='Path to directory for collected labels')
    arg_parser.add_argument('--val-labels-dir', type=str, required=True,
                            help='Path to directory for collected labels')
    arg_parser.add_argument('--classifiers-cache-size', type=int, default=256,
                            help='Number of classifiers to keep in cache')
    arg_parser.add_argument('--labels-cache-size', type=int, default=65536,
                            help='Number of labels to keep in cache')
    arg_parser.add_argument('--min-labels-before-val-set', type=int, default=10,
                            help='Min labels to be acquired before separate train and val sets are made')
    arg_parser.add_argument('--val-label-fraction', type=float, default=0.2,
                            help='Fraction of labels to be used for validation')
    arg_parser.add_argument('--max-labels-in-val-set', type=int, default=1000,
                            help='Max val set size')

    # Agent file and num dialogs for test (this may have to be modified)
    arg_parser.add_argument('--agent-file', type=str, required=True,
                            help='File with pickled agent')
    arg_parser.add_argument('--num-dialogs', type=int, required=True,
                            help='Num dialogs to run')

    arg_parser.add_argument('--batch-num', type=int, required=True,
                            help='Batch of regions to use')

    args = arg_parser.parse_args()

    cur_time = datetime.now()
    print 'Parsing args: ', str(cur_time - prev_time)
    prev_time = cur_time

    experiment_runner = ExperimentRunner(args.dataset_dir, args.dialog_stats_filename, args.testing, args.batch_num,
                                         args.regions_batch_size, args.min_regions, args.max_regions, args.mean_regions,
                                         args.std_dev_regions)

    cur_time = datetime.now()
    print 'Instantiating ExperimentRunner: ', str(cur_time - prev_time)
    prev_time = cur_time

    # Instantiate region dicts (because this can't be pickled)
    if args.testing:
        features_file = os.path.join(args.dataset_dir, 'classifiers/data/features/test/' + str(args.batch_num) + '.csv')
        densities_file = os.path.join(args.dataset_dir, 'densities/test/' + str(args.batch_num) + '.csv')
        nbrs_file = os.path.join(args.dataset_dir, 'nbrs/test/' + str(args.batch_num) + '.csv')
    else:
        features_file = os.path.join(args.dataset_dir, 'classifiers/data/features/train/' + str(args.batch_num) + '.csv')
        densities_file = os.path.join(args.dataset_dir, 'densities/train/' + str(args.batch_num) + '.csv')
        nbrs_file = os.path.join(args.dataset_dir, 'nbrs/train/' + str(args.batch_num) + '.csv')

    print 'len(batch_regions) =', len(experiment_runner.batch_regions)
    print 'Some regions:', experiment_runner.batch_regions[:10]

    features_dict = dict()
    with open(features_file) as handle:
        reader = csv.reader(handle, delimiter=',')
        row_idx = 0
        for row in reader:
            features_dict[experiment_runner.batch_regions[row_idx]] = [float(x) for x in row]
            row_idx += 1

    print 'Num features =', len(features_dict.keys())
    print 'Some feature keys:', features_dict.keys()[:10]

    cur_time = datetime.now()
    print 'Instantiating Feature cache: ', str(cur_time - prev_time)
    prev_time = cur_time

    densities = np.loadtxt(densities_file, dtype=np.float, delimiter=',')
    densities_dict = dict(zip(experiment_runner.batch_regions, densities.tolist()))

    print 'Num densities =', len(densities_dict.keys())
    print 'Some densities keys:', densities_dict.keys()[:10]

    cur_time = datetime.now()
    print 'Instantiating densities cache: ', str(cur_time - prev_time)
    prev_time = cur_time

    nbrs_dict = dict()
    with open(nbrs_file) as handle:
        row_idx = 0
        for row in handle:
            nbrs_dict[experiment_runner.batch_regions[row_idx]] = ast.literal_eval(row)
            row_idx += 1

    print 'Num nbrs =', len(nbrs_dict.keys())
    print 'Some nbrs keys:', nbrs_dict.keys()[:10]

    cur_time = datetime.now()
    print 'Instantiating neighbours cache: ', str(cur_time - prev_time)
    prev_time = cur_time

    # Instantiate classifier manager
    classifiers_manager = ClassifiersManager(features_dict, args.classifiers_dir, args.kappas_file, args.train_labels_dir,
                                             args.val_labels_dir, densities_dict, nbrs_dict, args.classifiers_cache_size, args.labels_cache_size,
                                             args.min_labels_before_val_set, args.val_label_fraction, args.max_labels_in_val_set)

    print 'classifiers_manager.train_labels.keys() = ', classifiers_manager.train_labels.keys()

    cur_time = datetime.now()
    print 'Instantiating classifier manager: ', str(cur_time - prev_time)
    prev_time = cur_time

    # Load dialog agent
    with open(args.agent_file, 'rb') as agent_file:
        dialog_agent = pickle.load(agent_file)
    dialog_agent.classifier_manager = classifiers_manager
    dialog_agent.policy.classifier_manager = classifiers_manager

    cur_time = datetime.now()
    print 'Loading dialog agent: ', str(cur_time - prev_time)
    prev_time = cur_time

    experiment_runner.run_experiments(dialog_agent, args.num_dialogs)

    cur_time = datetime.now()
    print 'Running dialogs: ', str(cur_time - prev_time)
    prev_time = cur_time

    dialog_agent.policy.save()
    dialog_agent.save(args.agent_file)

    experiment_runner.finish()
