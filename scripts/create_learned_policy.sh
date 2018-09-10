AGENT_NAME=$1
BASE_DIR=$2

cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME $BASE_DIR
./create_agent_dirs.sh $AGENT_NAME $BASE_DIR
cd ../src
python ReinforceRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --alpha=0.01 \
    --save-file=$BASE_DIR/$AGENT_NAME/policy.pkl