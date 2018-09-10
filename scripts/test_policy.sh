AGENT_NAME=$1
BASE_DIR=$2
DATA_DIR=$3
TEST_DIR=$AGENT_NAME"_test"

./remove_agent_dirs.sh $TEST_DIR $BASE_DIR
./create_agent_dirs.sh $TEST_DIR $BASE_DIR

cd ../src

python CondorizedParallelExperimentRunner.py \
    --dataset-dir=$DATA_DIR \
    --dialog-stats-filename=$BASE_DIR/$TEST_DIR/test_stats.txt \
    --classifiers-dir=$BASE_DIR/$TEST_DIR/classifiers \
    --kappas-file=$BASE_DIR/$TEST_DIR/kappas.csv \
    --train-labels-dir=$BASE_DIR/$TEST_DIR/labels/train \
    --val-labels-dir=$BASE_DIR/$TEST_DIR/labels/val \
    --agent-file=$BASE_DIR/$AGENT_NAME/dialog_agent.pkl \
    --test-seen-predicates-file=$BASE_DIR/$TEST_DIR/seen_predicates.txt \
    --test-predicates-with-classifiers-file=$BASE_DIR/$TEST_DIR/predicates_with_classifiers.txt \
    --num-threads=10 \
    --num-batches=10 \
    --num-dialogs-per-batch-per-thread=10 \
    --active-train-batch-num=2 \
    --active-test-batch-num=3 \
    --testing

