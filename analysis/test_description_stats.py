import csv
import numpy as np
import operator

batch_num = 0
batch_size = 65536

regions_filename = '/scratch/cluster/aish/VisualGenome/classifiers/data/train_regions.txt'

with open(regions_filename) as regions_file:
    all_regions = regions_file.read().split('\n')
batch_regions = all_regions[batch_num * batch_size:min((batch_num + 1) * batch_size, len(all_regions))]
region_set = set(batch_regions)

region_contents_files = [
    '/scratch/cluster/aish/VisualGenome/indoor/region_objects_unique.csv',
    '/scratch/cluster/aish/VisualGenome/indoor/region_attributes_unique.csv'
]
region_contents = dict()
for region in region_set:
    region_contents[region] = list()
for region_contents_file in region_contents_files:
    file_handle = open(region_contents_file)
    reader = csv.reader(file_handle, delimiter=',')
    for row in reader:
        region_id = row[0]
        if region_id in region_set:
            region_contents[region_id] += row[1:]
    file_handle.close()

num_regions = 5

sampled_predicates = dict()

for i in range(10000):
    region = np.random.choice(batch_regions)
    contents = region_contents[region]
    for predicate in contents:
        if predicate not in sampled_predicates:
            sampled_predicates[predicate] = 1
        else:
            sampled_predicates[predicate] += 1

sampled_predicates_list = sampled_predicates.items()
sampled_predicates_list.sort(key=operator.itemgetter(1), reverse=True)

print 'Num predicates =', len(sampled_predicates)
print 'Most frequent predicates =', sampled_predicates_list[:5]
print 'Least frequent predicates =', sampled_predicates_list[-5:]