#!/usr/bin/python

import csv
import re


def consolidate_batches_and_p_values():
    num_batches_train_filename = '../logs/num_batches_train.csv'
    num_batches_test_filename = '../logs/num_batches_test.csv'
    p_values_train_filename = '../logs/p_values_baseline_file_train.csv'
    p_values_test_filename = '../logs/p_values_baseline_file_test.csv'

    num_batches_train = dict()
    with open(num_batches_train_filename) as handle:
        reader = csv.reader(handle, delimiter=',')
        for row in reader:
            num_batches_train[row[0]] = int(row[1])

    num_batches_test = dict()
    with open(num_batches_test_filename) as handle:
        reader = csv.reader(handle, delimiter=',')
        for row in reader:
            num_batches_test[re.sub('_test', '', row[0])] = int(row[1])

    p_values_train = dict()
    with open(p_values_train_filename) as handle:
        reader = csv.reader(handle, delimiter=',')
        for row in reader:
            p_values_train[row[0]] = row[1:]

    p_values_test = dict()
    with open(p_values_test_filename) as handle:
        reader = csv.reader(handle, delimiter=',')
        for row in reader:
            p_values_test[re.sub('_test', '', row[0])] = row[1:]

    agent_names = set(num_batches_train.keys()).intersection(num_batches_test.keys()).intersection(
        p_values_train.keys()).intersection(p_values_test.keys())

    consolidated_filename = '../logs/consolidated.csv'
    with open(consolidated_filename, 'w') as handle:
        writer = csv.writer(handle, delimiter=',')
        for agent_name in agent_names:
            row = [agent_name, num_batches_train[agent_name], num_batches_test[agent_name]] \
                  + p_values_train[agent_name] + p_values_test[agent_name]
            writer.writerow(row)


def find_worst_and_best():
    complete_bad = list()
    trending_bad = list()
    complete_good = list()
    trending_good = list()
    trending_okay = list()

    consolidated_filename = '../logs/consolidated.csv'
    with open(consolidated_filename) as handle:
        reader = csv.reader(handle, delimiter=',')
        for row in reader:
            if int(row[1]) >= 100 and int(row[2]) >= 8:
                complete = True
                mostly = False
            elif int(row[1]) >= 50 and int(row[2]) >= 5:
                complete = False
                mostly = True
            else:
                complete = False
                mostly = False
            good = (row[5] == 'True')
            bad = (not good) and (float(row[6]) < 0.5)
            okay = (not good) and (float(row[6]) > 0.8)

            if complete and bad:
                complete_bad.append(row[0])
            elif mostly and bad:
                trending_bad.append(row[0])
            elif complete and good:
                complete_good.append(row[0])
            elif good:
                trending_good.append(row[0])
            elif okay:
                trending_okay.append(row[0])

    with open('../logs/selection/complete_bad.txt', 'w') as handle:
        handle.write('\n'.join(complete_bad))

    with open('../logs/selection/trending_bad.txt', 'w') as handle:
        handle.write('\n'.join(trending_bad))

    with open('../logs/selection/complete_good.txt', 'w') as handle:
        handle.write('\n'.join(complete_good))

    with open('../logs/selection/trending_good.txt', 'w') as handle:
        handle.write('\n'.join(trending_good))

    with open('../logs/selection/trending_okay.txt', 'w') as handle:
        handle.write('\n'.join(trending_okay))


def create_submit_files():
    with open('../logs/selection/trending_good.txt') as handle:
        agent_names = [line.strip() for line in handle.read().split()]

    submit_machines = ['uvanimor-' + str(i) for i in range(1, 11)] + ['narsil-' + str(i) for i in range(1, 14)] + \
                      ['roadkill', 'streetpizza']

    condor_scripts_dir = '/scratch/cluster/aish/rl_for_oal/condor/scripts/'
    condor_submit_train_file =  open('../scripts/condor_submit_train_selected.sh', 'w')
    condor_submit_test_file = open('../scripts/condor_submit_test_selected.sh', 'w')

    script_num = 0
    for agent_name in agent_names:
        submit_machine_num = script_num % len(submit_machines)
        condor_submit_train_file.write('ssh aish@' + submit_machines[submit_machine_num] + ' \'condor_submit ' +
                                       condor_scripts_dir + agent_name + '_train.sh\'\n')
        condor_submit_test_file.write('ssh aish@' + submit_machines[submit_machine_num] + ' \'condor_submit ' +
                                      condor_scripts_dir + agent_name + '_test.sh\'\n')
        script_num += 1

    condor_submit_train_file.close()
    condor_submit_test_file.close()


if __name__ == '__main__':
    consolidate_batches_and_p_values()
    # find_worst_and_best()
    # create_submit_files()
