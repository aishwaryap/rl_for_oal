#!/usr/bin/python

import pickle
import copy
from argparse import ArgumentParser
from ParallelDialogAgent import ParallelDialogAgent

# Imports for unpickling
from StaticPolicy import StaticPolicy
from ParallelRLPolicy import ParallelRLPolicy
from ParallelRLPolicyWithLogging import ParallelRLPolicyWithLogging
from ReinforceRLPolicy import ReinforceRLPolicy
from ActorCriticRLPolicy import ActorCriticRLPolicy
from KTDQRLPolicy import KTDQRLPolicy
from AdvantageActorCriticRLPolicy import AdvantageActorCriticRLPolicy


class ParallelPolicyInitDialogAgent(ParallelDialogAgent):
    def __init__(self, agent_name, classifier_manager, source_policy, target_policy, seen_predicates_file,
                 predicates_with_classifiers_file, per_turn_reward, success_reward, failure_reward, max_turns):
        super(ParallelPolicyInitDialogAgent, self).__init__(agent_name, classifier_manager, source_policy,
                                                            seen_predicates_file, predicates_with_classifiers_file,
                                                            per_turn_reward, success_reward, failure_reward, max_turns)

        self.source_policy = source_policy
        self.target_policy = target_policy

    def set_classifier_manager(self, classifier_manager):
        self.classifier_manager = classifier_manager
        self.policy.classifier_manager = classifier_manager
        self.source_policy.classifier_manager = classifier_manager
        self.target_policy.classifier_manager = classifier_manager

    def perform_policy_updates(self, policy_updates):
        self.target_policy.perform_updates(policy_updates)

    def run_dialog(self, active_test_regions, active_train_regions, target_region, description,
                   active_test_region_contents, active_train_region_contents, testing=False):
        self.setup_task(active_test_regions, active_train_regions, description, active_test_region_contents,
                        active_train_region_contents, target_region)

        dialog_complete = False
        dialog_stats = dict()
        dialog_stats['agent_name'] = self.agent_name
        dialog_stats['num_test_regions'] = len(active_test_regions)
        dialog_stats['num_train_regions'] = len(active_train_regions)
        dialog_stats['predicates'] = copy.deepcopy(self.current_predicates)
        dialog_stats['policy_updates'] = list()

        while not dialog_complete:
            # print 'Starting turn', self.num_system_turns + 1
            prev_dialog_state = self.get_dialog_state()
            # print 'Got dialog state'
            next_action = self.source_policy.get_next_action(prev_dialog_state)
            # print 'Got next action ', next_action['action']
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
                dialog_complete = True
                dialog_stats['num_system_turns'] = self.num_system_turns

            elif next_action['action'] == 'ask_positive_example':
                self.ask_positive_example(next_action['predicate'])

            elif next_action['action'] == 'ask_label':
                self.ask_label(next_action['predicate'], next_action['region'])

            else:
                raise RuntimeError('Invalid action :' + str(next_action['action']))

            # print 'Executed action'

            if self.num_system_turns >= self.max_turns:
                dialog_complete = True
                dialog_stats['success'] = 0
                dialog_stats['num_system_turns'] = self.num_system_turns
                reward = self.failure_reward

            if dialog_complete:
                next_dialog_state = None
            else:
                next_dialog_state = self.get_dialog_state()

            if not testing:
                # print 'Computing update'
                update = self.target_policy.compute_update(prev_dialog_state, next_action, next_dialog_state, reward)
                # print 'Computed update'
                if update is not None:
                    dialog_stats['policy_updates'].append(update)

            # print 'Turn ' + str(self.num_system_turns - 1) + 'complete'
            #       + ' time = ' + format(datetime.now() - turn_start_time)
            # print 'type(dialog_agent.classifier_manager) =', type(self.classifier_manager)
            # print 'type(dialog_agent.policy.classifier_manager) =', type(self.policy.classifier_manager)
            #
            # print 'dialog_stats.keys() = ', dialog_stats.keys()

        # self.perform_dialog_classifier_updates()
        dialog_stats['classifier_updates'] = copy.deepcopy(self.labels_acquired)

        self.update_cross_dialog_stats(dialog_stats)
        self.finish_task()

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
    # Logfile is None because otherwise writing to logs becomes a bottleneck
    dialog_agent = ParallelPolicyInitDialogAgent(args.agent_name, None, source_policy, target_policy,
                                                 args.seen_predicates_file, args.predicates_with_classifiers_file,
                                                 args.per_turn_reward, args.success_reward, args.failure_reward,
                                                 args.max_turns)
    dialog_agent.save(args.save_file)
