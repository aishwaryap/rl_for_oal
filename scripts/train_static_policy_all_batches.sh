AGENT_NAME=$1

mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/
mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers
mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels
mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train
mkdir -p /scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val

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
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=0

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=1

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=2

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=3

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=4

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=5

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=6

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=7

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=8

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=9

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=10

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=11

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=12

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=13

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=14

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=15

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=16

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=17

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=18

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=19

python ExperimentRunner.py \
	--dataset-dir=/scratch/cluster/aish/VisualGenome/ \
	--dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/stats.txt\
	--classifiers-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/classifiers\
	--kappas-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/kappas.csv\
	--train-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/train\
	--val-labels-dir=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/labels/val\
	--agent-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/dialog_agent.pkl\
	--num-dialogs=100000\
	--batch-num=20

