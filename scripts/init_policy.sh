AGENT_NAME=$1
TRAINING_POLICY_AGENT=$2
BASE_DIR=$3
DATA_DIR=$4
REWARD=200

./create_agent_dirs.sh $AGENT_NAME $BASE_DIR

# ./initialize_classifiers.sh $AGENT_NAME

cp -r $BASE_DIR/$TRAINING_POLICY_AGENT $BASE_DIR/$AGENT_NAME

cd ../src

python ParallelPolicyInitDialogAgent.py \
    --agent-name=$AGENT_NAME \
    --success-reward=$REWARD \
    --source-policy-file=$BASE_DIR/$AGENT_NAME/$TRAINING_POLICY_AGENT/policy.pkl \
    --target-policy-file=$BASE_DIR/$AGENT_NAME/policy.pkl \
    --seen-predicates-file=$BASE_DIR/$AGENT_NAME/$TRAINING_POLICY_AGENT/seen_predicates.txt \
    --predicates-with-classifiers-file=$BASE_DIR/$AGENT_NAME/$TRAINING_POLICY_AGENT/predicates_with_classifiers.txt \
    --save-file=$BASE_DIR/$AGENT_NAME/dialog_agent.pkl

python CondorizedParallelExperimentRunner.py \
    --dataset-dir=$DATA_DIR \
    --dialog-stats-filename=$BASE_DIR/$AGENT_NAME/init_stats.txt \
    --classifiers-dir=$BASE_DIR/$AGENT_NAME/classifiers \
    --kappas-file=$BASE_DIR/$AGENT_NAME/kappas.csv \
    --train-labels-dir=$BASE_DIR/$AGENT_NAME/labels/train \
    --val-labels-dir=$BASE_DIR/$AGENT_NAME/labels/val \
    --agent-file=$BASE_DIR/$AGENT_NAME/dialog_agent.pkl \
    --num-threads=10 \
    --num-batches=10 \
    --num-dialogs-per-batch-per-thread=10 \
    --active-train-batch-num=0 \
    --active-test-batch-num=1
