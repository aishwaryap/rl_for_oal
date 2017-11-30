#!/usr/bin/python
# This is used to create a dictionary like interface, for region features
# DO NOT PICKLE AN INSTANCE oF THIS!!!

import os
import numpy as np
import math

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
