AGENT_NAME=$1

./create_agent_dirs.sh $AGENT_NAME

cd ../src

python StaticPolicy.py \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl