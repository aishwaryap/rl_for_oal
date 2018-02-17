AGENT_NAME=$1
TRAINING_POLICY_AGENT=$2

./create_agent_dirs.sh $AGENT_NAME

cp -r /scratch/cluster/aish/rl_for_oal/$TRAINING_POLICY_AGENT /scratch/cluster/aish/rl_for_oal/$AGENT_NAME

cd ../src

python ParallelPolicyInitDialogAgent.py \
    --agent-name=$AGENT_NAME \
    --source-policy-file=/scratch/cluster/aish/rl_for_oal//$AGENT_NAME/$TRAINING_POLICY_AGENT/policy.pkl \
    --target-policy-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl \
    --seen-predicates-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/$TRAINING_POLICY_AGENT/seen_predicates.txt \
    --predicates-with-classifiers-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/$TRAINING_POLICY_AGENT/predicates_with_classifiers.txt \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl

python CondorizedParallelExperimentRunner.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/ \
    --dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/init_stats.txt \
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/$TRAINING_POLICY_AGENT/classifiers \
    --kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/$TRAINING_POLICY_AGENT/kappas.csv \
    --train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/$TRAINING_POLICY_AGENT/labels/train \
    --val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/$TRAINING_POLICY_AGENT/labels/val \
    --agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl \
    --updates-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/updates.txt \
    --num-threads=10 \
    --num-batches=10 \
    --num-dialogs-per-batch-per-thread=10 \
    --batch-num=0

