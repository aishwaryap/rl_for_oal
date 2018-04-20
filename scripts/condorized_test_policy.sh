AGENT_NAME=$1
TEST_DIR=$AGENT_NAME"_test"

./remove_agent_dirs.sh $TEST_DIR
./create_agent_dirs.sh $TEST_DIR

# ./initialize_classifiers.sh $AGENT_NAME

cd ../src

python CondorizedParallelExperimentRunner.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/ \
    --dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/test_stats.txt \
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/classifiers \
    --kappas-file=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/kappas.csv \
    --train-labels-dir=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/labels/train \
    --val-labels-dir=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/labels/val \
    --agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl \
    --test-seen-predicates-file=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/seen_predicates.txt \
    --test-predicates-with-classifiers-file=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/predicates_with_classifiers.txt \
    --num-threads=10 \
    --num-batches=10 \
    --num-dialogs-per-batch-per-thread=10 \
    --active-train-batch-num=0 \
    --active-test-batch-num=1 \
    --testing

