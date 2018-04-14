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
import string
from argparse import ArgumentParser
from RegionDict import RegionDict
from KeyedFileDict import KeyedFileDict
from ClassifiersManager import ClassifiersManager
from datetime import datetime
from threading import Thread, Lock
from Queue import Queue

# Imports for unpickling
from ParallelDialogAgent import ParallelDialogAgent
from ParallelPolicyInitDialogAgent import ParallelPolicyInitDialogAgent

__author__ = 'aishwarya'


# This is not derived from ExperimentRunner because almost all functions had to be changed
class CondorizedParallelExperimentRunner:
    # min_regions, max_regions, mean_regions, std_dev_regions - Domain of discourse (Paramters for truncated Gaussian)
    def __init__(self, dataset_dir, dialog_stats_filename, active_train_batch_regions, active_test_batch_regions,
                 testing, min_regions, max_regions, mean_regions, std_dev_regions, classifier_manager,
                 test_seen_predicates_file=None, test_predicates_with_classifiers_file=None,
                 updates_file=None, all_features_file=None):
        self.dataset_dir = dataset_dir
        self.testing = testing
        self.test_seen_predicates_file = test_seen_predicates_file
        self.test_predicates_with_classifiers_file = test_predicates_with_classifiers_file

        self.min_regions = min_regions
        self.max_regions = max_regions
        self.mean_regions = mean_regions
        self.std_dev_regions = std_dev_regions

        self.classifier_manager = classifier_manager

        self.active_train_batch_regions = active_train_batch_regions
        self.active_train_region_set = set(self.active_train_batch_regions)
        self.active_test_batch_regions = active_test_batch_regions
        self.active_test_region_set = set(self.active_test_batch_regions)

        self.updates_file = updates_file
        self.all_features_file = all_features_file

        prev_time = datetime.now()

        # Load region contents
        region_contents_files = [
            os.path.join(self.dataset_dir, 'indoor/region_objects_unique.csv'),
            os.path.join(self.dataset_dir, 'indoor/region_attributes_unique.csv')
        ]
        self.active_train_region_contents = dict()
        self.active_test_region_contents = dict()
        for region in self.active_train_region_set:
            self.active_train_region_contents[region] = list()
        for region in self.active_test_region_set:
            self.active_test_region_contents[region] = list()
        for region_contents_file in region_contents_files:
            file_handle = open(region_contents_file)
            reader = csv.reader(file_handle, delimiter=',')
            for row in reader:
                region_id = row[0]
                if region_id in self.active_train_region_set:
                    self.active_train_region_contents[region_id] += row[1:]
                elif region_id in self.active_test_region_set:
                    self.active_test_region_contents[region_id] += row[1:]
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

        self.dialog_stats_header = ['agent_name', 'num_train_regions', 'num_test_regions', 'success', 'num_system_turns']
        self.dialog_stats_filename = dialog_stats_filename
        self.dialog_stats_queue = Queue()

        self.successful_policy_updates = list()
        self.failed_policy_updates = list()

    def get_random_string(self, string_length=5):
        letters = list(string.ascii_lowercase)
        random_str = np.random.choice(letters, size=string_length, replace=True)
        return random_str

    def serial_operations_after_batch(self, agent, agent_file, dialog_stats_list):
        classifier_updates = [dialog_stats['classifier_updates'] for dialog_stats in dialog_stats_list
                              if 'classifier_updates' in dialog_stats]

        successful_policy_updates = [dialog_stats['policy_updates'] for dialog_stats in dialog_stats_list
                                     if 'policy_updates' in dialog_stats and dialog_stats['success'] == 1]

        failed_policy_updates = [dialog_stats['policy_updates'] for dialog_stats in dialog_stats_list
                                 if 'policy_updates' in dialog_stats and dialog_stats['success'] == 0]

        successful_policy_updates_flat = [item for sublist in successful_policy_updates for item in sublist]
        failed_policy_updates_flat = [item for sublist in failed_policy_updates for item in sublist]

        if self.updates_file is not None:
            with open(self.updates_file, 'a+') as handle:
                for update in successful_policy_updates_flat + failed_policy_updates_flat:
                    handle.write(str(update) + '\n')

        # Experience replay
        self.successful_policy_updates += successful_policy_updates_flat
        self.failed_policy_updates += failed_policy_updates_flat
        num_updates = 20 * len(dialog_stats_list)
        positive_fraction = 0.5
        num_positive_updates = int(num_updates * positive_fraction)
        num_negative_updates = int(num_updates * (1.0 - positive_fraction))
        successful_list_indices = np.random.permutation(len(self.successful_policy_updates))[:num_positive_updates]
        failed_list_indices = np.random.permutation(len(self.failed_policy_updates))[:num_negative_updates]

        policy_updates = successful_policy_updates_flat + failed_policy_updates_flat + \
                         [self.successful_policy_updates[idx] for idx in successful_list_indices] + \
                         [self.failed_policy_updates[idx] for idx in failed_list_indices]

        if self.all_features_file is not None:
            with open(self.all_features_file, 'a+') as handle:
                writer = csv.writer(handle, delimiter=',')
                for dialog_stats in dialog_stats_list:
                    for update in dialog_stats['policy_updates']:
                        key = self.get_random_string()
                        if 'other_features' in update:
                            for feature in update['other_features']:
                                writer.writerow([key, 'not_chosen'] + feature)
                            writer.writerow([key, 'chosen'] + update['feature'])

        seen_predicates = [dialog_stats['predicates'] for dialog_stats in dialog_stats_list]
        seen_predicates_flat = [item for sublist in seen_predicates for item in sublist]

        agent.seen_predicates = agent.seen_predicates.union(seen_predicates_flat)
        if len(classifier_updates) > 0:
            agent.perform_classifier_updates(classifier_updates)
        if len(policy_updates) > 0:
            agent.perform_policy_updates(policy_updates)
        agent.save(agent_file)
        dialog_stats_file = open(self.dialog_stats_filename, 'a+')
        dialog_stats_writer = csv.writer(dialog_stats_file, delimiter=',')
        for dialog_stats in dialog_stats_list:
            stats_to_write = [dialog_stats[field] for field in self.dialog_stats_header]
            dialog_stats_writer.writerow(stats_to_write)
        dialog_stats_file.close()

    def sample_domain_of_discourse(self):
        # Sample number of regions from a truncated Gaussian
        if self.min_regions == self.max_regions:
            num_regions = self.min_regions
        else:
            num_regions = int(math.floor(scipy.stats.truncnorm.rvs(
                (self.min_regions - self.mean_regions) / self.std_dev_regions,
                (self.max_regions - self.mean_regions) / self.std_dev_regions,
                loc=self.mean_regions, scale=self.std_dev_regions, size=1)))

        # Sample num_regions uniformly without replacement
        active_test_regions = np.random.choice(self.active_test_batch_regions, num_regions)
        active_train_regions = np.random.choice(self.active_train_batch_regions, 2 * num_regions)
        return active_test_regions, active_train_regions
    
    def run_experiment(self, agent):
        active_test_regions, active_train_regions = self.sample_domain_of_discourse()
        target_region = np.random.choice(active_test_regions)
        description = self.region_descriptions[target_region]
        active_train_region_contents = dict()
        for region in active_train_regions:
            active_train_region_contents[region] = self.active_train_region_contents[region]
        active_test_region_contents = dict()
        for region in active_test_regions:
            active_test_region_contents[region] = self.active_test_region_contents[region]
        dialog_stats = agent.run_dialog(active_test_regions, active_train_regions, target_region, description,
                                        active_test_region_contents, active_train_region_contents, self.testing)
        return dialog_stats

    def run_experiment_batch(self, agent, num_dialogs_per_batch_per_thread, batch_num, thread_num):
        for dialog_num in range(num_dialogs_per_batch_per_thread):
            print 'Running batch', batch_num, ', thread', thread_num, ', experiment', dialog_num
            # print 'type(dialog_agent.classifier_manager) =', type(agent.classifier_manager)
            # print 'type(dialog_agent.policy.classifier_manager) =', type(agent.policy.classifier_manager)
            dialog_stats = self.run_experiment(agent)
            self.dialog_stats_queue.put(dialog_stats)

    def run_experiments(self, agent_file, num_threads, num_dialogs_per_batch_per_thread, num_batches):
        for batch_num in range(num_batches):
            # Load a copy of the agent for each thread - this needs to be done newly oin each batch to reflect updates
            agents = self.load_agents(agent_file, num_threads)

            threads = list()

            print 'num_threads = ', num_threads
            print

            for thread_num in range(num_threads):
                # Run a batch of experiments
                thread = Thread(target=self.run_experiment_batch, args=(agents[thread_num],
                                                                        num_dialogs_per_batch_per_thread,
                                                                        batch_num, thread_num))
                thread.daemon = True
                thread.start()
                threads.append(thread)

            # Wait for the batch to complete
            for thread in threads:
                thread.join()

            # Get all dialog stats from queue
            dialog_stats_list = list()
            while not self.dialog_stats_queue.empty():
                dialog_stats = self.dialog_stats_queue.get()
                dialog_stats_list.append(dialog_stats)

            # Update agent - can be done using any copy
            self.serial_operations_after_batch(agents[0], agent_file, dialog_stats_list)

    def get_num_batches_complete(self, num_threads, num_dialogs_per_batch_per_thread):
        if not os.path.isfile(self.dialog_stats_filename):
            return 0
        dialog_stats_file = open(self.dialog_stats_filename)
        num_experiments_done = 0
        for _ in dialog_stats_file:
            num_experiments_done += 1
        return num_experiments_done / (num_threads * num_dialogs_per_batch_per_thread)

    def load_agents(self, agent_file, num_threads):
        agents = list()
        for thread_num in range(num_threads):
            with open(agent_file, 'rb') as handle:
                agent = pickle.load(handle)
            agent.set_classifier_manager(self.classifier_manager)
            if self.testing:
                agent.reset_for_test(args.test_seen_predicates_file, args.test_predicates_with_classifiers_file)
            agents.append(agent)
        return agents


if __name__ == '__main__':
    # Load relevant components, instantiate an experiment and run it

    prev_time = datetime.now()

    arg_parser = ArgumentParser()

    arg_parser.add_argument('--dataset-dir', type=str, required=True,
                            help='Path to Visual Genome dataset')
    arg_parser.add_argument('--dialog-stats-filename', type=str, required=True,
                            help='File to store dialog stats')

    arg_parser.add_argument('--min-regions', type=int, default=4,
                            help='Min regions in discourse')
    arg_parser.add_argument('--max-regions', type=int, default=4,
                            help='Max regions in discourse')
    arg_parser.add_argument('--mean-regions', type=int, default=4,
                            help='Mean regions in discourse')
    arg_parser.add_argument('--std-dev-regions', type=float, default=0.1,
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

    arg_parser.add_argument('--testing', action="store_true", default=False,
                            help='Add this flag to indicate that these are test dialogs')
    arg_parser.add_argument('--agent-file', type=str, required=True,
                            help='File with pickled agent')
    arg_parser.add_argument('--num-threads', type=int, required=True,
                            help='Number of parallel threads')
    arg_parser.add_argument('--num-batches', type=int, required=True,
                            help='Number of batches of dialogs')
    arg_parser.add_argument('--num-dialogs-per-batch-per-thread', type=int, required=True,
                            help='Num dialogs to run per batch of experiments per thread')

    arg_parser.add_argument('--active-train-batch-num', type=int, required=True,
                            help='Batch of regions to use')
    arg_parser.add_argument('--active-test-batch-num', type=int, required=True,
                            help='Batch of regions to use')

    arg_parser.add_argument('--test-seen-predicates-file', type=str, default=None,
                            help='File to use for seen predicates during testing')
    arg_parser.add_argument('--test-predicates-with-classifiers-file', type=str, default=None,
                            help='File to use for predicates with classifiers during testing')

    arg_parser.add_argument('--updates-file', type=str, default=None,
                            help='Optionally add this to write updates to file')
    arg_parser.add_argument('--all-features-file', type=str, default=None,
                            help='Optionally add this to write features of all candidate actions marking the one chosen')

    args = arg_parser.parse_args()

    cur_time = datetime.now()
    print 'Parsing args: ', str(cur_time - prev_time)
    prev_time = cur_time

    if args.testing:
        regions_filename = os.path.join(args.dataset_dir, 'classifiers/data/test_regions.txt')
    else:
        regions_filename = os.path.join(args.dataset_dir, 'classifiers/data/train_regions.txt')
    with open(regions_filename) as regions_file:
        all_regions = regions_file.read().split('\n')

    active_train_batch_regions = all_regions[args.active_train_batch_num * args.regions_batch_size:
                                             min((args.active_train_batch_num + 1) * args.regions_batch_size,
                                                 len(all_regions))]
    split_point = int(math.floor(0.6 * len(active_train_batch_regions)))
    active_test_batch_regions = active_train_batch_regions[split_point:]
    active_train_batch_regions = active_train_batch_regions[:split_point]
    # active_test_batch_regions = all_regions[args.active_test_batch_num * args.regions_batch_size:
    #                                         min((args.active_test_batch_num + 1) * args.regions_batch_size,
    #                                             len(all_regions))]

    cur_time = datetime.now()
    print 'Reading regions: ', str(cur_time - prev_time)
    prev_time = cur_time

    # Instantiate region dicts (because this can't be pickled)
    if args.testing:
        active_train_features_file = os.path.join(args.dataset_dir, 'classifiers/data/features/test/' +
                                                  str(args.active_train_batch_num) + '.csv')
        active_test_features_file = os.path.join(args.dataset_dir, 'classifiers/data/features/test/' +
                                                 str(args.active_test_batch_num) + '.csv')
        active_train_densities_file = os.path.join(args.dataset_dir, 'densities/test/' +
                                                   str(args.active_train_batch_num) + '.csv')
        active_test_densities_file = os.path.join(args.dataset_dir, 'densities/test/' +
                                                  str(args.active_test_batch_num) + '.csv')
        active_train_nbrs_file = os.path.join(args.dataset_dir, 'nbrs/test/' + str(args.active_train_batch_num)
                                              + '.csv')
        active_test_nbrs_file = os.path.join(args.dataset_dir, 'nbrs/test/' + str(args.active_test_batch_num) + '.csv')
    else:
        active_train_features_file = os.path.join(args.dataset_dir, 'classifiers/data/features/train/' +
                                                  str(args.active_train_batch_num) + '.csv')
        active_test_features_file = os.path.join(args.dataset_dir, 'classifiers/data/features/train/' +
                                                 str(args.active_test_batch_num) + '.csv')
        active_train_densities_file = os.path.join(args.dataset_dir, 'densities/train/' +
                                                   str(args.active_train_batch_num) + '.csv')
        active_test_densities_file = os.path.join(args.dataset_dir, 'densities/train/' +
                                                  str(args.active_test_batch_num) + '.csv')
        active_train_nbrs_file = os.path.join(args.dataset_dir, 'nbrs/train/' + str(args.active_train_batch_num)
                                              + '.csv')
        active_test_nbrs_file = os.path.join(args.dataset_dir, 'nbrs/train/' + str(args.active_test_batch_num) + '.csv')

    active_train_features_dict = dict()
    active_test_features_dict = dict()
    with open(active_train_features_file) as handle:
        reader = csv.reader(handle, delimiter=',')
        row_idx = 0
        for row in reader:
            if row_idx < len(active_train_batch_regions):
                active_train_features_dict[active_train_batch_regions[row_idx]] = [float(x) for x in row]
            else:
                idx = row_idx - len(active_train_batch_regions)
                active_test_features_dict[active_test_batch_regions[idx]] = [float(x) for x in row]
            row_idx += 1
    # active_test_features_dict = dict()
    # with open(active_test_features_file) as handle:
    #     reader = csv.reader(handle, delimiter=',')
    #     row_idx = 0
    #     for row in reader:
    #         active_test_features_dict[active_test_batch_regions[row_idx]] = [float(x) for x in row]
    #         row_idx += 1

    cur_time = datetime.now()
    print 'Instantiating Feature cache: ', str(cur_time - prev_time)
    prev_time = cur_time

    active_train_densities = np.loadtxt(active_train_densities_file, dtype=np.float, delimiter=',')
    active_test_densities = active_train_densities[split_point:]
    active_train_densities = active_train_densities[:split_point]
    active_train_densities_dict = dict(zip(active_train_batch_regions, active_train_densities.tolist()))
    # active_test_densities = np.loadtxt(active_test_densities_file, dtype=np.float, delimiter=',')
    active_test_densities_dict = dict(zip(active_test_batch_regions, active_test_densities.tolist()))

    cur_time = datetime.now()
    print 'Instantiating densities cache: ', str(cur_time - prev_time)
    prev_time = cur_time

    active_train_nbrs_dict = dict()
    active_test_nbrs_dict = dict()
    with open(active_train_nbrs_file) as handle:
        row_idx = 0
        for row in handle:
            if row_idx < len(active_train_batch_regions):
                active_train_nbrs_dict[active_train_batch_regions[row_idx]] = ast.literal_eval(row)
            else:
                idx = row_idx - len(active_train_batch_regions)
                active_test_nbrs_dict[active_test_batch_regions[idx]] = ast.literal_eval(row)
            row_idx += 1
    # active_test_nbrs_dict = dict()
    # with open(active_test_nbrs_file) as handle:
    #     row_idx = 0
    #     for row in handle:
    #         active_test_nbrs_dict[active_test_batch_regions[row_idx]] = ast.literal_eval(row)
    #         row_idx += 1

    cur_time = datetime.now()
    print 'Instantiating neighbours cache: ', str(cur_time - prev_time)
    prev_time = cur_time

    # Instantiate classifier manager
    classifiers_manager = ClassifiersManager(active_train_features_dict, active_test_features_dict,
                                             args.classifiers_dir, args.kappas_file,
                                             args.train_labels_dir, args.val_labels_dir,
                                             active_train_densities_dict, active_test_densities_dict,
                                             active_train_nbrs_dict, active_test_nbrs_dict,
                                             args.classifiers_cache_size, args.labels_cache_size,
                                             args.min_labels_before_val_set, args.val_label_fraction,
                                             args.max_labels_in_val_set)

    cur_time = datetime.now()
    print 'Instantiating classifier manager: ', str(cur_time - prev_time)
    prev_time = cur_time

    experiment_runner = CondorizedParallelExperimentRunner(args.dataset_dir, args.dialog_stats_filename,
                                                           active_train_batch_regions, active_test_batch_regions,
                                                           args.testing, args.min_regions,
                                                           args.max_regions, args.mean_regions, args.std_dev_regions,
                                                           classifiers_manager, args.test_seen_predicates_file,
                                                           args.test_predicates_with_classifiers_file,
                                                           args.updates_file, args.all_features_file)

    num_batches_needed = args.num_batches - experiment_runner.get_num_batches_complete(
        args.num_threads, args.num_dialogs_per_batch_per_thread)

    print '\n\n\nStarting experiment runner. Num batches needed =', num_batches_needed

    cur_time = datetime.now()
    print 'Loading dialog agent: ', str(cur_time - prev_time)
    prev_time = cur_time

    experiment_runner.run_experiments(args.agent_file, args.num_threads, args.num_dialogs_per_batch_per_thread,
                                      num_batches_needed)

    cur_time = datetime.now()
    print 'Running dialogs: ', str(cur_time - prev_time)
    prev_time = cur_time
