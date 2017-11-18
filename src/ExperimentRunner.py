#!/usr/bin/python
# Class to set up and run experiments

import os
import csv
import numpy as np
import scipy.stats
import math

__author__ = 'aishwarya'


class ExperimentRunner:
    # min_regions, max_regions, mean_regions, std_dev_regions - Domain of discourse (Paramters for truncated Gaussian)
    def __init__(self, dataset_dir, dialog_stats_filename, testing, min_regions, max_regions, mean_regions, std_dev_regions):
        self.dataset_dir = dataset_dir
        self.testing = testing

        self.min_regions = min_regions
        self.max_regions = max_regions
        self.mean_regions = mean_regions
        self.std_dev_regions = std_dev_regions

        self.all_regions = None
        if not self.testing:
            regions_filename = os.path.join(self.dataset_dir, 'classifiers/data/train_regions.txt')
        else:
            regions_filename = os.path.join(self.dataset_dir, 'classifiers/data/test_regions.txt')
        with open(regions_filename) as regions_file:
            self.all_regions = regions_file.read().split('\n')

        region_contents_files = [
            os.path.join(self.dataset_dir, 'region_objects_unique.csv'),
            os.path.join(self.dataset_dir, 'region_attributes_unique.csv')
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
        num_regions = math.floor(scipy.stats.truncnorm.rvs(
            (self.min_regions - self.mean_regions) / self.std_dev_regions,
            (self.max_regions - self.mean_regions) / self.std_dev_regions,
            loc=self.mean_regions, scale=self.std_dev_regions, size=1))

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

    def finish(self):
        self.dialog_stats_file.close()
