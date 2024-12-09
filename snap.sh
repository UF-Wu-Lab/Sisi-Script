#!/bin/bash

#SBATCH --time=120:00:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=48   # 48 processor core(s) per node X 2 threads per core
#SBATCH --mem=150G   # maximum memory per node
#SBATCH --partition=mem    # large-memory node(s)
#SBATCH --job-name="snap"
#SBATCH --mail-user=sisi.chen@ufl.edu   # email address
#SBATCH --mail-type=FAIL
#SBATCH --output="snap-%j.out" # job standard output and standard error file (%j replaced by job id)
#SBATCH -A gbru_hydrangea

date;hostname;pwd

module load snap_ucdavis/2024.03.14

cd SNAP

#ln -s /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/00.project/02.avocado/04.annotation_V2/01.repeat/WestIndian_ragtag.fa.masked ./

snap /software/el9/apps/snap_ucdavis/2024.03.14/HMM/A.thaliana.hmm WestIndian_ragtag.fa.masked -gff -aa snap.pep -tx snap.cds
cd..
date

