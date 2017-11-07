#!/usr/bin/python
# This is used to create a dictionary like interface, where for each key, we store the value pickled into a file 

import os
import re
import pickle
import shutil

__author__ = 'aishwarya'


class KeyedFileDict:
    def __init__(self, dict_dir):
        self.dict_dir = dict_dir
        if not os.path.isdir(dict_dir):
            os.mkdir(dict_dir)
    
    def __setitem__(self, key, item):
        filename = os.path.join(self.dict_dir, str(key) + '.pkl')
        with open(filename, 'wb') as handle:
            pickle.dump(item, handle)

    def __getitem__(self, key):
        filename = os.path.join(self.dict_dir, str(key) + '.pkl')
        with open(filename, 'rb') as handle:
            item = pickle.load(handle)
            return item

    def __len__(self):
        return len(self.keys())

    def __delitem__(self, key):
        os.remove(str(key) + '.pkl')

    def __missing__(self, key):
        return None

    def clear(self):
        shutil.rmtree(self.dict_dir)
        if not os.path.isdir(self.dict_dir):
            os.mkdir(self.dict_dir)

    def has_key(self, k):
        filename = os.path.join(self.dict_dir, str(k) + '.pkl')
        return os.path.isfile(filename)

    def keys(self):
        return [re.sub('.pkl', '', f) for f in os.listdir(self.dict_dir) if f.endswith('.pkl')]

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
