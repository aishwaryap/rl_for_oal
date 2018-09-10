AGENT_NAME=$1
BASE_DIR=$2

./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME

cd ../src

python StaticPolicy.py \
    --save-file=$BASE_DIR/$AGENT_NAME/policy.pkl
