import matplotlib
matplotlib.use('Agg')

from argparse import ArgumentParser
import os
import csv
import matplotlib.pyplot as plt
import pickle
import operator
import sys


def plot_graphs(args):
    all_avg_success = dict()
    all_avg_len = dict()
    min_stats_length = sys.maxint
    for agent_name in args.agent_names:
        dialog_stats_file = os.path.join(*[args.output_path, agent_name, 'stats.txt'])
        avg_success = list()
        avg_len = list()
        stats_beam = list()
        with open(dialog_stats_file) as handle:
            reader = csv.reader(handle, delimiter=',')
            for row in reader:
                if len(stats_beam) < args.averaging_beam:
                    stats_beam.append(row)
                else:
                    avg_success.append(sum([float(stats[2]) for stats in stats_beam]) / float(args.averaging_beam))
                    avg_len.append(sum([float(stats[3]) for stats in stats_beam]) / float(args.averaging_beam))
                    stats_beam.remove(stats_beam[0])
                    stats_beam.append(row)
        all_avg_success[agent_name] = avg_success
        all_avg_len[agent_name] = avg_len
        print 'agent_name =', agent_name, ', len(avg_success) =', len(avg_success)
        min_stats_length = min(min_stats_length, len(avg_success))

    colors = ['b', 'g', 'r', 'c', 'm', 'y', 'k']

    plt.figure()
    lines = list()
    for (idx, agent_name) in enumerate(args.agent_names):
        line, = plt.plot(all_avg_success[agent_name][:min_stats_length], colors[idx], label=agent_name)
        lines.append(line)
    # plt.legend(lines, args.agent_names)
    plt.legend(bbox_to_anchor=(0, 0), loc='lower left')
    plt.ylabel('Average success')
    plt.savefig(args.success_image_file)

    plt.figure()
    lines = list()
    for (idx, agent_name) in enumerate(args.agent_names):
        line, = plt.plot(all_avg_len[agent_name][:min_stats_length], colors[idx], label=agent_name)
        lines.append(line)
    # plt.legend(lines, args.agent_names)
    plt.legend(bbox_to_anchor=(1, 1))
    plt.ylabel('Average lengths')
    plt.savefig(args.len_image_file)


def count_labels(args):
    for agent_name in args.agent_names:
        train_labels_dir = os.path.join(*[args.output_path, agent_name, 'labels/train/'])
        predicate_files = [os.path.join(train_labels_dir, f) for f in os.listdir(train_labels_dir)]
        frequent_train_labels = list()
        for filename in predicate_files:
            with open(filename, 'rb') as handle:
                labels = pickle.load(handle)
                predicate = filename.split('/')[-1]
                if len(frequent_train_labels) < args.num_to_display:
                    frequent_train_labels.append((predicate, len(labels)))
                    frequent_train_labels.sort(key=operator.itemgetter(1), reverse=True)
                elif len(labels) > frequent_train_labels[-1][1]:
                    frequent_train_labels.remove(frequent_train_labels[-1])
                    frequent_train_labels.append((predicate, len(labels)))
                    frequent_train_labels.sort(key=operator.itemgetter(1), reverse=True)
        print 'Agent', agent_name, ', frequent train labels :'
        for (predicate, freq) in frequent_train_labels:
            print '\t', predicate, ':', freq

        val_labels_dir = os.path.join(*[args.output_path, agent_name, 'labels/val/'])
        predicate_files = [os.path.join(val_labels_dir, f) for f in os.listdir(val_labels_dir)]
        frequent_val_labels = list()
        for filename in predicate_files:
            with open(filename, 'rb') as handle:
                labels = pickle.load(handle)
                predicate = filename.split('/')[-1]
                if len(frequent_val_labels) < args.num_to_display:
                    frequent_val_labels.append((predicate, len(labels)))
                    frequent_val_labels.sort(key=operator.itemgetter(1), reverse=True)
                elif len(labels) > frequent_val_labels[-1][1]:
                    frequent_val_labels.remove(frequent_val_labels[-1])
                    frequent_val_labels.append((predicate, len(labels)))
                    frequent_val_labels.sort(key=operator.itemgetter(1), reverse=True)
        print 'Agent', agent_name, ', frequent val labels :'
        for (predicate, freq) in frequent_val_labels:
            print '\t', predicate, ':', freq


if __name__ == '__main__':
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--output-path', type=str, default='/scratch/cluster/aish/rl_for_oal/',
                            help='Path to where agent directories are')
    arg_parser.add_argument('--agent-names', nargs='+', type=str, required=True,
                            help='Dir names following output-path')

    arg_parser.add_argument('--plot-graphs', action="store_true", default=False,
                            help='Plot success and len graphs')
    arg_parser.add_argument('--averaging-beam', type=int, default=100,
                            help='Number of dialogs to successively average over')
    arg_parser.add_argument('--success-image-file', type=str, default=None,
                            help='File to save plot of successes')
    arg_parser.add_argument('--len-image-file', type=str, default=None,
                            help='File to save plot of lengths')

    arg_parser.add_argument('--count-labels', action="store_true", default=False,
                            help='Count labels acquired per predicate')
    arg_parser.add_argument('--num-to-display', type=int, default=5,
                            help='Per agent, number of predicates to display (with most labels)')

    args = arg_parser.parse_args()

    if args.plot_graphs:
        plot_graphs(args)
    if args.count_labels:
        count_labels(args)
