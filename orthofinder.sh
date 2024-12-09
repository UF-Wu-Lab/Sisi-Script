#!/bin/bash
#SBATCH --job-name=Orthofinder_A # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=50g
#SBATCH --time=48:00:00              # Time limit hrs:min:sec
#SBATCH --output=Orthofinder_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b


date;hostname;pwd

module load orthofinder

orthofinder -f longest_isoform -t 24 -a 24

