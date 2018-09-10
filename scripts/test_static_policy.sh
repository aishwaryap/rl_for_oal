AGENT_NAME=$1
BASE_DIR=$2

if [ ! -f $BASE_DIR/$AGENT_NAME/policy.pkl ]; then
    ./create_static_policy.sh $AGENT_NAME $BASE_DIR
fi

if [ ! -f $BASE_DIR/$AGENT_NAME/dialog_agent.pkl ]; then
    cd ../src

    python ParallelDialogAgent.py \
        --agent-name=$AGENT_NAME \
        --policy-file=$BASE_DIR/$AGENT_NAME/policy.pkl \
        --seen-predicates-file=$BASE_DIR/$AGENT_NAME/seen_predicates.txt \
        --predicates-with-classifiers-file=$BASE_DIR/$AGENT_NAME/predicates_with_classifiers.txt \
        --save-file=$BASE_DIR/$AGENT_NAME/dialog_agent.pkl
fi

cd ../scripts

./test_policy.sh $AGENT_NAME