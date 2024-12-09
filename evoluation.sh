#!/bin/bash

#SBATCH --time=120:00:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=48   # 48 processor core(s) per node X 2 threads per core
#SBATCH --mem=100G   # maximum memory per node
#SBATCH --job-name="evoluation"
#SBATCH --mail-user=sisi.chen@ufl.edu   # email address
#SBATCH --mail-type=FAIL
#SBATCH --output="evoluation-%j.out" # job standard output and standard error file (%j replaced by job id)
#SBATCH -A gbru_hydrangea

date;hostname;pwd

gfatools gfa2fa Vpom_hic.asm.hic.p_ctg.gfa > Vpom.asm.hic.p_ctg_verfy.fa

quast.py Vpom.asm.hic.p_ctg_verfy.fa -o quast_verify -t 20

#db_busco="/blue/xingbo.wu/sisi.chen/database/embryophyta_odb9.tar.gz"
busco -i Vpom.asm.hic.p_ctg_verfy.fa -o ./busco_verify/ -m genome -c 15 -l embryophyta_odb10

