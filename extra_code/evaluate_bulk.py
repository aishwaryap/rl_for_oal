#!/usr/bin/python

from argparse import ArgumentParser
import os
import csv
import re
from scipy.stats import ttest_ind
import operator


def main(args):
    if args.submit_file is not None:
        with open(args.submit_file) as handle:
            lines = handle.read().strip().split('\n')
            if args.script_type == 'test':
                agent_names = [re.sub('.sh\'', '', line.split()[3].split('/')[-1].strip()) for line in lines]
            else:
                agent_names = [re.sub('_' + args.script_type + '.sh\'', '', line.split()[3].split('/')[-1].strip())
                               for line in lines]
    elif args.agent_list_file is not None:
        with open(args.agent_list_file) as handle:
            agent_names = handle.read().split('\n')
    else:
        print 'No agent list provided'
        return

    if args.script_type == 'test':
        baselines = ['static_test', 'static2_test']
    else:
        baselines = ['static', 'static2']
    agent_names = agent_names + baselines

    all_avg_success = dict()
    all_avg_len = dict()
    final_batches = dict()
    improved = list()
    trending_improved = list()

    num_batches_file = open(args.num_batches_file, 'w')
    num_batches_writer = csv.writer(num_batches_file, delimiter=',')

    p_values_improved_file = open(args.p_values_improved_file, 'w')
    p_values_improved_writer = csv.writer(p_values_improved_file, delimiter=',')

    p_values_baseline_file = open(args.p_values_baseline_file, 'w')
    p_values_baseline_writer = csv.writer(p_values_baseline_file, delimiter=',')

    for agent_name in agent_names:
        print 'agent name =', agent_name
        dialog_stats_file = os.path.join(*[args.agents_path, agent_name, args.script_type + '_stats.txt'])
        print dialog_stats_file

        if not os.path.isfile(dialog_stats_file):
            continue

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
        num_batches_writer.writerow([agent_name, num_batches])
        if num_batches == 0:
            continue

        first_batch = None
        last_batch = None

        for batch_num in range(num_batches):
            start = batch_num * args.averaging_beam
            end = (batch_num + 1) * args.averaging_beam
            print 'batch_num =', batch_num, ', start =', start, ', end =', end
            batch_stats = all_stats[start:end]
            if batch_num == 0:
                first_batch = [int(stats[3]) for stats in batch_stats]
            elif batch_num == num_batches - 1:
                last_batch = [int(stats[3]) for stats in batch_stats]
                final_batches[agent_name] = last_batch

            print 'agent_name =', agent_name, ', batch_stats:',len(batch_stats)
            avg_success.append(sum([float(stats[3]) for stats in batch_stats]) / float(args.averaging_beam))
            avg_len.append(sum([float(stats[4]) for stats in batch_stats]) / float(args.averaging_beam))

        if first_batch is not None and last_batch is not None:
            print 'first_batch =', first_batch
            print 'last_batch =', last_batch
            t, p = ttest_ind(first_batch, last_batch)
            print 't =', t, ', p =', p
            # x = raw_input()
            p_values_improved_writer.writerow([agent_name, avg_success[-1] > avg_success[0], p])
            if avg_success[-1] > avg_success[0]:
                if p < 0.05:
                    improved.append(agent_name)
                elif p < 0.1:
                    trending_improved.append(agent_name)

        all_avg_success[agent_name] = avg_success
        all_avg_len[agent_name] = avg_len

    num_batches_file.close()

    with open(args.improved_file, 'w') as handle:
        handle.write('Improved \n' + '\n'.join(improved) + '\n\n')
        handle.write('Trending Improved \n' + '\n'.join(trending_improved) + '\n\n')

    for baseline in baselines:
        if baseline not in all_avg_success:
            continue
        better = list()
        trending_better = list()
        for agent_name in final_batches:
            static_results = final_batches[baseline]
            this_results = final_batches[agent_name]
            t, p = ttest_ind(static_results, this_results)
            p_values_baseline_writer.writerow([agent_name,
                                               all_avg_success[agent_name][-1] > all_avg_success[baseline][-1], p])
            if all_avg_success[agent_name][-1] > all_avg_success[baseline][-1]:
                if p < 0.05:
                    better.append(agent_name)
                elif p < 0.1:
                    trending_better.append(agent_name)
        with open(args.improved_file, 'a') as handle:
            handle.write('Better than ' + baseline + '\n' + '\n'.join(better) + '\n\n')
            handle.write('Trending better than ' + baseline + '\n' + '\n'.join(trending_better) + '\n\n')

    p_values_improved_file.close()
    p_values_baseline_file.close()

    success_list = all_avg_success.items()
    success_list.sort(key=operator.itemgetter(1), reverse=True)
    with open(args.success_file, 'w') as handle:
        writer = csv.writer(handle, delimiter=',')
        for (agent_name, avg_success) in success_list:
            row = [agent_name] + avg_success
            writer.writerow(row)

    len_list = [(agent_name, all_avg_len[agent_name]) for (agent_name, avg_success) in success_list]
    with open(args.len_file, 'w') as handle:
        writer = csv.writer(handle, delimiter=',')
        for (agent_name, avg_len) in len_list:
            row = [agent_name] + avg_len
            writer.writerow(row)


if __name__ == '__main__':
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--agents-path', type=str, default='/scratch/cluster/aish/rl_for_oal/',
                            help='Path to where agent directories are')
    arg_parser.add_argument('--script-type', type=str, default='test',
                            help='Path to where agent directories are')
    arg_parser.add_argument('--submit-file', type=str, default=None,
                            help='Condor submit file')
    arg_parser.add_argument('--agent-list-file', type=str, default=None,
                            help='List of agents')
    arg_parser.add_argument('--success-file', type=str, default=None,
                            help='File to write avg success stats')
    arg_parser.add_argument('--len-file', type=str, default=None,
                            help='File to write avg len stats')
    arg_parser.add_argument('--improved-file', type=str, default=None,
                            help='File to write which agents improved')
    arg_parser.add_argument('--p-values-improved-file', type=str, default=None,
                            help='File to write p values of agent improvement')
    arg_parser.add_argument('--p-values-baseline-file', type=str, default=None,
                            help='File to write p values of comparison with baseline')

    arg_parser.add_argument('--num-batches-file', type=str, default=None,
                            help='File to write number of batches per agent')
    arg_parser.add_argument('--averaging-beam', type=int, default=100,
                            help='Number of dialogs to successively average over')

    args = arg_parser.parse_args()

    if args.agent_list_file is None and args.submit_file is None:
        args.submit_file = '../scripts/condor_submit_' + args.script_type + '3.sh'
    if args.success_file is None:
        args.success_file = '../logs/success_' + args.script_type + '.csv'
    if args.len_file is None:
        args.len_file = '../logs/len_' + args.script_type + '.csv'
    if args.improved_file is None:
        args.improved_file = '../logs/improved_' + args.script_type + '.txt'
    if args.num_batches_file is None:
        args.num_batches_file = '../logs/num_batches_' + args.script_type + '.csv'
    if args.p_values_improved_file is None:
        args.p_values_improved_file = '../logs/p_values_improved_file_' + args.script_type + '.csv'
    if args.p_values_baseline_file is None:
        args.p_values_baseline_file = '../logs/p_values_baseline_file_' + args.script_type + '.csv'

    main(args)
