#!/usr/bin/python
# Basic structure of a policy, and some default functionality

import numpy as np

__author__ = 'aishwarya'


class StaticPolicy:
    def __init__(self):
        pass

    def get_guess(self, dialog_state):
        scores = np.zeros(len(dialog_state['candidate_regions']))
        for predicate in dialog_state['decision_scores']:
            scores += dialog_state['decision_scores'][predicate]
        scores = scores.tolist()
        max_score = max(scores)
        max_score_idx = scores.index(max_score)
        return self.candidate_regions[max_score_idx], max_score

    def get_next_action(self, dialog_state):


    # This is a static policy. Update does nothing
    def update(self, prev_dialog_state, next_action, reward, next_dialog_state):
        pass
