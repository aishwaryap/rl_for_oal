#!/usr/bin/python
# A special dialog agent that runs dialogs using one policy and trains another

from DialogAgent import DialogAgent
from datetime import datetime
from argparse import ArgumentParser
import pickle

# Imports for unpickling
from StaticPolicy import StaticPolicy
from RLPolicy import RLPolicy

class PolicyInitDialogAgent(DialogAgent):
    def __init__(self, agent_name, classifier_manager, source_policy, target_policy, seen_predicates_file,
                 predicates_with_classifiers_file, per_turn_reward, success_reward, failure_reward, max_turns,
                 log_filename=None):
        super(PolicyInitDialogAgent, self).__init__(agent_name, classifier_manager, source_policy, seen_predicates_file,
                                                    predicates_with_classifiers_file, per_turn_reward, success_reward,
                                                    failure_reward, max_turns, log_filename)

        self.source_policy = source_policy
        self.target_policy = target_policy

    def run_dialog(self, candidate_regions, target_region, description, region_contents, testing=False):
        start_time = datetime.now()

        self.log('candidate_regions = ' + str(candidate_regions))
        self.log('target_region = ' + str(target_region))
        self.log('description = ' + str(description))
        self.log('region_contents = ' + str(region_contents))

        time_before_setup = datetime.now()
        self.setup_task(candidate_regions, description, region_contents, target_region)
        self.log('Time for setup = ' + format(datetime.now() - time_before_setup))
        print 'Time for setup = ' + format(datetime.now() - time_before_setup)

        dialog_complete = False
        dialog_stats = dict()
        dialog_stats['agent_name'] = self.agent_name
        dialog_stats['num_regions'] = len(candidate_regions)

        while not dialog_complete:
            turn_start_time = datetime.now()

            prev_dialog_state = self.get_dialog_state()
            next_action = self.source_policy.get_next_action(prev_dialog_state)
            self.log('Turn ' + str(self.num_system_turns) + ' action: ' + next_action['action'])

            reward = self.per_turn_reward

            self.num_system_turns += 1
            if next_action['action'] == 'make_guess':
                guess = next_action['guess']
                if guess == target_region:
                    dialog_stats['success'] = 1
                    reward = self.success_reward
                else:
                    dialog_stats['success'] = 0
                    reward = self.failure_reward
                self.log('\tGuess = ' + str(guess))
                self.log('\tSuccess = ' + str(dialog_stats['success'] == 1))
                dialog_complete = True
                dialog_stats['num_system_turns'] = self.num_system_turns

            elif next_action['action'] == 'ask_positive_example':
                self.ask_positive_example(next_action['predicate'])

            elif next_action['action'] == 'ask_label':
                self.ask_label(next_action['predicate'], next_action['region'])

            else:
                raise RuntimeError('Invalid action :' + str(next_action['action']))

            if self.num_system_turns >= self.max_turns:
                dialog_complete = True
                dialog_stats['success'] = 0
                dialog_stats['num_system_turns'] = self.num_system_turns
                reward = self.failure_reward

            if dialog_complete:
                next_dialog_state = None
            else:
                next_dialog_state = self.get_dialog_state()

            self.target_policy.update(prev_dialog_state, next_action, next_dialog_state, reward)

            self.log('Turn ' + str(self.num_system_turns - 1)
                     + ' time = ' + format(datetime.now() - turn_start_time))
            print 'Turn ' + str(self.num_system_turns - 1) \
                  + ' time = ' + format(datetime.now() - turn_start_time)

        self.perform_dialog_classifier_updates()
        self.update_cross_dialog_stats(dialog_stats)
        self.finish_task()

        self.log('Dialog time = ' + format(datetime.now() - start_time))
        self.log('--------------------------------------------------------------\n')

        return dialog_stats

    def save(self, save_filename):
        with open(self.seen_predicates_file, 'w') as handle:
            handle.write('\n'.join(self.seen_predicates))

        with open(self.predicates_with_classifiers_file, 'w') as handle:
            handle.write('\n'.join(self.predicates_with_classifiers))

        if self.classifier_manager is not None:
            self.classifier_manager.save()
        self.classifier_manager = None
        self.target_policy.save()
        self.policy.classifier_manager = None
        self.source_policy.classifier_manager = None
        self.target_policy.classifier_manager = None
        with open(save_filename, 'wb') as save_file:
            pickle.dump(self, save_file)


if __name__ == '__main__':
    # Instantiates a dialog agent ans saves it as a pickle
    arg_parser = ArgumentParser()

    arg_parser.add_argument('--agent-name', type=str, required=True,
                            help='Agent name')
    arg_parser.add_argument('--source-policy-file', type=str, required=True,
                            help='Pickled policy to train from')
    arg_parser.add_argument('--target-policy-file', type=str, required=True,
                            help='Pickled policy to initialize')
    arg_parser.add_argument('--seen-predicates-file', type=str, required=True,
                            help='Text file to track seen predicates')
    arg_parser.add_argument('--predicates-with-classifiers-file', type=str, required=True,
                            help='Text file to track predicates with classifiers')
    arg_parser.add_argument('--log-filename', type=str, required=True,
                            help='Log file')
    arg_parser.add_argument('--save-file', type=str, required=True,
                            help='File to save pickled agent')

    arg_parser.add_argument('--per-turn-reward', type=float, default=-1,
                            help='Reward for non-terminating turns')
    arg_parser.add_argument('--success-reward', type=float, default=100,
                            help='Reward for successful dialog')
    arg_parser.add_argument('--failure-reward', type=float, default=-100,
                            help='Reward for failed dialog')
    arg_parser.add_argument('--max-turns', type=int, default=100,
                            help='Terminate the dialog after this many turns')

    args = arg_parser.parse_args()

    with open(args.source_policy_file, 'rb') as policy_file:
        source_policy = pickle.load(policy_file)

    with open(args.target_policy_file, 'rb') as policy_file:
        target_policy = pickle.load(policy_file)

    # Needs to be instantiated without a classifier manager to be pickled
    dialog_agent = PolicyInitDialogAgent(args.agent_name, None, source_policy, target_policy, args.seen_predicates_file,
                                         args.predicates_with_classifiers_file, args.per_turn_reward,
                                         args.success_reward, args.failure_reward, args.max_turns,
                                         args.log_filename)
    dialog_agent.save(args.save_file)
