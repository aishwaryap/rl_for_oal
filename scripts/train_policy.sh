AGENT_NAME=$1
BASE_DIR=$2
DATA_DIR=$3
REWARD=200

./create_agent_dirs.sh $AGENT_NAME

cd ../src

python ParallelDialogAgent.py \
    --agent-name=$AGENT_NAME \
    --success-reward=$REWARD \
    --policy-file=$BASE_DIR/$AGENT_NAME/policy.pkl \
    --seen-predicates-file=$BASE_DIR/$AGENT_NAME/seen_predicates.txt \
    --predicates-with-classifiers-file=$BASE_DIR/$AGENT_NAME/predicates_with_classifiers.txt \
    --save-file=$BASE_DIR/$AGENT_NAME/dialog_agent.pkl

python CondorizedParallelExperimentRunner.py \
    --dataset-dir=$DATA_DIR \
    --dialog-stats-filename=$BASE_DIR/$AGENT_NAME/train_stats.txt \
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

