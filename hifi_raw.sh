#!/bin/bash
#SBATCH --job-name=hifiasm # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --cpus-per-task=76
#SBATCH --mem-per-cpu=12g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=hifiasm_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd

module load hifiasm

hifiasm -o Vpom_raw.asm -t 76 /blue/xingbo.wu/sisi.chen/06.Vanilla/00.data/genome/*.filt.fastq.gz
date
