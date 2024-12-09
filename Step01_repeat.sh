#!/bin/bash

#SBATCH --time=120:00:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=48   # 48 processor core(s) per node X 2 threads per core
#SBATCH --mem=200G   # maximum memory per node
#SBATCH --partition=mem    # large-memory node(s)
#SBATCH --job-name="repeat"
#SBATCH --mail-user=sisi.chen@ufl.edu   # email address
#SBATCH --mail-type=FAIL
#SBATCH --output="repeat-%j.out" # job standard output and standard error file (%j replaced by job id)
#SBATCH -A gbru_hydrangea

date;hostname;pwd

#module load repeatmodeler

#BuildDatabase -name pame -engine ncbi /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/00.project/02.avocado/00.ref_WestIndian/pame.fa

#RepeatModeler -engine ncbi -database pame -threads 48 -LTRStruct 

module load repeatmasker
RepeatMasker -e rmblast -lib pame-families.fa -pa 48  /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/00.project/02.avocado/01.assem_V2/WestIndian_ragtag.fa

