#!/usr/bin/python

import os
import csv
from argparse import ArgumentParser
from matplotlib import pyplot as plt


def select_regions(region_descriptions, args):
    with open(args.orig_regions_file) as handle:
        orig_regions = set(handle.read().split('\n'))

    image_rows = dict()
    num_regions_needed = args.num_regions_needed
    if num_regions_needed is None:
        num_regions_needed = len(orig_regions)
    all_found = False

    image_list_dir = os.path.join(args.dataset_dir, 'image_lists')
    image_list_files = [os.path.join(image_list_dir, f) for f in os.listdir(image_list_dir)]

    blacklisted_description_words = set()

    for filename in image_list_files:
        with open(filename) as handle:
            reader = csv.reader(handle, delimiter=',')
            for row in reader:
                region = row[0]
                if region in orig_regions:
                    description = region_descriptions[region]
                    if args.num_regions_needed is None or \
                       len(blacklisted_description_words.intersection(description)) == 0:
                        blacklisted_description_words = blacklisted_description_words.union(description)

                        discard_region = False

                        image_path = row[1]
                        image = plt.imread(image_path)

                        [x, y, width, height] = [int(val) for val in row[2:]]
                        # Following checks are to handle annotation errors
                        x_min = max(x, 0)
                        x_max = min(x + width, image.shape[1] - 1)
                        y_min = max(y, 0)
                        y_max = min(y + height, image.shape[0] - 1)
                        if x_min + 1 >= x_max:
                            discard_region = True
                        if y_min + 1 >= y_max:
                            discard_region = True

                        # Discard regions that are too small
                        if x_max - x_min < 150 and y_max - y_min < 150:
                            discard_region = True

                        if discard_region and args.num_regions_needed is None:
                            # If a number of regions was not specified, we are searching for one region less
                            # This is mainly an optimization for efficiency
                            num_regions_needed -= 1

                        if not discard_region:
                            image_rows[region] = [image_path, x_min, x_max, y_min, y_max]
                            print 'Chosen', region, ':', description
                            if len(image_rows.keys()) == num_regions_needed:
                                all_found = True
                                break
        if all_found:
            break
        print 'Processed image list ', filename

    return image_rows


def get_region_descriptions(args):
    with open(args.orig_regions_file) as handle:
        orig_regions = set(handle.read().split('\n'))

    region_descriptions_filename = os.path.join(args.dataset_dir, 'region_descriptions.csv')
    region_descriptions = dict()
    with open(region_descriptions_filename) as handle:
        reader = csv.reader(handle, delimiter=',')
        for row in reader:
            if row[0] in orig_regions:
                region_descriptions[row[0]] = row[1].split('_')

    print 'Loaded descriptions'
    return region_descriptions


def save_images(image_rows, args):
    for key, row in image_rows.items():
        [image_path, x_min, x_max, y_min, y_max] = row
        image = plt.imread(image_path)

        # Need to crop one at a time to avoid broadcasting in numpy
        image = image[:, range(x_min, x_max), :]
        image = image[range(y_min, y_max), :, :]

        filename = args.target_image_dir + key + '.jpg'
        plt.imsave(filename, image)


if __name__ == '__main__':
    arg_parser = ArgumentParser()
    arg_parser.add_argument('--dataset-dir', type=str, default='/scratch/cluster/aish/VisualGenome',
                            help='Path to Visual Genome dataset')
    arg_parser.add_argument('--orig-regions-file', type=str,
                            default='/scratch/cluster/aish/VisualGenome/classifiers/data/test_regions.txt',
                            help='Ensures that returned regions are a subset of what is in this file')
    arg_parser.add_argument('--num-regions-needed', type=int, default=None, help='Num regions needed')
    arg_parser.add_argument('--target-image-dir', type=str, default='/u/aish/Pictures/rl_for_oal/',
                            help='Target directory to store images')
    args = arg_parser.parse_args()

    region_descriptions = get_region_descriptions(args)
    image_rows = select_regions(region_descriptions, args)
    save_images(image_rows, args)
