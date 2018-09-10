AGENT_NAME=$1
BASE_DIR=$2

mkdir -p $BASE_DIR/$AGENT_NAME/
mkdir -p $BASE_DIR/$AGENT_NAME/classifiers
mkdir -p $BASE_DIR/$AGENT_NAME/labels
mkdir -p $BASE_DIR/$AGENT_NAME/labels/train
mkdir -p $BASE_DIR/$AGENT_NAME/labels/val