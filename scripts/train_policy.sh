AGENT_NAME=$1

mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/
mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers
mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels
mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train
mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val

cd ../src

python ExperimentRunner.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/ \
    --dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt \
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers \
    --kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv \
    --train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train \
    --val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val \
    --agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl \
    --num-dialogs=1000 \
    --batch-num=0

