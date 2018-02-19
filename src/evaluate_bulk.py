#!/usr/bin/python

from argparse import ArgumentParser
import os
import csv
import re


def main(args):
    with open(args.completed_test_file) as handle:
        lines = handle.read().strip().split('\n')
        agent_names = [re.sub('_test.sh', '', line.strip()) for line in lines]

    all_avg_success = dict()
    all_avg_len = dict()

    for agent_name in agent_names:
        print 'agent name =', agent_name
        dialog_stats_file = os.path.join(*[args.agents_path, agent_name + '_test', 'test_stats.txt'])
        #dialog_stats_file = os.path.join(*[args.agents_path, agent_name, 'train_stats.txt'])        
        avg_success = list()
        avg_len = list()

        with open(dialog_stats_file) as handle:
            reader = csv.reader(handle, delimiter=',')
            all_stats = list()
            for row in reader:
                all_stats.append(row)

        num_batches = len(all_stats) / args.averaging_beam

        print 'len(stats) =', len(all_stats)
        print 'num_batches =', num_batches

        for batch_num in range(num_batches):
            start = batch_num * args.averaging_beam
            end = (batch_num + 1) * args.averaging_beam
            print 'batch_num =', batch_num, ', start =', start, ', end =', end
            batch_stats = all_stats[start:end]
            print 'agent_name =', agent_name, ', batch_stats:',len(batch_stats)
            avg_success.append(sum([float(stats[2]) for stats in batch_stats]) / float(args.averaging_beam))
            avg_len.append(sum([float(stats[3]) for stats in batch_stats]) / float(args.averaging_beam))

        all_avg_success[agent_name] = avg_success
        all_avg_len[agent_name] = avg_len

    with open(args.success_file, 'w') as handle:
        writer = csv.writer(handle, delimiter=',')
        for (agent_name, avg_success) in all_avg_success.items():
            row = [agent_name] + avg_success
            writer.writerow(row)

    with open(args.len_file, 'w') as handle:
        writer = csv.writer(handle, delimiter=',')
        for (agent_name, avg_len) in all_avg_len.items():
            row = [agent_name] + avg_len
            writer.writerow(row)


if __name__ == '__main__':
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--agents-path', type=str, default='/scratch/cluster/aish/rl_for_oal/',
                            help='Path to where agent directories are')
    arg_parser.add_argument('--completed-test-file', type=str, default='../logs/completed_test.txt',
                            help='List of test scripts that finished')
    arg_parser.add_argument('--success-file', type=str, default='../logs/success.txt',
                            help='File to write avg success stats')
    arg_parser.add_argument('--len-file', type=str, default='../logs/len.txt',
                            help='File to write avg len stats')
    arg_parser.add_argument('--averaging-beam', type=int, default=100,
                            help='Number of dialogs to successively average over')

    args = arg_parser.parse_args()
    main(args)
