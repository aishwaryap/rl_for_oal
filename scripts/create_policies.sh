cd ../src

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam1_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam1_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=1 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam3_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam3_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=3 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam10_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam10_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=10 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beamfull_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beamfull_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam1_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam1_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=1 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam3_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam3_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=3 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam10_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam10_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=10 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beamfull_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beamfull_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_1_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam1_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam1_sepguess
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
AGENT_NAME=linear_gamma0_9_beam1_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam1
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
AGENT_NAME=linear_gamma0_9_beam3_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam3_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma0_9_beam10_sepguess_ontopic
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
AGENT_NAME=linear_gamma0_9_beam10_sepguess
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
AGENT_NAME=linear_gamma0_9_beam10_ontopic
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
AGENT_NAME=linear_gamma0_9_beam10
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
AGENT_NAME=linear_gamma0_9_beamfull_sepguess_ontopic
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
AGENT_NAME=linear_gamma0_9_beamfull_sepguess
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
AGENT_NAME=linear_gamma0_9_beamfull_ontopic
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
AGENT_NAME=linear_gamma0_9_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam1_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam1_sepguess
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
AGENT_NAME=linear_gamma1_0_beam1_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam1
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
AGENT_NAME=linear_gamma1_0_beam3_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam3_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=linear_gamma1_0_beam10_sepguess_ontopic
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
AGENT_NAME=linear_gamma1_0_beam10_sepguess
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
AGENT_NAME=linear_gamma1_0_beam10_ontopic
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
AGENT_NAME=linear_gamma1_0_beam10
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
AGENT_NAME=linear_gamma1_0_beamfull_sepguess_ontopic
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
AGENT_NAME=linear_gamma1_0_beamfull_sepguess
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
AGENT_NAME=linear_gamma1_0_beamfull_ontopic
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
AGENT_NAME=linear_gamma1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam1_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam1_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=1 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam3_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam3_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=3 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam10_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam10_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=10 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beamfull_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beamfull_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam1_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam1_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=1 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam3_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam3_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=3 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam10_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam10_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=10 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beamfull_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beamfull_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_1_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam1_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam1_sepguess
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
AGENT_NAME=mlp_gamma0_9_beam1_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam1
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
AGENT_NAME=mlp_gamma0_9_beam3_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam3_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma0_9_beam10_sepguess_ontopic
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
AGENT_NAME=mlp_gamma0_9_beam10_sepguess
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
AGENT_NAME=mlp_gamma0_9_beam10_ontopic
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
AGENT_NAME=mlp_gamma0_9_beam10
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
AGENT_NAME=mlp_gamma0_9_beamfull_sepguess_ontopic
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
AGENT_NAME=mlp_gamma0_9_beamfull_sepguess
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
AGENT_NAME=mlp_gamma0_9_beamfull_ontopic
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
AGENT_NAME=mlp_gamma0_9_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam1_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam1_sepguess
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
AGENT_NAME=mlp_gamma1_0_beam1_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam1
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
AGENT_NAME=mlp_gamma1_0_beam3_sepguess_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam3_ontopic
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --on-topic \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

# -----------------------------------------------------------------------------
AGENT_NAME=mlp_gamma1_0_beam10_sepguess_ontopic
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
AGENT_NAME=mlp_gamma1_0_beam10_sepguess
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
AGENT_NAME=mlp_gamma1_0_beam10_ontopic
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
AGENT_NAME=mlp_gamma1_0_beam10
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
AGENT_NAME=mlp_gamma1_0_beamfull_sepguess_ontopic
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
AGENT_NAME=mlp_gamma1_0_beamfull_sepguess
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
AGENT_NAME=mlp_gamma1_0_beamfull_ontopic
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
AGENT_NAME=mlp_gamma1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl

