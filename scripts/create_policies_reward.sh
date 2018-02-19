cd ../src

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_reward300_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_reward500_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_reward1000_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_reward300_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_reward500_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_reward1000_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_reward300_beam10_sepguess
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
AGENT_NAME=linear_gamma0_9_reward500_beam10_sepguess
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
AGENT_NAME=linear_gamma0_9_reward1000_beam10_sepguess
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
AGENT_NAME=linear_gamma0_9_reward300_beam10
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
AGENT_NAME=linear_gamma0_9_reward500_beam10
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
AGENT_NAME=linear_gamma0_9_reward1000_beam10
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
AGENT_NAME=linear_gamma0_9_reward300_beamfull_sepguess
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
AGENT_NAME=linear_gamma0_9_reward500_beamfull_sepguess
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
AGENT_NAME=linear_gamma0_9_reward1000_beamfull_sepguess
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
AGENT_NAME=linear_gamma0_9_reward300_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_reward500_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_reward1000_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_reward300_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_reward500_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_reward1000_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_reward300_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_reward500_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_reward1000_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_reward300_beam10_sepguess
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
AGENT_NAME=linear_gamma1_0_reward500_beam10_sepguess
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
AGENT_NAME=linear_gamma1_0_reward1000_beam10_sepguess
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
AGENT_NAME=linear_gamma1_0_reward300_beam10
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
AGENT_NAME=linear_gamma1_0_reward500_beam10
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
AGENT_NAME=linear_gamma1_0_reward1000_beam10
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
AGENT_NAME=linear_gamma1_0_reward300_beamfull_sepguess
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
AGENT_NAME=linear_gamma1_0_reward500_beamfull_sepguess
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
AGENT_NAME=linear_gamma1_0_reward1000_beamfull_sepguess
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
AGENT_NAME=linear_gamma1_0_reward300_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_reward500_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_reward1000_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_reward300_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_reward500_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_reward1000_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_reward300_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_reward500_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_reward1000_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_reward300_beam10_sepguess
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
AGENT_NAME=mlp_gamma0_9_reward500_beam10_sepguess
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
AGENT_NAME=mlp_gamma0_9_reward1000_beam10_sepguess
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
AGENT_NAME=mlp_gamma0_9_reward300_beam10
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
AGENT_NAME=mlp_gamma0_9_reward500_beam10
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
AGENT_NAME=mlp_gamma0_9_reward1000_beam10
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
AGENT_NAME=mlp_gamma0_9_reward300_beamfull_sepguess
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
AGENT_NAME=mlp_gamma0_9_reward500_beamfull_sepguess
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
AGENT_NAME=mlp_gamma0_9_reward1000_beamfull_sepguess
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
AGENT_NAME=mlp_gamma0_9_reward300_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_reward500_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_reward1000_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_reward300_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_reward500_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_reward1000_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_reward300_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_reward500_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_reward1000_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_reward300_beam10_sepguess
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
AGENT_NAME=mlp_gamma1_0_reward500_beam10_sepguess
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
AGENT_NAME=mlp_gamma1_0_reward1000_beam10_sepguess
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
AGENT_NAME=mlp_gamma1_0_reward300_beam10
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
AGENT_NAME=mlp_gamma1_0_reward500_beam10
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
AGENT_NAME=mlp_gamma1_0_reward1000_beam10
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
AGENT_NAME=mlp_gamma1_0_reward300_beamfull_sepguess
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
AGENT_NAME=mlp_gamma1_0_reward500_beamfull_sepguess
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
AGENT_NAME=mlp_gamma1_0_reward1000_beamfull_sepguess
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
AGENT_NAME=mlp_gamma1_0_reward300_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_reward500_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_reward1000_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

