# -------------------------------------------------------------------------
# Linear, Gamma = 1, Beam size = 10, Initialized

AGENT_NAME=l_gamma_1_beam_10_init

./create_agent_dirs.sh $AGENT_NAME

python RLPolicy.py \
    --model-type=linear \
    --candidate-questions-beam-size=10 \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -------------------------------------------------------------------------
# MLP, Gamma = 1, Beam size = 10, Initialized

AGENT_NAME=m_gamma_1_beam_10_init

./create_agent_dirs.sh $AGENT_NAME

python RLPolicy.py \
    --model-type=mlp \
    --candidate-questions-beam-size=10 \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -------------------------------------------------------------------------
