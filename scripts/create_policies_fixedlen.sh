cd ../src

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam10_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam10_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam10_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam10_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam100_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=100 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam100_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=100 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam100_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=100 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam100_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=100 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beamfull_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beamfull_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beamfull_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beamfull_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam10_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam10_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam10_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam10_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam100_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=100 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam100_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=100 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam100_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=100 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam100_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=100 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beamfull_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beamfull_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beamfull_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beamfull_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam10_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam10_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam10_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam10_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam100_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=100 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam100_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=100 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam100_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=100 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam100_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=100 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beamfull_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beamfull_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beamfull_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beamfull_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam10_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam10_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam10_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam10_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam100_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=100 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam100_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=100 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam100_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=100 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam100_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=100 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beamfull_sepguess_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beamfull_sepguess_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beamfull_ontopic_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beamfull_fixedlen
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

