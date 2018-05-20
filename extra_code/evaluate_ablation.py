#!/usr/bin/python

from argparse import ArgumentParser
import os
import csv
import numpy as np
from scipy.stats import ttest_ind


def write_p_values(baseline, final_batches, all_avg_success, p_values_filename):
    p_values_file = open(p_values_filename, 'w')
    p_values_writer = csv.writer(p_values_file, delimiter=',')
    for agent_name in final_batches:
        static_results = final_batches[baseline]
        this_results = final_batches[agent_name]
        t, p = ttest_ind(static_results, this_results, equal_var=False)
        mean_better = all_avg_success[agent_name][-1] > all_avg_success[baseline][-1]
        verdict = 'Same'
        if mean_better:
            if p < 0.05:
                verdict = 'better'
            elif p < 0.1:
                verdict = 'trending better'
        else:
            if p < 0.05:
                verdict = 'worse'
            elif p < 0.1:
                verdict = 'trending worse'
        p_values_writer.writerow([agent_name, mean_better, p, verdict])
    p_values_file.close()


def write_stats(stats_dict, stats_filename):
    with open(stats_filename, 'w') as handle:
        writer = csv.writer(handle, delimiter=',')
        for (agent_name, stats) in stats_dict.items():
            row = [agent_name] + stats
            writer.writerow(row)


def main(args):
    baseline = 'static'
    learned_agent_name = 'learned'

    ablate_group_agents = [learned_agent_name + '_ablate_' + s for s in ['query', 'guess']]
    ablate_feature_agents = [learned_agent_name + '_ablate' + str(i) for i in range(25)]

    learned_agent_names = [learned_agent_name] + ablate_group_agents + ablate_feature_agents

    learned_agents_reruns = []
    for agent_name in learned_agent_names:
        learned_agents_reruns += [agent_name + '_rerun_' + str(i) for i in range(10)]

    all_agent_names = learned_agents_reruns + [baseline]

    all_avg_success = dict()
    all_avg_len = dict()
    final_batches = dict()

    for agent_name in all_agent_names:
        print 'agent name =', agent_name
        if args.script_type == 'test':
            dialog_stats_file = os.path.join(*[args.agents_path, agent_name + '_test', args.script_type + '_stats.txt'])
        else:
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
        if num_batches == 0:
            continue

        for batch_num in range(num_batches):
            start = batch_num * args.averaging_beam
            end = (batch_num + 1) * args.averaging_beam
            print 'batch_num =', batch_num, ', start =', start, ', end =', end
            batch_stats = all_stats[start:end]
            if batch_num == num_batches - 1:
                last_batch = [int(stats[3]) for stats in batch_stats]
                final_batches[agent_name] = last_batch

            print 'agent_name =', agent_name, ', batch_stats:', len(batch_stats)
            avg_success.append(sum([float(stats[3]) for stats in batch_stats]) / float(args.averaging_beam))
            avg_len.append(sum([float(stats[4]) for stats in batch_stats]) / float(args.averaging_beam))

        all_avg_success[agent_name] = avg_success
        all_avg_len[agent_name] = avg_len

    max_stats_all_avg_success = dict()
    max_stats_all_avg_success[baseline] = all_avg_success[baseline]
    max_stats_all_avg_len = dict()
    max_stats_all_avg_len[baseline] = all_avg_len[baseline]
    max_stats_final_batches = dict()
    max_stats_final_batches[baseline] = final_batches[baseline]

    avg_stats_all_avg_success = dict()
    avg_stats_all_avg_success[baseline] = all_avg_success[baseline]
    avg_stats_all_avg_len = dict()
    avg_stats_all_avg_len[baseline] = all_avg_len[baseline]
    avg_stats_final_batches = dict()
    avg_stats_final_batches[baseline] = final_batches[baseline]

    for agent_name in learned_agent_names:
        # Get list of reruns for which stats were found
        reruns = [agent_name + '_rerun_' + str(i) for i in range(10)
                  if agent_name + '_rerun_' + str(i) in all_avg_success]
        if len(reruns) == 0:
            continue

        rerun_success_stats = [all_avg_success[rerun] for rerun in reruns]
        rerun_len_stats = [all_avg_len[rerun] for rerun in reruns]

        rerun_last_batch_success_stats = [stats[-1] for stats in rerun_success_stats]
        max_end_success_batch = np.argmax(rerun_last_batch_success_stats)

        max_stats_all_avg_success[agent_name] = rerun_success_stats[max_end_success_batch]
        max_stats_all_avg_len[agent_name] = rerun_len_stats[max_end_success_batch]
        max_stats_final_batches[agent_name] = final_batches[reruns[max_end_success_batch]]

        max_batches_per_rerun = 10
        avg_stats_all_avg_success[agent_name] = [0] * max_batches_per_rerun
        avg_stats_all_avg_len[agent_name] = [0] * max_batches_per_rerun
        all_reruns_last_batches = [final_batches[rerun] for rerun in reruns]
        avg_stats_final_batches[agent_name] = [item for sublist in all_reruns_last_batches for item in sublist]

        for batch_num in range(max_batches_per_rerun):
            num_reruns_added = 0.0
            for rerun_num in range(len(reruns)):
                if len(rerun_success_stats[rerun_num]) > batch_num:
                    avg_stats_all_avg_success[agent_name][batch_num] += rerun_success_stats[rerun_num][batch_num]
                    avg_stats_all_avg_len[agent_name][batch_num] += rerun_len_stats[rerun_num][batch_num]
                    num_reruns_added += 1.0
            avg_stats_all_avg_success[agent_name][batch_num] /= num_reruns_added
            avg_stats_all_avg_len[agent_name][batch_num] /= num_reruns_added

    max_stats_all_avg_success_file = os.path.join(args.stats_dir,
                                                  'max_stats_all_avg_success_' + args.script_type + '.csv')
    write_stats(max_stats_all_avg_success, max_stats_all_avg_success_file)
    max_stats_all_avg_len_file = os.path.join(args.stats_dir,
                                              'max_stats_all_avg_len_' + args.script_type + '.csv')
    write_stats(max_stats_all_avg_len, max_stats_all_avg_len_file)
    avg_stats_all_avg_success_file = os.path.join(args.stats_dir,
                                                  'avg_stats_all_avg_success_' + args.script_type + '.csv')
    write_stats(avg_stats_all_avg_success, avg_stats_all_avg_success_file)
    avg_stats_all_avg_len_file = os.path.join(args.stats_dir,
                                              'avg_stats_all_avg_len_' + args.script_type + '.csv')
    write_stats(avg_stats_all_avg_len, avg_stats_all_avg_len_file)

    max_stats_p_values_baseline_file = os.path.join(args.stats_dir,
                                                    'max_stats_p_values_baseline_' + args.script_type + '.csv')
    write_p_values(baseline, max_stats_final_batches, max_stats_all_avg_success, max_stats_p_values_baseline_file)
    max_stats_p_values_learned_file = os.path.join(args.stats_dir,
                                                   'max_stats_p_values_learned_' + args.script_type + '.csv')
    write_p_values(learned_agent_name, max_stats_final_batches, max_stats_all_avg_success,
                   max_stats_p_values_learned_file)
    avg_stats_p_values_baseline_file = os.path.join(args.stats_dir,
                                                    'avg_stats_p_values_baseline_' + args.script_type + '.csv')
    write_p_values(baseline, avg_stats_final_batches, avg_stats_all_avg_success, avg_stats_p_values_baseline_file)
    avg_stats_p_values_learned_file = os.path.join(args.stats_dir,
                                                   'avg_stats_p_values_learned_' + args.script_type + '.csv')
    write_p_values(learned_agent_name, max_stats_final_batches, avg_stats_all_avg_success,
                   avg_stats_p_values_learned_file)


if __name__ == '__main__':
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--agents-path', type=str, default='/scratch/cluster/aish/rl_for_oal/',
                            help='Path to where agent directories are')
    arg_parser.add_argument('--script-type', type=str, default='test',
                            help='Path to where agent directories are')

    arg_parser.add_argument('--stats_dir', type=str, default='../logs/feature_ablation',
                            help='Path to write stats')

    arg_parser.add_argument('--averaging-beam', type=int, default=100,
                            help='Number of dialogs to successively average over')

    args = arg_parser.parse_args()

    main(args)
