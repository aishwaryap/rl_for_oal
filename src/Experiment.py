#!/usr/bin/python
# Class to set up and run experiments

import os
import csv
import pylru
from VGFeaturesDict import VGFeaturesDict

__author__ = 'aishwarya'


class Experiment:
    def __init__(self, dataset_dir, testing):
        self.dataset_dir = dataset_dir
        self.testing = testing

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

        region_contents_dict = dict()
        for region in self.all_regions:
            region_contents_dict[region] = list()
        for region_contents_file in region_contents_files:
            file_handle = open(region_contents_file)
            reader = csv.reader(file_handle)
            for row in reader:
                region_id = int(row[0])
                if region_id in self.all_regions:
                    region_contents_dict[region_id] += row[1:]
            file_handle.close()




