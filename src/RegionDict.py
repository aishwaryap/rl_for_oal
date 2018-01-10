#!/usr/bin/python
# This is used to create a dictionary like interface, for region features
# DO NOT PICKLE AN INSTANCE OF THIS!!!

import os
import numpy as np
import ast
import math

__author__ = 'aishwarya'


class RegionDict:
    # dataset_dir - Directory of Visual Genome dataset
    # contents_dir - Path from dataset_dir to where the files with region contents actually are
    # all_regions - Set of train or test regions
    # batch_size - Number of rows per file
    # loading_mode - "numpy" or "literal_eval"
    # delimiter - Delimiter for numpy
    def __init__(self, dataset_dir, contents_dir, all_regions, batch_size, loading_mode, delimiter=None):
        self.dataset_dir = dataset_dir
        self.batch_size = batch_size
        self.all_regions = all_regions
        self.contents_dir = contents_dir
        self.loading_mode = loading_mode
        self.delimiter = delimiter

    def __getitem__(self, key):
        region_idx = self.all_regions.index(key)
        batch_num = int(region_idx / self.batch_size)

        filename = os.path.join(*[self.dataset_dir, self.contents_dir, str(batch_num) + '.csv'])
        idx_in_file = region_idx - batch_num * self.batch_size

        if self.loading_mode == 'numpy':
            if self.delimiter is not None:
                contents = np.loadtxt(filename, delimiter=self.delimiter)
            else:
                contents = np.loadtxt(filename)
            return contents[idx_in_file, :]

        elif self.loading_mode == 'literal_eval':
            with open(filename) as handle:
                cur_idx = 0
                for line in handle:
                    if cur_idx == idx_in_file:
                        return ast.literal_eval(line.strip())
                    cur_idx += 1

            # If you reached here, the index is invalid
            raise RuntimeError('Region needs index ' + str(idx_in_file) + ' but file has only ' + str(cur_idx)
                               + ' lines')

        else:
            raise RuntimeError('Invalid loading mode - ' + str(self.loading_mode)
                               + '; Must be one of "numpy" or "literal_eval"')

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

        if self.loading_mode == 'numpy':
            for batch_num in range(max_batch_num):
                filename = os.path.join(self.dataset_dir, self.contents_dir + str(batch_num) + '.csv')
                if self.delimiter is not None:
                    contents = np.loadtxt(filename, delimiter=self.delimiter)
                else:
                    contents = np.loadtxt(filename)
                if values is None:
                    values = contents
                else:
                    values = np.vstack((values, contents))
            return values.tolist()

        elif self.loading_mode == 'literal_eval':
            for batch_num in range(max_batch_num):
                filename = os.path.join(self.dataset_dir, self.contents_dir + str(batch_num) + '.csv')
                values = list()
                with open(filename) as handle:
                    contents = [ast.literal_eval(line.strip()) for line in handle.readlines()]
                    values = values + contents
            return values

        else:
            raise RuntimeError('Invalid loading mode - ' + str(self.loading_mode)
                               + '; Must be one of "numpy" or "literal_eval"')

    def items(self):
        print "It's very probable you'll run out of memory doing this. It's also going to take time"
        max_batch_num = int(math.ceil(float(len(self.all_regions)) / self.batch_size))
        items = list()

        if self.loading_mode == 'numpy':
            for batch_num in range(max_batch_num):
                keys = self.all_regions[batch_num * self.batch_size:min((batch_num + 1) * self.batch_size, len(self.all_regions))]
                filename = os.path.join(self.dataset_dir, self.contents_dir + str(batch_num) + '.csv')
                if self.delimiter is not None:
                    contents = np.loadtxt(filename, delimiter=self.delimiter)
                else:
                    contents = np.loadtxt(filename)
                items += zip(keys, contents.tolist())
            return items

        elif self.loading_mode == 'literal_eval':
            for batch_num in range(max_batch_num):
                keys = self.all_regions[batch_num * self.batch_size:min((batch_num + 1) * self.batch_size, len(self.all_regions))]
                filename = os.path.join(self.dataset_dir, self.contents_dir + str(batch_num) + '.csv')
                with open(filename) as handle:
                    contents = [ast.literal_eval(line.strip()) for line in handle.readlines()]
                    items += zip(keys, contents)
            return items

        else:
            raise RuntimeError('Invalid loading mode - ' + str(self.loading_mode)
                               + '; Must be one of "numpy" or "literal_eval"')
