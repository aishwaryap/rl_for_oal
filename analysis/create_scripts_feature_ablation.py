
from create_scripts_for_reruns import *


def main(args):
    base_code = [
        'AGENT_NAME=' + args.agent_name,
        'cd ../scripts',
        './remove_agent_dirs.sh $AGENT_NAME',
        './create_agent_dirs.sh $AGENT_NAME',
        'cd ../src',
        'python ReinforceRLPolicy.py \\',
        '    --model-type=linear \\',
        '    --gamma=1.0 \\',
        '    --candidate-questions-beam-size=3 \\',
        '    --alpha=0.01 \\',
        '    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl'
    ]

    if not os.path.isdir(args.condor_scripts_dir):
        os.mkdir(args.condor_scripts_dir)

    create_scripts_code = [
        'python create_scripts_for_reruns.py \\',
        '    --submit-files-dir=' + args.condor_scripts_dir + ' \\',
        '    --reward=' + str(args.reward) + ' \\',
        '    --agent-name='
    ]

    create_policies_filename = os.path.join(args.scripts_dir, 'create_policies.sh')
    create_policies_file = open(create_policies_filename, 'w')
    create_policies_file.write('cd ../../src/\n\n')

    create_scripts_filename = os.path.join(args.scripts_dir, 'create_scripts.sh')
    create_scripts_file = open(create_scripts_filename, 'w')
    create_scripts_file.write('cd ../../extra_code/\n\n')

    init_submit_filename = os.path.join(args.scripts_dir, 'condor_submit_init.sh')
    train_submit_filename = os.path.join(args.scripts_dir, 'condor_submit_train.sh')
    test_submit_filename = os.path.join(args.scripts_dir, 'condor_submit_test.sh')
    agent_list_filename = os.path.join(args.scripts_dir, 'agent_list.sh')
    init_submit_file = open(init_submit_filename, 'w')
    train_submit_file = open(train_submit_filename, 'w')
    test_submit_file = open(test_submit_filename, 'w')
    agent_list_file = open(agent_list_filename, 'w')

    submit_machines = ['uvanimor-' + str(i) for i in range(1, 11)] + ['narsil-' + str(i) for i in range(1, 14)] + \
                      ['roadkill', 'streetpizza']
    submit_machine_idx = 0

    create_policies_file.write('\n'.join(base_code) + '\n\n')
    create_scripts_file.write('\n'.join(create_scripts_code) + args.agent_name + '\n\n')
    for j in range(10):
        agent_list_file.write(args.agent_name + '_rerun_' + str(j) + '\n')
    submit_machine = submit_machines[submit_machine_idx]
    init_submit_file.write('ssh aish@' + submit_machine + ' \'' + os.path.join(args.condor_scripts_dir, args.agent_name)
                           + '_replication_init.sh\'\n')
    train_submit_file.write('ssh aish@' + submit_machine + ' \''
                            + os.path.join(args.condor_scripts_dir, args.agent_name) + '_replication_train.sh\'\n')
    test_submit_file.write('ssh aish@' + submit_machine + ' \'' + os.path.join(args.condor_scripts_dir, args.agent_name)
                           + '_replication_test.sh\'\n')
    submit_machine_idx += 1

    for i in range(25):
        agent_name = args.agent_name + '_ablate' + str(i)
        for j in range(10):
            agent_list_file.write(agent_name + '_rerun_' + str(j) + '\n')

        code = [base_code[0] + '_ablate' + str(i)] + base_code[1:-1] + \
               ['    --ablate-feature=' + str(i) + ' \\', base_code[-1]]

        create_policies_file.write('\n'.join(code) + '\n\n')
        create_scripts_file.write('\n'.join(create_scripts_code) + agent_name + '\n\n')

        submit_machine = submit_machines[submit_machine_idx]
        init_submit_file.write('ssh aish@' + submit_machine + ' \'' + os.path.join(args.condor_scripts_dir, agent_name)
                               + '_replication_init.sh\'\n')
        train_submit_file.write('ssh aish@' + submit_machine + ' \'' + os.path.join(args.condor_scripts_dir, agent_name)
                                + '_replication_train.sh\'\n')
        test_submit_file.write('ssh aish@' + submit_machine + ' \'' + os.path.join(args.condor_scripts_dir, agent_name)
                               + '_replication_test.sh\'\n')
        submit_machine_idx += 1
        if submit_machine_idx >= len(submit_machines):
            submit_machine_idx = 0

    groups = ['guess', 'query']
    for group in groups:
        agent_name = args.agent_name + '_ablate_' + group
        for j in range(10):
            agent_list_file.write(agent_name + '_rerun_' + str(j) + '\n')

        code = [base_code[0] + '_ablate_' + group] + base_code[1:-1] + \
               ['    --ablate-feature-group=' + group + ' \\', base_code[-1]]
        create_policies_file.write('\n'.join(code) + '\n\n')
        create_scripts_file.write('\n'.join(create_scripts_code) + agent_name + '\n\n')

        submit_machine = submit_machines[submit_machine_idx]
        init_submit_file.write('ssh aish@' + submit_machine + ' \'' + os.path.join(args.condor_scripts_dir, agent_name)
                               + '_replication_init.sh\'\n')
        train_submit_file.write('ssh aish@' + submit_machine + ' \'' + os.path.join(args.condor_scripts_dir, agent_name)
                                + '_replication_train.sh\'\n')
        test_submit_file.write('ssh aish@' + submit_machine + ' \'' + os.path.join(args.condor_scripts_dir, agent_name)
                               + '_replication_test.sh\'\n')
        submit_machine_idx += 1
        if submit_machine_idx >= len(submit_machines):
            submit_machine_idx = 0

    create_policies_file.close()
    create_scripts_file.close()

    init_submit_file.close()
    train_submit_file.close()
    test_submit_file.close()
    agent_list_file.close()


if __name__ == '__main__':
    arg_parser = ArgumentParser()
    arg_parser.add_argument('--agents-path', type=str, default='/scratch/cluster/aish/rl_for_oal/',
                            help='Path to agent dirs')
    arg_parser.add_argument('--agent-name', type=str, default='learned', help='Agent to replicate')
    arg_parser.add_argument('--reward', type=int, default=200, help='Success reward')
    arg_parser.add_argument('--scripts-dir', type=str, default='../scripts/feature_ablation/',
                            help='Path to create submit files')
    arg_parser.add_argument('--condor-scripts-dir', type=str,
                            default='/scratch/cluster/aish/rl_for_oal/condor/feature_ablation/',
                            help='Path to create submit files')
    args = arg_parser.parse_args()
    main(args)
