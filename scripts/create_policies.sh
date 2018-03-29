cd ../src

let n=1

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward200_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward250_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward300_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward350_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward400_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward450_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward500_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward200_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward250_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward300_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward350_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward400_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward450_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward500_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward200_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward250_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward300_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward350_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward400_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward450_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward500_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward200_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward250_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward300_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward350_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward400_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward450_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward500_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward200_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward250_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward300_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward350_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward400_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward450_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward500_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma0_9_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward200_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward250_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward300_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward350_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward400_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward450_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward500_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward200_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward250_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward300_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward350_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward400_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward450_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward500_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward200_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward250_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward300_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward350_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward400_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward450_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward500_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward200_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward250_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward300_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward350_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward400_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward450_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward500_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward200_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward250_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward300_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward350_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward400_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward450_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward500_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_linear_gamma1_0_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward200_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward250_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward300_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward350_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward400_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward450_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward500_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward200_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward250_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward300_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward350_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward400_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward450_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward500_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward200_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward250_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward300_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward350_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward400_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward450_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward500_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward200_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward250_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward300_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward350_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward400_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward450_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward500_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward200_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward250_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward300_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward350_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward400_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward450_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward500_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma0_9_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward200_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward250_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward300_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward350_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward400_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward450_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward500_alpha1_0_beam1_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward200_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward250_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward300_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward350_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward400_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward450_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward500_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward200_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward250_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward300_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward350_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward400_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward450_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward500_alpha1_0_beam3_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward200_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward250_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward300_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward350_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward400_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward450_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward500_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward200_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward250_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward300_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward350_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward400_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward450_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward500_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_mlp_gamma1_0_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward200_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward250_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward300_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward350_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward400_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward450_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward500_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma0_9_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward200_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward250_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward300_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward350_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward400_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward450_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward500_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_linear_gamma1_0_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward200_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward250_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward300_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward350_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward400_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward450_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward500_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma0_9_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward200_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward250_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward300_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward350_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward400_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward450_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward500_alpha1_0_beam10_sepguess
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


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=q_fixedlen_mlp_gamma1_0_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python ParallelRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward200_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward250_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward300_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward350_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward400_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward450_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward500_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward200_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward250_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward300_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward350_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward400_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward450_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward500_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward200_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward250_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward300_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward350_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward400_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward450_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward500_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward200_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward250_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward300_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward350_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward400_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward450_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward500_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward200_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward250_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward300_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward350_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward400_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward450_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward500_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma0_9_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward200_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward250_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward300_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward350_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward400_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward450_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward500_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward200_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward250_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward300_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward350_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward400_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward450_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward500_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward200_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward250_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward300_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward350_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward400_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward450_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward500_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward200_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward250_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward300_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward350_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward400_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward450_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward500_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward200_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward250_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward300_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward350_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward400_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward450_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward500_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_linear_gamma1_0_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=linear \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward200_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward250_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward300_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward350_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward400_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward450_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward500_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward200_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward250_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward300_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward350_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward400_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward450_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward500_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward200_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward250_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward300_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward350_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward400_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward450_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward500_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward200_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward250_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward300_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward350_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward400_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward450_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward500_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward200_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward250_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward300_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward350_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward400_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward450_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward500_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma0_9_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=0.9 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward200_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward250_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward300_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward350_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward400_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward450_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward500_alpha1_0_beam1_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward200_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward250_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward300_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward350_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward400_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward450_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward500_alpha1_0_beam1
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=1 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward200_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward250_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward300_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward350_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward400_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward450_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward500_alpha1_0_beam3_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward200_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward250_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward300_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward350_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward400_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward450_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward500_alpha1_0_beam3
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=3 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward200_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward250_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward300_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward350_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward400_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward450_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward500_alpha1_0_beam10_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward200_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward250_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward300_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward350_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward400_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward450_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward500_alpha1_0_beam10
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --candidate-questions-beam-size=10 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward200_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward250_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward300_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward350_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward400_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward450_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward500_alpha1_0_beamfull_sepguess
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --separate-guess-predictor \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward200_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward250_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward300_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward350_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward400_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward450_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

# -----------------------------------------------------------------------------
AGENT_NAME=ktdq_mlp_gamma1_0_reward500_alpha1_0_beamfull
cd ../scripts
./remove_agent_dirs.sh $AGENT_NAME
./create_agent_dirs.sh $AGENT_NAME
cd ../src
python KTDQRLPolicy.py \
    --model-type=mlp \
    --gamma=1.0 \
    --save-file=/scratch/cluster/aish/rl_for_oal/$AGENT_NAME/policy.pkl


let n++

echo $n 'policies created'

