cd ../src
python FileManager.py \
    --dataset-dir=/scratch/cluster/aish/VisualGenome/
    --save-file=/scratch/cluster/aish/rl_for_oal/file_manager.pkl

python ClassifiersManager.py
    --classifiers-dir=/scratch/cluster/aish/rl_for_oal/classifiers
    --save-file=/scratch/cluster/aish/rl_for_oal/classifiers_manager.pkl