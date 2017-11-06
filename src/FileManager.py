#!/usr/bin/python
# Wrappers to abstract out places where we have to load from file
# This contains things that can be shared across policies

import os
import numpy as np
import csv
import pickle
from argparse import ArgumentParser

__author__ = 'aishwarya'


class FileManager:
    def __init__(self, dataset_dir, testing=False, batch_size=65536):
        self.dataset_dir = dataset_dir
        self.testing = testing
        self.batch_size = batch_size

        self.all_regions = None
        if not self.testing:
            regions_filename = os.path.join(self.dataset_dir, 'classifiers/data/train_regions.txt')
        else:
            regions_filename = os.path.join(self.dataset_dir, 'classifiers/data/test_regions.txt')
        with open(regions_filename) as regions_file:
            self.all_regions = regions_file.read().split('\n')

    def get_region_features(self, regions):
        indices = [self.all_regions.index(region) for region in regions]
        batch_nums = [int(idx/self.batch_size) for idx in indices]
        unique_batch_nums = set(batch_nums)

        features_dict = dict()
        for batch_num in unique_batch_nums:
            features_filename = os.path.join(self.dataset_dir, 'classifiers/data/features/' + str(batch_num) + '.csv')
            features = np.loadtxt(features_filename)
            for (idx, region) in enumerate(regions):
                if batch_nums[idx] == batch_num:
                    features_dict[region] = features[indices[idx], :]

        return features_dict

    def get_region_contents(self, regions):
        region_contents_files = [
            os.path.join(self.dataset_dir, 'region_objects_unique.csv'),
            os.path.join(self.dataset_dir, 'region_attributes_unique.csv')
        ]

        region_contents_dict = dict()
        for region in regions:
            region_contents_dict[region] = list()
        for region_contents_file in region_contents_files:
            file_handle = open(region_contents_file)
            reader = csv.reader(file_handle)
            for row in reader:
                region_id = int(row[0])
                if region_id in regions:
                    region_contents_dict[region_id] += row[1:]
            file_handle.close()

        return region_contents_dict


if __name__ == '__main__':
    # Instantiates a file manager ans saves it as a pickle
    arg_parser = ArgumentParser()
    arg_parser.add_argument('--dataset-dir', type=str, required=True,
                            help='Path to Visual Genome dataset')
    arg_parser.add_argument('--batch-size', type=int, default=65536,
                            help='Number of data points per file (features or labels) in preprocessed Visual Genome')
    arg_parser.add_argument('--testing', action="store_true", default=False,
                            help='This is test, not train mode')
    arg_parser.add_argument('--save-file', type=str, required=True,
                            help='Path to save as pickle')
    args = arg_parser.parse_args()

    file_manager = FileManager(args.dataset_dir, args.testing, args.batch_size)

    with open(args.save_file, 'wb') as save_file:
        pickle.dump(file_manager, save_file)
