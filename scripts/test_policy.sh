AGENT_NAME=$1
TEST_DIR=$AGENT_NAME"_test"

mkdir -p /scratch/cluster/aish/rl_for_oal/$TEST_DIR/
mkdir -p /scratch/cluster/aish/rl_for_oal/$TEST_DIR/classifiers
mkdir -p /scratch/cluster/aish/rl_for_oal/$TEST_DIR/labels
mkdir -p /scratch/cluster/aish/rl_for_oal/$TEST_DIR/labels/train
mkdir -p /scratch/cluster/aish/rl_for_oal/$TEST_DIR/labels/val

cd ../src

python ExperimentRunner.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/ \
    --dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/stats.txt \
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/classifiers \
    --kappas-file=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/kappas.csv \
    --train-labels-dir=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/labels/train \
    --val-labels-dir=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/labels/val \
    --agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl \
    --test-seen-predicates-file=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/seen_predicates.txt \
    --test-log-file=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/log.txt \
    --test-predicates-with-classifiers-file=/scratch/cluster/aish/rl_for_oal/$TEST_DIR/predicates_with_classifiers.txt \
    --num-dialogs=1000 \
    --batch-num=0 \
    --testing

