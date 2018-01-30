
from ClassifiersManager import ClassifiersManager
from argparse import ArgumentParser
import os
import csv

if __name__ == '__main__':
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--dataset-dir', type=str, required=True,
                            help='Path to Visual Genome dataset')

    arg_parser.add_argument('--classifiers-dir', type=str, required=True,
                            help='Path to directory for classifiers')
    arg_parser.add_argument('--kappas-file', type=str, required=True,
                            help='File for kappas')
    arg_parser.add_argument('--train-labels-dir', type=str, required=True,
                            help='Path to directory for collected labels')
    arg_parser.add_argument('--val-labels-dir', type=str, required=True,
                            help='Path to directory for collected labels')

    args = arg_parser.parse_args()

    regions_filename = '/scratch/cluster/aish/VisualGenome/classifiers/data/train_regions.txt'

    with open(regions_filename) as regions_file:
        regions = regions_file.read().split('\n')

    print 'Reading features ...'
    features_file = os.path.join(args.dataset_dir, 'classifiers/data/features/train/0.csv')
    features_dict = dict()
    with open(features_file) as handle:
        reader = csv.reader(handle, delimiter=',')
        row_idx = 0
        for row in reader:
            features_dict[regions[row_idx]] = [float(x) for x in row]
            row_idx += 1

    print 'Instantiating classifier manager ...'
    # Instantiate classifier manager
    classifiers_manager = ClassifiersManager(features_dict, args.classifiers_dir, args.kappas_file, args.train_labels_dir,
                                             args.val_labels_dir, None, None, 1, 1, 1, 1, 1)

    kappas = dict()
    for predicate in classifiers_manager.train_labels.keys():
        kappa = classifiers_manager.compute_crossval_kappa(predicate)
        kappas[predicate] = kappa
        print 'kappa[', predicate, '] =', kappa

    with open(args.kappas_file, 'w') as handle:
        handle.write(str(kappas))
