#!/usr/bin/python
# Class to set up and run experiments

import os
import csv
import numpy as np
import scipy.stats
import math
import pickle
import pylru
from argparse import ArgumentParser
from RegionDict import RegionDict
from ClassifiersManager import ClassifiersManager

__author__ = 'aishwarya'


class ExperimentRunner:
    # min_regions, max_regions, mean_regions, std_dev_regions - Domain of discourse (Paramters for truncated Gaussian)
    def __init__(self, dataset_dir, dialog_stats_filename, testing, min_regions, max_regions, mean_regions,
                 std_dev_regions):
        self.dataset_dir = dataset_dir
        self.testing = testing

        self.min_regions = min_regions
        self.max_regions = max_regions
        self.mean_regions = mean_regions
        self.std_dev_regions = std_dev_regions

        self.all_regions = None
        if self.testing:
            regions_filename = os.path.join(self.dataset_dir, 'classifiers/data/test_regions.txt')
        else:
            regions_filename = os.path.join(self.dataset_dir, 'classifiers/data/train_regions.txt')
        with open(regions_filename) as regions_file:
            self.all_regions = regions_file.read().split('\n')

        # Load region contents
        region_contents_files = [
            os.path.join(self.dataset_dir, 'indoor/region_objects_unique.csv'),
            os.path.join(self.dataset_dir, 'indoor/region_attributes_unique.csv')
        ]
        self.region_contents = dict()
        for region in self.all_regions:
            self.region_contents[region] = list()
        for region_contents_file in region_contents_files:
            file_handle = open(region_contents_file)
            reader = csv.reader(file_handle)
            for row in reader:
                region_id = int(row[0])
                if region_id in self.all_regions:
                    self.region_contents[region_id] += row[1:]
            file_handle.close()

        # Load region descriptions
        region_descriptions_filename = os.path.join(self.dataset_dir, 'region_descriptions.csv')
        self.region_descriptions = dict()
        with open(region_descriptions_filename) as handle:
            reader = csv.reader(handle, delimiter=',')
            for row in reader:
                self.region_descriptions[row[0]] = row[1]

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
        regions = np.random.choice(self.all_regions, num_regions)
        return regions

    def run_experiment(self, agent):
        domain_of_discourse = self.sample_domain_of_discourse()
        target_region = np.random.choice(domain_of_discourse)
        description = self.region_descriptions[target_region]
        contents = self.region_contents[target_region]
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
    arg_parser.add_argument('--labels-dir', type=str, required=True,
                            help='Path to directory for collected labels')
    arg_parser.add_argument('--classifiers-cache-size', type=int, default=256,
                            help='Number of classifiers to keep in cache')
    arg_parser.add_argument('--labels-cache-size', type=int, default=65536,
                            help='Number of labels to keep in cache')

    # Agent file and num dialogs for test (this may have to be modified)
    arg_parser.add_argument('--agent-file', type=str, required=True,
                            help='File with pickled agent')
    arg_parser.add_argument('--num-dialogs', type=int, required=True,
                            help='Num dialogs to run')

    args = arg_parser.parse_args()

    experiment_runner = ExperimentRunner(args.dataset_dir, args.dialog_stats_filename, args.testing, args.min_regions,
                                         args.max_regions, args.mean_regions, args.std_dev_regions)

    # Instantiate region dicts (because this can't be pickled)
    if args.testing:
        features_dir = 'classifiers/data/features/test/'
        densities_dir = 'densities/test/'
        nbrs_dir = 'nbrs/test/'
    else:
        features_dir = 'classifiers/data/features/train/'
        densities_dir = 'densities/train/'
        nbrs_dir = 'nbrs/train/'

    features_dict = RegionDict(args.dataset_dir, features_dir, experiment_runner.all_regions, args.batch_size,
                               loading_mode='numpy')
    features_cache = pylru.WriteBackCacheManager(features_dict, args.features_cache_size)

    densities_dict = RegionDict(args.dataset_dir, densities_dir, experiment_runner.all_regions, args.batch_size,
                                loading_mode='numpy')
    densities = dict(densities_dict.items())

    nbrs_dict = RegionDict(args.dataset_dir, nbrs_dir, experiment_runner.all_regions, args.batch_size,
                           loading_mode='literal_eval')
    nbrs = dict(nbrs_dict.items())

    # Instantiate classifier manager
    classifiers_manager = ClassifiersManager(features_cache, args.classifiers_dir, args.kappas_file, args.labels_dir,
                                             densities, nbrs, args.classifiers_cache_size, args.labels_cache_size)

    # Load dialog agent
    with open(args.agent_file, 'rb') as agent_file:
        dialog_agent = pickle.load(agent_file)
    dialog_agent.classifier_manager = classifiers_manager
    dialog_agent.policy.classifier_manager = classifiers_manager

    experiment_runner.run_experiments(dialog_agent, args.num_dialogs)
    experiment_runner.finish()
