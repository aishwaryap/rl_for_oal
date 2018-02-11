
import re
import os
from argparse import ArgumentParser


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
    condor_out_dir = os.path.join(args.condor_dir, 'out')

    scripts = os.listdir(condor_scripts_dir)
    required_scripts = [f for f in scripts if f.endswith('_' + args.script_type + '.sh')]

    error_regex = re.compile('.*Exception.*')

    resubmit_file = open(args.resubmit_file, 'w')
    completed_file = open(args.completed_file, 'w')
    incomplete_file = open(args.incompleted_file, 'w')

    for script in required_scripts:
        print '\nscript =', script
        err_file = os.path.join(condor_err_dir, re.sub('.sh', '.err', script))
        print 'Error file =', err_file
        with open(err_file) as handle:
            err = handle.read().strip()
            if error_regex.match(err):
                print 'Error found'
                resubmit_file.write('condor_submit ' + os.path.join(condor_scripts_dir, script) + '\n')
                if args.recreate_policies:
                    code = policies[re.sub('_init.sh', '', script)]
                    code.insert(2, './remove_agent_dirs.sh $AGENT_NAME\n')
                    new_policy_creation_file.write(''.join(code))
                continue
        out_file = os.path.join(condor_out_dir, re.sub('.sh', '.out', script))
        print 'Output file =', out_file
        with open(out_file) as handle:
            out = handle.read().strip().lower()
            if len(out) > 0:
                completed_file.write(script + '\n')
            else:
                incomplete_file.write(script + '\n')

    resubmit_file.close()
    completed_file.close()
    incomplete_file.close()
    orig_policy_creation_file.close()
    new_policy_creation_file.close()


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
    arg_parser.add_argument('--incomplete-file', type=str, required=True,
                            help='File to write list of files still running')
    arg_parser.add_argument('--orig-policy-creation-file', type=str, default='../scripts/create_policies.sh',
                            help='Original script which created policies')
    arg_parser.add_argument('--new-policy-creation-file', type=str, default='../scripts/recreate_policies.sh',
                            help='Original script which created policies')
    arg_parser.add_argument('--recreate-policies', action="store_true", default=False,
                            help='Add this flag if policies need to be instantiated again')

    args = arg_parser.parse_args()

    main(args)
