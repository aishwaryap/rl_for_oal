#!/usr/bin/python
# This is used to create a dictionary like interface, for region features

import os
import numpy as np
import math
import pylru
import pickle
from argparse import ArgumentParser

__author__ = 'aishwarya'


class VGFeaturesDict:
    def __init__(self, dataset_dir, all_regions, batch_size):
        self.dataset_dir = dataset_dir
        self.batch_size = batch_size
        self.all_regions = all_regions

    def __getitem__(self, key):
        region_idx = self.all_regions.index(key)
        batch_num = int(region_idx / self.batch_size)

        features_filename = os.path.join(self.dataset_dir, 'classifiers/data/features/' + str(batch_num) + '.csv')
        features = np.loadtxt(features_filename)
        idx_in_file = region_idx - batch_num * self.batch_size
        return features[idx_in_file, :]

    def __len__(self):
        return len(self.all_regions)

    def has_key(self, k):
        return k in self.all_regions

    def keys(self):
        return self.all_regions

    def values(self):
        print "It's very probable you'll run out of memory doing this. It's also going to take time"
        max_batch_num = int(math.ceil(float(len(self.all_regions)) / self.batch_size))
        values = None
        for batch_num in range(max_batch_num):
            features_filename = os.path.join(self.dataset_dir, 'classifiers/data/features/' + str(batch_num) + '.csv')
            features = np.loadtxt(features_filename)
            if values is None:
                values = features
            else:
                values = np.vstack((values, features))
        return values.tolist()

    def items(self):
        print "It's very probable you'll run out of memory doing this. It's also going to take time"
        max_batch_num = int(math.ceil(float(len(self.all_regions)) / self.batch_size))
        items = list()
        for batch_num in range(max_batch_num):
            features_filename = os.path.join(self.dataset_dir, 'classifiers/data/features/' + str(batch_num) + '.csv')
            features = np.loadtxt(features_filename)
            keys = self.all_regions[batch_num * self.batch_size:batch_num * (self.batch_size + 1)]
            items += zip(keys, features.tolist())
        return items


if __name__ == '__main__':
    # Instantiates a cached feature manager ans saves it as a pickle
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--dataset-dir', type=str, required=True,
                            help='Path to Visual Genome dataset')
    arg_parser.add_argument('--testing', action="store_true", default=False,
                            help='Set this flag at test time')
    arg_parser.add_argument('--batch-size', type=int, default=65536,
                            help='Number of data points per features file')
    arg_parser.add_argument('--features-cache-size', type=int, default=65536,
                            help='Max number of features to be cached')
    args = arg_parser.parse_args()

    all_regions = None
    if not args.testing:
        regions_filename = os.path.join(args.dataset_dir, 'classifiers/data/train_regions.txt')
    else:
        regions_filename = os.path.join(args.dataset_dir, 'classifiers/data/test_regions.txt')
    with open(regions_filename) as regions_file:
        all_regions = regions_file.read().split('\n')

    features_dict = VGFeaturesDict(args.dataset_dir, all_regions, args.batch_size)
    features_cache = pylru.WriteBackCacheManager(features_dict, args.features_cache_size)

    with open(args.save_file, 'wb') as save_file:
        pickle.dump(features_cache, save_file)