cd ../src

python ClassifiersManager.py \
--features-dict-file=/scratch/cluster/aish/rl_for_oal/features_dict.pkl \
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/classifiers \
    --kappas-dir=/scratch/cluster/aish/rl_for_oal/kappas \
    --labels-dir=/scratch/cluster/aish/rl_for_oal/labels \
    --save-file=/scratch/cluster/aish/rl_for_oal/classifiers_manager.pkl

python StaticPolicy.py \
    --save-file=/scratch/cluster/aish/rl_for_oal/policy.pkl

python DialogAgent.py \
    --agent-name=test \
    --classifier-manager-file=/scratch/cluster/aish/rl_for_oal/classifiers_manager.pkl \
    --policy-file=/scratch/cluster/aish/rl_for_oal/policy.pkl \
    --seen-predicates-file=/scratch/cluster/aish/rl_for_oal/seen_predicates.txt \
    --predicates-with-classifiers-file=/scratch/cluster/aish/rl_for_oal/predicates_with_classifiers.txt \
    --log-filename=/scratch/cluster/aish/rl_for_oal/log.txt \
    --save-file=/scratch/cluster/aish/rl_for_oal/dialog_agent.pkl

python ExperimentRunner.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/ \
    --dialog-stats-filename=/scratch/cluster/aish/rl_for_oal/dialog_stats.txt \
    --agent-file=/scratch/cluster/aish/rl_for_oal/dialog_agent.pkl
