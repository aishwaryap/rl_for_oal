#!/usr/bin/python

# Assuming the initial version of a dialog agent (before init or training) is created, make n copies of it, and
# write scripts to init, train and test then

import os
import shutil
from argparse import ArgumentParser
from create_rl_scripts import *


def create_scripts_for_reruns(agents_path, agent_name, submit_files_dir, num_copies, reward):
    orig_agent_dir = os.path.join(agents_path, agent_name)

    init_submit_filename = os.path.join(submit_files_dir, agent_name + '_replication_init.sh')
    train_submit_filename = os.path.join(submit_files_dir, agent_name + '_replication_train.sh')
    test_submit_filename = os.path.join(submit_files_dir, agent_name + '_replication_test.sh')
    init_submit_file = open(init_submit_filename, 'w')
    train_submit_file = open(train_submit_filename, 'w')
    test_submit_file = open(test_submit_filename, 'w')

    for i in range(num_copies):
        cur_agent_name = agent_name + '_rerun_' + str(i)
        target_agent_dir = os.path.join(agents_path, cur_agent_name)

        if os.path.isdir(target_agent_dir):
            shutil.rmtree(target_agent_dir)
            # Needed because copytree below assumes that the target directory does not exist
        shutil.copytree(orig_agent_dir, target_agent_dir)

        # Condor script to init
        create_condor_script(cur_agent_name + '_init', 'condorized_init_policy_reward_short.sh', cur_agent_name + ' static '
                             + str(reward))
        init_submit_file.write('condor_submit ' + condor_scripts_dir + cur_agent_name + '_init.sh\n')

        # Condor script to train
        create_condor_script(cur_agent_name + '_train', 'condorized_train_policy_reward_short.sh', cur_agent_name + ' '
                             + str(reward))
        train_submit_file.write('condor_submit ' + condor_scripts_dir + cur_agent_name + '_train.sh\n')

        # Condor script to test
        create_condor_script(cur_agent_name + '_test', 'condorized_test_policy.sh', cur_agent_name)
        test_submit_file.write('condor_submit ' + condor_scripts_dir + cur_agent_name + '_test.sh\n')

    init_submit_file.close()
    train_submit_file.close()
    test_submit_file.close()


if __name__ == '__main__':
    arg_parser = ArgumentParser()
    arg_parser.add_argument('--agents-path', type=str, default='/scratch/cluster/aish/rl_for_oal/',
                            help='Path to agent dirs')
    arg_parser.add_argument('--agent-name', type=str, required=True, help='Agent to replicate')
    arg_parser.add_argument('--reward', type=int, default=100, help='Success reward')
    arg_parser.add_argument('--num-copies', type=int, default=10, help='Number of copies needed')
    arg_parser.add_argument('--submit-files-dir', type=str, default='../scripts/replication/',
                            help='Path to create submit files')
    args = arg_parser.parse_args()
    create_scripts_for_reruns(args.agents_path, args.agent_name, args.submit_files_dir, args.num_copies, args.reward)
