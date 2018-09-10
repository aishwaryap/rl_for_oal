# rl_for_oal - Reinforcement Learning for Opportunistic Active Learning

Project Goals -
- Can we learn a policy for opportunistic active learning - that is trading off queries that would help in future interactions, with finishing the current interaction quickly
- Can we learn how to choose between predicates in a multilabel setting?

# Dependencies

Download and preprocess the Visual Genome dataset using [this commit](https://github.com/aishwaryap/dataset_preprocessing/commit/d51cb6b2c6c61ddc473cca7c89ff44b8b75ea901) of [my preprocessing repository](https://github.com/aishwaryap/dataset_preprocessing)
Instructions are present at [dataset_preprocessing/VisualGenome/README.md](https://github.com/aishwaryap/dataset_preprocessing/blob/master/VisualGenome/README.md)

# Instructions

Set up some environment variables for convenience
```bash
export DATA_DIR=<path to Visual Genome dataset>
export AGENTS_DIR=<path to store trained agents>
```

All scripts are in the scripts directory.
```bash
cd scripts
```

Create a baseline static policy and test it
```bash
./create_static_policy.sh static $AGENTS_DIR
./test_static_policy.sh static $AGENTS_DIR
```

Instantiate the desired policy. The script uses the algorithm hyperparameters in the paper.
Some other policy classes can be found in ```src```.
```bash
./create_learned_policy.sh learned $AGENTS_DIR
```

Initialize the policy using episodes from the static policy
```bash
./init_policy.sh learned static $AGENTS_DIR $DATA_DIR
```

Train the policy
```bash
./train_policy.sh learned $AGENTS_DIR $DATA_DIR
```

Test the learned policy
```bash
./test_policy.sh learned $AGENTS_DIR $DATA_DIR
```

Summarize results
```bash
cd ../
mkdir logs
echo $'static\nlearned' > logs/agent_list.txt
cd analysis
python evaluate_bulk.py \
    --agents-path=$AGENTS-DIR \
    --agent-list-file=../logs/agent_list.txt
```
This summarizes some useful results into ```logs```.

