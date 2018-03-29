
import itertools
import re
import os


condor_dir = '/scratch/cluster/aish/rl_for_oal/condor/'
condor_scripts_dir = '/scratch/cluster/aish/rl_for_oal/condor/scripts/'
condor_log_dir = '/scratch/cluster/aish/rl_for_oal/condor/log/'
condor_err_dir = '/scratch/cluster/aish/rl_for_oal/condor/err/'
condor_out_dir = '/scratch/cluster/aish/rl_for_oal/condor/out/'


def get_agent_name(model_type, gamma, beam_size, guess_predictor, on_topic, alpha):
    agent_name = 'actorcritic_' + model_type + '_gamma' + re.sub('\.', '_', str(gamma)) \
                 + '_alpha' + re.sub('\.', '_', str(alpha))
    if beam_size is not None:
        agent_name = agent_name + '_beam' + str(beam_size)
    else:
        agent_name = agent_name + '_beamfull'
    if guess_predictor:
        agent_name = agent_name + '_sepguess'
    if on_topic:
        agent_name = agent_name + '_ontopic'
    return agent_name


def create_condor_script(filename, script_to_run, args_str):
    full_filename = os.path.join(condor_scripts_dir, filename + '.sh')
    condor_script_file = open(full_filename, 'w')
    condor_script_file.write('universe = vanilla\n')
    condor_script_file.write('Initialdir = /u/aish/Documents/Research/Code/rl_for_oal/scripts/\n')
    condor_script_file.write('Executable = /lusr/bin/bash\n')
    condor_script_file.write('Arguments = ' + script_to_run + ' ' + args_str + '\n')
    condor_script_file.write('+Group   = "GRAD"\n')
    condor_script_file.write('+Project = "AI_ROBOTICS"\n')
    condor_script_file.write('+ProjectDescription = "RL for OAL"\n')
    condor_script_file.write('JobBatchName = "RL for OAL"\n')
    condor_script_file.write('Requirements = InMastodon\n')
    condor_script_file.write('Log = ' + os.path.join(condor_log_dir, filename + '.log') + '\n')
    condor_script_file.write('Error = ' + os.path.join(condor_err_dir, filename + '.err') + '\n')
    condor_script_file.write('Output = ' + os.path.join(condor_out_dir, filename + '.out') + '\n')
    condor_script_file.write('Queue 1\n')
    condor_script_file.close()


def main():
    create_policies_filename = '../scripts/create_policies_actorcritic.sh'
    condor_submit_init_filename = '../scripts/condor_submit_init_actorcritic.sh'
    condor_submit_train_filename = '../scripts/condor_submit_train_actorcritic.sh'
    condor_submit_test_filename = '../scripts/condor_submit_test_actorcritic.sh'

    model_types = ['linear', 'mlp']
    gamma = [1.0]
    beam_size = [1, 3, 10, None]
    guess_predictor = [False]
    on_topic = [False]
    alpha = [1.0, 0.1, 0.01]

    settings = list(itertools.product(model_types, gamma, beam_size, guess_predictor, on_topic, alpha))

    create_policies_file = open(create_policies_filename, 'w')
    condor_submit_init_file = open(condor_submit_init_filename, 'w')
    condor_submit_train_file = open(condor_submit_train_filename, 'w')
    condor_submit_test_file = open(condor_submit_test_filename, 'w')

    dirs_to_create = [condor_dir, condor_scripts_dir, condor_log_dir, condor_err_dir, condor_out_dir]
    for dir_name in dirs_to_create:
        if not os.path.isdir(dir_name):
            os.mkdir(dir_name)

    create_policies_file.write('cd ../src\n\n')

    for (model_type, gamma, beam_size, guess_predictor, on_topic, alpha) in settings:
        agent_name = get_agent_name(model_type, gamma, beam_size, guess_predictor, on_topic, alpha)

        # Call scripts to create policy
        create_policies_file.write('# -----------------------------------------------------------------------------\n')
        create_policies_file.write('AGENT_NAME=' + agent_name + '\n')
        create_policies_file.write('cd ../scripts\n')
        create_policies_file.write('./remove_agent_dirs.sh $AGENT_NAME\n')
        create_policies_file.write('./create_agent_dirs.sh $AGENT_NAME\n')
        create_policies_file.write('cd ../src\n')
        create_policies_file.write('python ActorCriticRLPolicy.py \\\n')
        create_policies_file.write('    --model-type=' + model_type + ' \\\n')
        create_policies_file.write('    --gamma=' + str(gamma) + ' \\\n')
        create_policies_file.write('    --alpha=' + str(alpha) + ' \\\n')
        if beam_size is not None:
            create_policies_file.write('    --candidate-questions-beam-size=' + str(beam_size) + ' \\\n')
        if guess_predictor:
            create_policies_file.write('    --separate-guess-predictor \\\n')
        if on_topic:
            create_policies_file.write('    --on-topic \\\n')
        create_policies_file.write('    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl\n\n')

        # Condor script to init
        create_condor_script(agent_name + '_init', 'condorized_init_policy_300.sh', agent_name + ' static2')
        condor_submit_init_file.write('condor_submit ' + condor_scripts_dir + agent_name + '_init.sh\n')

        # Condor script to train
        create_condor_script(agent_name + '_train', 'condorized_train_policy_300.sh', agent_name)
        condor_submit_train_file.write('condor_submit ' + condor_scripts_dir + agent_name + '_train.sh\n')

        # Condor script to test
        create_condor_script(agent_name + '_test', 'condorized_test_policy.sh', agent_name)
        condor_submit_test_file.write('condor_submit ' + condor_scripts_dir + agent_name + '_test.sh\n')

    condor_submit_init_file.close()
    condor_submit_train_file.close()
    condor_submit_test_file.close()


if __name__ == '__main__':
    main()
