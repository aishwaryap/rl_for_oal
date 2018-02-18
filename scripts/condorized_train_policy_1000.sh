AGENT_NAME=$1

./create_agent_dirs.sh $AGENT_NAME

cd ../src

python ParallelDialogAgent.py \
    --agent-name=$AGENT_NAME \
    --success-reward=1000 \
    --policy-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl \
    --seen-predicates-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/seen_predicates.txt \
    --predicates-with-classifiers-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/predicates_with_classifiers.txt \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl

python CondorizedParallelExperimentRunner.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/ \
    --dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/train_stats.txt \
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers \
    --kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv \
    --train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train \
    --val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val \
    --agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl \
    --num-threads=10 \
    --num-batches=10 \
    --num-dialogs-per-batch-per-thread=10 \
    --batch-num=0

