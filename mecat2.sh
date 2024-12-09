#!/bin/bash


#SBATCH --time=300:00:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=48   # 48 processor core(s) per node X 2 threads per core
#SBATCH --mem=350G   # maximum memory per node
#SBATCH -A gbru_hydrangea
#SBATCH --job-name="mecat2"
#SBATCH --mail-user=sisi.chen@ufl.edu   # email address
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --output="slurm-%j.out" # job standard output file (%j replaced by job id)
#SBATCH --error="slurm-%j.err" # job standard error file (%j replaced by job id)


date

/project/gbru_hydrangea/sisi.chen/app/MECAT2/Linux-amd64/bin/mecat.pl correct brilliant_config_file.txt
/project/gbru_hydrangea/sisi.chen/app/MECAT2/Linux-amd64/bin/mecat.pl trim brilliant_config_file.txt
/project/gbru_hydrangea/sisi.chen/app/MECAT2/Linux-amd64/bin/mecat.pl assemble brilliant_config_file.txt

date

