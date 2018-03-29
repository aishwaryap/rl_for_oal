
import os
from datetime import datetime, timedelta
import numpy as np
import pickle

path = '/scratch/cluster/aish/rl_for_oal/s_peaked/classifiers/'

predicates = os.listdir(path)

sum = timedelta()
print 'sum =', sum
num_trials = 100
a = None

for i in range(num_trials):
    pred = np.random.choice(predicates)
    filename = path + pred
    start_time = datetime.now()
    if not os.path.isfile(filename):
        a = None
    with open(filename, 'rb') as handle:
        a = pickle.load(handle)
    end_time = datetime.now()
    print 'Trial', i, ':', str(end_time - start_time)
    sum += (end_time - start_time)

print 'Average =', sum / num_trials
