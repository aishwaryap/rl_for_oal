AGENT_NAME=$1
TRAINING_POLICY_AGENT=$2

./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $TRAINING_POLICY_AGENT

cd ../src

python PolicyInitDialogAgent.py \
    --agent-name=$AGENT_NAME \
    --source-policy-file=/scratch/cluster/aish/rl_for_oal/$TRAINING_POLICY_AGENT/policy.pkl \
    --target-policy-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl \
    --seen-predicates-file=/scratch/cluster/aish/rl_for_oal/$TRAINING_POLICY_AGENT/seen_predicates.txt \
    --predicates-with-classifiers-file=/scratch/cluster/aish/rl_for_oal/$TRAINING_POLICY_AGENT/predicates_with_classifiers.txt \
    --log-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/log.txt \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl

python ExperimentRunner.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/ \
    --dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt \
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/$TRAINING_POLICY_AGENT/classifiers \
    --kappas-file=/scratch/cluster/aish/rl_for_oal/$TRAINING_POLICY_AGENT/kappas.csv \
    --train-labels-dir=/scratch/cluster/aish/rl_for_oal/$TRAINING_POLICY_AGENT/labels/train \
    --val-labels-dir=/scratch/cluster/aish/rl_for_oal/$TRAINING_POLICY_AGENT/labels/val \
    --agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl \
    --num-dialogs=1000 \
    --batch-num=0

