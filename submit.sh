#!/bin/bash -l

# Wall clock time
#$ -l h_rt=24:00:00

# Request a single core
#$ -pe smp 5

# Request RAM
#$ -l mem=100G

# Request TMPDIR space
#$ -l tmpfs=20G

#$ -o output

#$ -e errors

# Set working dir
#$ -wd /home/ucanede/Scratch/dissipative_model_2

# Job name
#$ -N collective_spin


BASE=$PWD
SAVE=$BASE/results

module load julia/1.9.1

number=$SGE_TASK_ID

cd $TMPDIR
cp $BASE/main.jl $TMPDIR/
julia -p auto --project=$BASE main.jl $BASE
mv results.jld2 $SAVE/results_multi.jld2
