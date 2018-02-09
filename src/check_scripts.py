
import re
import os
from argparse import ArgumentParser


def main(args):
    condor_scripts_dir = os.path.join(args.condor_dir, 'scripts')
    condor_err_dir = os.path.join(args.condor_dir, 'err')
    condor_out_dir = os.path.join(args.condor_dir, 'out')

    scripts = os.listdir(condor_scripts_dir)
    required_scripts = [f for f in scripts if f.endswith('_' + args.script_type + '.sh')]

    error_regex = re.compile('.*error.*')

    resubmit_file = open(args.resubmit_file, 'w')
    completed_file = open(args.completed_file, 'w')

    for script in required_scripts:
        err_file = os.path.join(condor_err_dir, re.sub('.sh', '.err', script))
        with open(err_file) as handle:
            err = handle.read().strip().lower()
            if error_regex.match(err):
                resubmit_file.write('condor_submit ' + os.path.join(condor_scripts_dir, script) + '\n')
                continue
        out_file = os.path.join(condor_out_dir, re.sub('.sh', '.out', script))
        with open(out_file) as handle:
            out = handle.read().strip().lower()
            if len(out) > 0:
                completed_file.write(script + '\n')


if __name__ == '__main__':
    arg_parser = ArgumentParser()
    arg_parser.add_argument('--condor-dir', type=str, default='/scratch/cluster/aish/rl_for_oal/condor/',
                            help='Path to condor dir')
    arg_parser.add_argument('--script-type', type=str, required=True,
                            help='One of init, train, test')
    arg_parser.add_argument('--resubmit-file', type=str, required=True,
                            help='File to write condor submit commands to resubmit')
    arg_parser.add_argument('--completed-file', type=str, required=True,
                            help='File to write list fo completed files')

    args = arg_parser.parse_args()

    main(args)