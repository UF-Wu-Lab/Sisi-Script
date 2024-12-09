#!/bin/bash


#SBATCH --time=120:00:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=6   # 48 processor core(s) per node X 2 threads per core
#SBATCH --mem=30G   # maximum memory per node
#SBATCH -A gbru_hydrangea
#SBATCH --job-name="hifi"
#SBATCH --mail-user=sisi.chen@ufl.edu   # email address
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --output="slurm-%j.out" # job standard output file (%j replaced by job id)
#SBATCH --error="slurm-%j.err" # job standard error file (%j replaced by job id)


#hifiasm -o brilliant  -t 48 /project/gbru_hydrangea/sisi.chen/project/01.hibiscus/00.data/brilliant*.filt.fastq.gz

gfatools gfa2fa /project/gbru_hydrangea/sisi.chen/project/01.hibiscus/01.asm/hifi/brilliant.bp.p_ctg.gfa >/project/gbru_hydrangea/sisi.chen/project/01.hibiscus/01.asm/hifi/brilliant_p.fa


