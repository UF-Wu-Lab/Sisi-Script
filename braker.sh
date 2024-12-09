#!/bin/bash

#SBATCH --job-name="braker3"              #name of the job submitted
#SBATCH --ntasks=1                    # Run on a single CPU
#SBATCH -t 4-00:00:00              # Time limit hrs:min:sec
#SBATCH --cpus-per-task=48            # Number of CPU Cores per task
#SBATCH --mem=200G
#SBATCH --qos=xingbo.wu-b
#SBATCH --mail-user=sisi.chen@ufl.edu      #email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

date;hostname;pwd

module load braker/3.0.8

export AUGUSTUS_CONFIG_PATH=/blue/xingbo.wu/sisi.chen/02.avacado/04.annotation_V2/02.prediction/braker_DB/config

braker.pl --genome=/blue/xingbo.wu/sisi.chen/02.avacado/04.annotation_V2/01.repeat/Repeat_results/WestIndian_ragtag.fa.masked --prot_seq=/orange/xingbo.wu/sisi.chen/DB/odb12v0_pame.faa --threads=48

date
