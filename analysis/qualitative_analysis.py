#!/usr/bin/python

import matplotlib
matplotlib.use('Agg')

from argparse import ArgumentParser
import os
import csv
import matplotlib.pyplot as plt
import pickle
import ast


def get_label_dist(agent_name, agent_dir):
    train_labels_dir = os.path.join(*[agent_dir, agent_name + '_test', 'labels/train/'])
    predicate_files = [os.path.join(train_labels_dir, f) for f in os.listdir(train_labels_dir)]
    label_dist = dict()
    label_bins_dist = dict()
    for filename in predicate_files:
        with open(filename, 'rb') as handle:
            labels = pickle.load(handle)
            num_labels = len(labels)
            if num_labels not in label_dist:
                label_dist[num_labels] = 1
            else:
                label_dist[num_labels] += 1
            label_bin = num_labels / 10
            if label_bin not in label_bins_dist:
                label_bins_dist[label_bin] = 1
            else:
                label_bins_dist[label_bin] += 1
    return label_dist, label_bins_dist


def get_kappas(agent_name, agent_dir):
    kappas_file = os.path.join(*[agent_dir, agent_name + '_test', 'kappas.csv'])
    with open(kappas_file) as handle:
        kappas = ast.literal_eval(handle.read())
    kappas_dist = dict()
    for (_, kappa) in kappas.items():
        kappa_bin = int(kappa * 10)
        if kappa_bin not in kappas_dist:
            kappas_dist[kappa_bin] = 1
        else:
            kappas_dist[kappa_bin] += 1
    return kappas_dist


def main(args):
    if args.script_type == 'test':
        dialog_stats_file = os.path.join(*[args.agents_path, args.agent_name + '_test', args.script_type + '_stats.txt'])
    else:
        dialog_stats_file = os.path.join(*[args.agents_path, args.agent_name, args.script_type + '_stats.txt'])
    print dialog_stats_file

    if not os.path.isfile(dialog_stats_file):
        print 'No stats found'
        return

    with open(dialog_stats_file) as handle:
        reader = csv.reader(handle, delimiter=',')
        stats = list()
        for row in reader:
            stats.append(row)

    # Length distribution
    length_dist = dict()
    length_bins_dist = dict()
    length_success_dist = dict()

    for row in stats:
        success = float(row[3])
        num_system_turns = int(row[4])

        if num_system_turns not in length_dist:
            length_dist[num_system_turns] = 1
        else:
            length_dist[num_system_turns] += 1

        length_bin = num_system_turns / 10
        if length_bin not in length_bins_dist:
            length_bins_dist[length_bin] = 1
        else:
            length_bins_dist[length_bin] += 1

        if length_bin not in length_success_dist:
            length_success_dist[length_bin] = 1
        else:
            length_success_dist[length_bin] += int(success)

    plt.figure()
    xs = length_dist.keys()
    ys = [length_dist[x] for x in xs]
    plt.plot(xs, ys, 'bo')
    plt.ylabel('Num dialogs')
    plt.xlabel('Dialog length')
    output_file = os.path.join(args.output_dir, 'length_dist_' + args.agent_name + '.png')
    plt.savefig(output_file)

    plt.figure()
    xs = length_bins_dist.keys()
    ys = [length_bins_dist[x] for x in xs]
    plt.plot(xs, ys, 'bo')
    plt.ylabel('Num dialogs')
    plt.xlabel('Dialog length / 10')
    output_file = os.path.join(args.output_dir, 'length_bins_dist_' + args.agent_name + '.png')
    plt.savefig(output_file)

    plt.figure()
    xs = length_success_dist.keys()
    ys = [(length_success_dist[x] / float(length_bins_dist[x])) for x in xs]
    plt.plot(xs, ys, 'bo')
    plt.ylabel('Fraction of successes')
    plt.xlabel('Dialog length / 10')
    output_file = os.path.join(args.output_dir, 'length_success_dist_' + args.agent_name + '.png')
    plt.savefig(output_file)

    baseline_label_dist, baseline_label_bins_dist = get_label_dist('static', args.agents_path)
    learned_label_dist, learned_label_bins_dist = get_label_dist(args.agent_name, args.agents_path)

    plt.figure()
    x1 = baseline_label_dist.keys()
    y1 = [baseline_label_dist[x] for x in x1]
    plt.plot(x1, y1, 'r-*', label='static')
    x2 = learned_label_dist.keys()
    y2 = [learned_label_dist[x] for x in x2]
    plt.plot(x2, y2, 'b-o', label='learned')
    plt.ylabel('Num of predicates')
    plt.xlabel('Num labels for predicate')
    plt.legend(bbox_to_anchor=(1, 1))
    output_file = os.path.join(args.output_dir, 'labels_' + args.agent_name + '.png')
    plt.savefig(output_file)

    plt.figure()
    x1 = baseline_label_bins_dist.keys()
    y1 = [baseline_label_bins_dist[x] for x in x1]
    plt.plot(x1, y1, 'r-*', label='static')
    x2 = learned_label_bins_dist.keys()
    y2 = [learned_label_bins_dist[x] for x in x2]
    plt.plot(x2, y2, 'b-o', label='learned')
    plt.ylabel('Num of predicates')
    plt.xlabel('Num labels for predicate')
    plt.legend(bbox_to_anchor=(1, 1))
    output_file = os.path.join(args.output_dir, 'label_bins_' + args.agent_name + '.png')
    plt.savefig(output_file)

    baseline_kappas_dist = get_kappas('static', args.agents_path)
    learned_kappas_dist = get_kappas(args.agent_name, args.agents_path)
    plt.figure()
    x1 = baseline_kappas_dist.keys()
    y1 = [baseline_kappas_dist[x] for x in x1]
    plt.plot(x1, y1, 'r-*', label='static')
    x2 = learned_kappas_dist.keys()
    y2 = [learned_kappas_dist[x] for x in x2]
    plt.plot(x2, y2, 'b-o', label='learned')
    plt.ylabel('Num of predicates')
    plt.xlabel('floor(F1 * 10)')
    plt.legend(bbox_to_anchor=(1, 1))
    output_file = os.path.join(args.output_dir, 'kappas_' + args.agent_name + '.png')
    plt.savefig(output_file)


if __name__ == '__main__':
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--agents-path', type=str, default='/scratch/cluster/aish/rl_for_oal/',
                            help='Path to where agent directories are')
    arg_parser.add_argument('--agent-name', nargs='+', type=str,
                            default='reinforce_linear_gamma1_0_reward200_alpha0_01_beam3',
                            help='Dir names following agents-path')
    arg_parser.add_argument('--script-type', type=str, default='test',
                            help='Path to where agent directories are')

    arg_parser.add_argument('--output-dir', type=str,
                            default='../logs/qualitative_analysis/',
                            help='Directory for output files')

    args = arg_parser.parse_args()
    main(args)
