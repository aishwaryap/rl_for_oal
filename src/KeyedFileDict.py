#!/usr/bin/python
# This is used to create a dictionary like interface, where for each key, we store the value pickled into a file 

import os
import re
import pickle
import numpy as np
import shutil

__author__ = 'aishwarya'


class KeyedFileDict:
    # loading_mode - "pickle" or "numpy"
    def __init__(self, dict_dir, loading_mode, delimiter=None):
        self.dict_dir = dict_dir
        self.loading_mode = loading_mode
        self.delimiter = delimiter
        if not os.path.isdir(dict_dir):
            os.mkdir(dict_dir)
    
    def __setitem__(self, key, item):
        if self.loading_mode == 'pickle':
            filename = os.path.join(self.dict_dir, str(key) + '.pkl')
            with open(filename, 'wb') as handle:
                pickle.dump(item, handle)
        elif self.loading_mode == 'numpy':
            filename = os.path.join(self.dict_dir, str(key))
            np.savetxt(filename, item)
        else:
            raise RuntimeError('Invalid loading mode')

    def __getitem__(self, key):
        if self.loading_mode == 'pickle':
            filename = os.path.join(self.dict_dir, str(key) + '.pkl')
            if not os.path.isfile(filename):
                return None
            with open(filename, 'rb') as handle:
                item = pickle.load(handle)
                return item
        elif self.loading_mode == 'numpy':
            filename = os.path.join(self.dict_dir, str(key))
            if self.delimiter is not None:
                item = np.loadtxt(filename, dtype=np.float, delimiter=self.delimiter)
            else:
                item = np.loadtxt(filename, dtype=np.float)
            return item

    def __len__(self):
        return len(self.keys())

    def __delitem__(self, key):
        if self.loading_mode == 'pickle':
            filename = os.path.join(self.dict_dir, str(key) + '.pkl')
        elif self.loading_mode == 'numpy':
            filename = os.path.join(self.dict_dir, str(key))
        else:
            raise RuntimeError('Invalid loading mode')
        os.remove(filename)

    def __missing__(self, key):
        return None

    def clear(self):
        shutil.rmtree(self.dict_dir)
        if not os.path.isdir(self.dict_dir):
            os.mkdir(self.dict_dir)

    def has_key(self, key):
        if self.loading_mode == 'pickle':
            filename = os.path.join(self.dict_dir, str(key) + '.pkl')
        elif self.loading_mode == 'numpy':
            filename = os.path.join(self.dict_dir, str(key))
        else:
            raise RuntimeError('Invalid loading mode')
        return os.path.isfile(filename)

    def keys(self):
        if self.loading_mode == 'pickle':
            return [re.sub('.pkl', '', f) for f in os.listdir(self.dict_dir) if f.endswith('.pkl')]
        elif self.loading_mode == 'numpy':
            return [f for f in os.listdir(self.dict_dir)]
        else:
            raise RuntimeError('Invalid loading mode')

    def values(self):
        keys = self.keys()
        values = list()
        for key in keys:
            values.append(self.__getitem__(key))
        return values

    def items(self):
        keys = self.keys()
        items = list()
        for key in keys:
            items.append((key, self.__getitem__(key)))
        return items
