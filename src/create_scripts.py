
c = 'python ExperimentRunner.py \\\n\t--dataset-dir=/scratch/cluster/aish/VisualGenome/ ' + \
    '\\\n\t--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt' + \
    '\\\n\t--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers' + \
    '\\\n\t--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv' + \
    '\\\n\t--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train' + \
    '\\\n\t--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val' + \
    '\\\n\t--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl' + \
    '\\\n\t--num-dialogs=10000' + \
    '\\\n\t--batch-num='

