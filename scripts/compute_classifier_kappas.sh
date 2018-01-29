AGENT_NAME=$1

cd ../src
python compute_classifier_kappas.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/ \
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers \
    --kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv \
    --train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train \
    --val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val