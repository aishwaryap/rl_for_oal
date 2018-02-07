AGENT_NAME=$1
TEST_DIR=$AGENT_NAME"_test"

./create_agent_dirs.sh $TEST_DIR

cd ../src

python CondorizedParallelExperimentRunner.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/ \
    --dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt \
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers \
    --kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv \
    --train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train \
    --val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val \
    --agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl \
    --num-threads=10 \
    --num-batches=100 \
    --num-dialogs-per-batch-per-thread=10 \
    --batch-num=0 \
    --testing

