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
#$ -t 1-2

#$ -o output

#$ -e errors

# Set working dir
#$ -wd /home/ucanede/Scratch/dissipative_model_2

# Job name 
#$ -N XYZ_take1

# Parse parameter file to get variables.
number=$SGE_TASK_ID

BASE=$PWD
paramfile=$BASE/input/params_5.txt
SAVE=$Base/results

module load julia/1.9.1
filename="`sed -n ${number}p $paramfile | awk '{print $1}'`"
v1="`sed -n ${number}p $paramfile | awk '{print $2}'`" #dim
v2="`sed -n ${number}p $paramfile | awk '{print $3}'`" #dim
v3="`sed -n ${number}p $paramfile | awk '{print $4}'`" #dim

v4="`sed -n ${number}p $paramfile | awk '{print $5}'`" #N
v5="`sed -n ${number}p $paramfile | awk '{print $6}'`" #number_repeats
v6="`sed -n ${number}p $paramfile | awk '{print $7}'`" #Γ_deph 
v8="`sed -n ${number}p $paramfile | awk '{print $9}'`" #Ω
v7="`sed -n ${number}p $paramfile | awk '{print $8}'`" #Γ_decay

v9="`sed -n ${number}p $paramfile | awk '{print $10}'`" #α
v10="`sed -n ${number}p $paramfile | awk '{print $11}'`" #α 
v11="`sed -n ${number}p $paramfile | awk '{print $12}'`" #α

v12="`sed -n ${number}p $paramfile | awk '{print $13}'`" #method
v13="`sed -n ${number}p $paramfile | awk '{print $14}'`" #axis 
v14="`sed -n ${number}p $paramfile | awk '{print $15}'`" #dir

cd $TMPDIR
cp $BASE/main.jl $TMPDIR/
julia --project=$BASE main.jl $v1 $v2 $v3 $v4 $v5 $v6 $v7 $v8 $v9 $v10 $v11 $v12 $v13 $v14

mv results.jld2 /home/ucanede/Scratch/dissipative_model_2/results/results_XYZ_practice/$filename
