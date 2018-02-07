AGENT_NAME=$1

./create_agent_dirs.sh $AGENT_NAME

cd ../src

python ParallelRLPolicy.py \
    --model-type=linear \
    --candidate-questions-beam-size=10 \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl