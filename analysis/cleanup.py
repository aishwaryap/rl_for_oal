#!/usr/bin/python

import os
import shutil


# Delete the copy of static present inside every agent's folder
def remove_static_copies():
    base_dir = '/scratch/cluster/aish/rl_for_oal'
    agent_dirs = [os.path.join(base_dir, folder) for folder in os.listdir(base_dir)
                  if os.path.isdir(os.path.join(base_dir, folder))]
    for agent_dir in agent_dirs:
        static_copy = os.path.join(agent_dir, 'static')
        if os.path.isdir(static_copy):
            print 'Deleting', static_copy
            shutil.rmtree(static_copy)


if __name__ == '__main__':
    remove_static_copies()