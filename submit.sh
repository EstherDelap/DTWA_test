#!/bin/bash -l

# Wall clock time
#$ -l h_rt=72:00:00

# Request a single core
#$ -pe smp 1

# Request RAM
#$ -l mem=150G

# Request TMPDIR space
#$ -l tmpfs=500G


# Set up the job array.  In this instance we have requested 10000 tasks
# numbered 1 to 10000.
#$ -t 1-10

#$ -o output

#$ -e errors

# Set working dir
#$ -wd /home/ucanede/Scratch/dissipative_model_2

# Job name
#$ -N OTHER

# Parse parameter file to get variables.
paramfile=$BASE/input/params.txt
number=$SGE_TASK_ID

BASE=$PWD
#LOAD=$BASE/input
SAVE=$BASE/results

module load julia/1.9.1

filename="`sed -n ${number}p $paramfile | awk '{print $1}'`"
v1="`sed -n ${number}p $paramfile | awk '{print $2}'`" #dim
v2="`sed -n ${number}p $paramfile | awk '{print $3}'`" #N
v3="`sed -n ${number}p $paramfile | awk '{print $4}'`" #number_repeats
v4="`sed -n ${number}p $paramfile | awk '{print $5}'`" #Γ_deph 
v5="`sed -n ${number}p $paramfile | awk '{print $6}'`" #Γ_decay
v6="`sed -n ${number}p $paramfile | awk '{print $7}'`" #Ω
v7="`sed -n ${number}p $paramfile | awk '{print $8}'`" #α
v8="`sed -n ${number}p $paramfile | awk '{print $9}'`" #method 
v9="`sed -n ${number}p $paramfile | awk '{print $10}'`" #axis 
v10="`sed -n ${number}p $paramfile | awk '{print $11}'`" #dir 

cd $TMPDIR
cp $BASE/main.jl $TMPDIR/
julia --project=$BASE main.jl $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 $v9 $v10
mv results.jld2 $SAVE/$filename 
