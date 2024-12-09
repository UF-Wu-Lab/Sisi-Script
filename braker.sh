#!/bin/bash

#SBATCH --job-name="braker3"              #name of the job submitted
#SBATCH --ntasks=1                    # Run on a single CPU
#SBATCH -t 4-00:00:00              # Time limit hrs:min:sec
#SBATCH --cpus-per-task=48            # Number of CPU Cores per task
#SBATCH --mem=300G
#SBATCH --qos=xingbo.wu-b
#SBATCH --mail-user=sisi.chen@ufl.edu      #email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

date;hostname;pwd

module load braker/3.0.8

export AUGUSTUS_CONFIG_PATH=/blue/xingbo.wu/sisi.chen/05.hibiscus/01.anno_atlas/02.prediction_Atha/braker/config

braker.pl --genome=/blue/xingbo.wu/sisi.chen/05.hibiscus/01.anno_atlas/01.repeat/Repeat_results/brilliant_p.fa.masked --prot_seq=/orange/xingbo.wu/sisi.chen/DB/odb12v0_all.fasta --threads=48


