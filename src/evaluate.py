from argparse import ArgumentParser
import os
import csv
import matplotlib.pyplot as plt


def evaluate(args):
    all_avg_success = dict()
    all_avg_len = dict()
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
                    avg_success.append(sum([stats[2] for stats in stats_beam]) / float(args.averaging_beam))
                    avg_len.append(sum([stats[3] for stats in stats_beam]) / float(args.averaging_beam))
                    stats_beam.remove(stats_beam[0])
                    stats_beam.append(row)
        all_avg_success[agent_name] = avg_success
        all_avg_len[agent_name] = avg_len

    colors = ['b', 'g', 'r', 'c', 'm', 'y', 'k']

    plt.figure()
    lines = list()
    for (idx, agent_name) in enumerate(args.agent_names):
        line = plt.plot(all_avg_success[agent_name], colors[idx], label=agent_name)
        lines.append(line)
    plt.legend(lines, args.agent_names)
    plt.ylabel('Average success')
    plt.savefig(args.success_image_file)

    plt.figure()
    lines = list()
    for (idx, agent_name) in enumerate(args.agent_names):
        line = plt.plot(all_avg_len[agent_name], colors[idx], label=agent_name)
        lines.append(line)
    plt.legend(lines, args.agent_names)
    plt.ylabel('Average lengths')
    plt.savefig(args.len_image_file)


if __name__ == '__main__':
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--output-path', type=str, default='/scratch/cluster/aish/rl_for_oal/',
                            help='Path to where agent directories are')
    arg_parser.add_argument('--agent-names', nargs='+', type=str, required=True,
                            help='Dir names following output-path')
    arg_parser.add_argument('--averaging-beam', type=int, default=10,
                            help='Number of dialogs to successively average over')
    arg_parser.add_argument('--success-image-file', type=str, required=True,
                            help='File to save plot of successes')
    arg_parser.add_argument('--len-image-file', type=str, required=True,
                            help='File to save plot of lengths')

    args = arg_parser.parse_args()
    evaluate(args)