cd ../src
python VGFeaturesDict.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/
    --save-file=/scratch/cluster/aish/rl_for_oal/features_dict.pkl

python ClassifiersManager.py
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/classifiers
    --features-dict-file=/scratch/cluster/aish/rl_for_oal/features_dict.pkl
    --save-file=/scratch/cluster/aish/rl_for_oal/classifiers_manager.pkl