#!/bin/bash
#SBATCH --job-name=busco # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --cpus-per-task=15
#SBATCH --mem-per-cpu=5g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=busco_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd

module load busco

#db_busco="/blue/xingbo.wu/sisi.chen/database/embryophyta_odb9.tar.gz"

busco -i WestIndian_hifi_p.fa -o ./WestIndian_busco/ -m genome -c 15 -l embryophyta_odb10 

date

