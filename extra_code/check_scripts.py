#!/usr/bin/python

import re
import os
from argparse import ArgumentParser


def get_errors(err_filename, pickle_errors_file, pickle_error_types_file, other_errors_file, other_error_types_file):
    ignore_strs = [
        '/u/aish/.local/lib/python2.7/site-packages/sklearn/utils/validation.py:395: DeprecationWarning: ' +
        'Passing 1d arrays as data is deprecated in 0.17 and will raise ValueError in 0.19. Reshape your ' +
        'data either using X.reshape(-1, 1) if your data has a single feature or X.reshape(1, -1) if it ' +
        'contains a single sample.',
        'DeprecationWarning)'
        ]

    errors = dict()
    cur_error = None
    last_line = None

    with open(err_filename) as handle:
        for line in handle:
            if len(line.strip()) == 0 or line.strip() in ignore_strs:
                if cur_error is not None:
                    errors[last_line] = cur_error
            elif line.startswith('Exception in thread') or cur_error is None:
                cur_error = [line.strip()]
                last_line = line.strip()
            else:
                cur_error += [line.strip()]
                last_line = line.strip()
        if cur_error is not None:
            errors[last_line] = cur_error

    for (error_msg, trace) in errors.items():
        error_type = error_msg.split(':')[0]
        trace_str = '\n'.join(trace)
        if 'pickle.py' in trace_str:
            pickle_errors_file.write(trace_str + '\n\n')
            pickle_error_types_file.write(error_type + '\n')
        else:
            other_errors_file.write(trace_str + '\n\n')
            other_error_types_file.write(error_type + '\n')

    return errors


def main(args):
    policies = dict()
    orig_policy_creation_file = open(args.orig_policy_creation_file)
    new_policy_creation_file = open(args.new_policy_creation_file, 'w')
    if args.recreate_policies:
        cur_policy_code = list()
        cur_policy_name = None
        for line in orig_policy_creation_file:
            if line.startswith('# ---'):
                if cur_policy_name is not None:
                    cur_policy_code.append(line)
                    policies[cur_policy_name] = cur_policy_code
            elif line.startswith('AGENT_NAME='):
                cur_policy_code = [line]
                cur_policy_name = line.strip().split('=')[1]
            else:
                cur_policy_code.append(line)

        print policies

    condor_scripts_dir = os.path.join(args.condor_dir, 'scripts')
    condor_err_dir = os.path.join(args.condor_dir, 'err')

    pickle_errors_file = open(args.pickle_errors_file, 'w')
    pickle_error_types_file = open(args.pickle_error_types_file, 'w')
    other_errors_file = open(args.other_errors_file, 'w')
    other_error_types_file = open(args.other_error_types_file, 'w')

    scripts = os.listdir(condor_scripts_dir)
    required_scripts = [f for f in scripts if f.endswith('_' + args.script_type + '.sh')]

    resubmit_file = open(args.resubmit_file, 'w')
    completed_file = open(args.completed_file, 'w')
    incomplete_file = open(args.incomplete_file, 'w')

    for script in required_scripts:
        print '\nscript =', script
        err_file = os.path.join(condor_err_dir, re.sub('.sh', '.err', script))

        if not os.path.isfile(err_file):
            incomplete_file.write(script + '\n')
            continue

        errors = get_errors(err_file, pickle_errors_file, pickle_error_types_file, other_errors_file, other_error_types_file)
        if len(errors.keys()) > 0:
            print 'Error found'
            resubmit_file.write('condor_submit ' + os.path.join(condor_scripts_dir, script) + '\n')
            if args.recreate_policies:
                code = policies[re.sub('_init.sh', '', script)]
                new_policy_creation_file.write(''.join(code))
            continue
        
        if args.script_type == 'test':
            stats_file = os.path.join(*[args.agent_path, re.sub('_' + args.script_type + '.sh', '', script) + '_test', args.script_type + '_stats.txt'])
        elif args.script_type == 'fixedlen_test':
            stats_file = os.path.join(*[args.agent_path, re.sub('.sh', '', script), 'test_stats.txt'])
        elif args.script_type == 'fixedlen_train':
            stats_file = os.path.join(*[args.agent_path, re.sub('_train.sh', '', script), 'train_stats.txt'])
        else:
            stats_file = os.path.join(*[args.agent_path, re.sub('_' + args.script_type + '.sh', '', script), args.script_type + '_stats.txt'])

        print 'Stats file =', stats_file
        if not os.path.isfile(stats_file):
            incomplete_file.write(script + '\n')
        else:
            num_lines = 0
            with open(stats_file) as handle:
                for _ in handle:
                    num_lines += 1
            if num_lines >= args.num_stats_expected:
                completed_file.write(script + '\n')
            else:
                incomplete_file.write(script + '\n')

    resubmit_file.close()
    completed_file.close()
    incomplete_file.close()
    orig_policy_creation_file.close()
    new_policy_creation_file.close()

    pickle_errors_file.close()
    pickle_error_types_file.close()
    other_errors_file.close()
    other_error_types_file.close()


if __name__ == '__main__':
    arg_parser = ArgumentParser()
    arg_parser.add_argument('--condor-dir', type=str, default='/scratch/cluster/aish/rl_for_oal/condor/',
                            help='Path to condor dir')
    arg_parser.add_argument('--agent-path', type=str, default='/scratch/cluster/aish/rl_for_oal/',
                            help='Path to agent dirs')

    arg_parser.add_argument('--script-type', type=str, required=True,
                            help='One of init, train, test')
    arg_parser.add_argument('--num-stats-expected', type=int, default=1000,
                            help='Number of lines expected in a complete stats file')

    arg_parser.add_argument('--resubmit-file', type=str, default=None,
                            help='File to write condor submit commands to resubmit')
    arg_parser.add_argument('--completed-file', type=str, default=None,
                            help='File to write list fo completed files')
    arg_parser.add_argument('--incomplete-file', type=str, default=None,
                            help='File to write list of files still running')

    arg_parser.add_argument('--orig-policy-creation-file', type=str, default='../scripts/create_policies.sh',
                            help='Original script which created policies')
    arg_parser.add_argument('--new-policy-creation-file', type=str, default='../scripts/recreate_policies.sh',
                            help='Original script which created policies')
    arg_parser.add_argument('--recreate-policies', action="store_true", default=False,
                            help='Add this flag if policies need to be instantiated again')

    arg_parser.add_argument('--pickle-errors-file', type=str, default='../logs/pickle_errors.txt',
                            help='File to write pickle errors')
    arg_parser.add_argument('--other-errors-file', type=str, default='../logs/other_errors.txt',
                            help='File to write other errors')
    arg_parser.add_argument('--pickle-error-types-file', type=str, default='../logs/pickle_error_types.txt',
                            help='File to write pickle error types')
    arg_parser.add_argument('--other-error-types-file', type=str, default='../logs/other_error_types.txt',
                            help='File to write other error types')

    arg_parser.add_argument('--print-error-types', action="store_true", default=False,
                            help='Add this to summarize error types')

    args = arg_parser.parse_args()

    if args.resubmit_file is None:
        args.resubmit_file = '../scripts/condor_' + args.script_type + '_resubmit.sh'
    if args.completed_file is None:
        args.completed_file = '../logs/completed_' + args.script_type + '.txt'
    if args.incomplete_file is None:
        args.incomplete_file = '../logs/incomplete_' + args.script_type + '.txt'

    main(args)
