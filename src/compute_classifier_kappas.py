
from ClassifiersManager import ClassifiersManager
from argparse import ArgumentParser

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

    # Instantiate classifier manager
    classifiers_manager = ClassifiersManager(None, args.classifiers_dir, args.kappas_file, args.train_labels_dir,
                                             args.val_labels_dir, None, None, -1, -1, -1, -1, -1)

    kappas = dict()
    for predicate in classifiers_manager.train_labels.keys():
        kappa = classifiers_manager.compute_crossval_kappa(predicate)
        kappas[predicate] = kappa

    with open(args.kappas_file, 'w') as handle:
        handle.write(str(kappas))
