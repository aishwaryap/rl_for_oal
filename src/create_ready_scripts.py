#!/usr/bin/python

from argparse import ArgumentParser
import re


def main(args):
    next_script_type = {'init': 'train', 'train': 'test'}
    completed_filename = '../logs/completed_' + args.script_type + '.txt'
    ready_filename = '../scripts/ready_' + next_script_type[args.script_type] + '.txt'
    completed_file = open(completed_filename)
    ready_file = open(ready_filename, 'w')
    prefix = 'condor_submit /scratch/cluster/aish/rl_for_oal/condor/scripts/'
    for line in completed_file:
        ready_file.write(prefix + re.sub(args.script_type, next_script_type[args.script_type], line))


if __name__ == '__main__':
    arg_parser = ArgumentParser()
    arg_parser.add_argument('--script-type', type=str, required=True,
                            help='One of init, train, test')
    args = arg_parser.parse_args()
    main(args)