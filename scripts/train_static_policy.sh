AGENT_NAME=$1

mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/
mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers
mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels

cd ../src

python StaticPolicy.py \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

python DialogAgent.py \
    --agent-name=$AGENT_NAME \
    --policy-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl \
    --seen-predicates-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/seen_predicates.txt \
    --predicates-with-classifiers-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/predicates_with_classifiers.txt \
    --log-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/log.txt \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl

python ExperimentRunner.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/ \
    --dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt \
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers \
    --kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv \
    --labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels \
    --agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl \
    --num-dialogs=10

