#!/bin/bash
#SBATCH --job-name=evaluation # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --cpus-per-task=96
#SBATCH --mem-per-cpu=1g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=evaluation_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd

module load gfatools
module load quast
module load busco

gfatools gfa2fa Vpom_raw.asm.bp.p_ctg.gfa > Vpom_raw.asm_p.fa

quast.py Vpom_raw.asm_p.fa -o quast_raw -t 20

#db_busco="/blue/xingbo.wu/sisi.chen/database/embryophyta_odb9.tar.gz"
busco -i Vpom_raw.asm_p.fa -o ./busco/ -m genome -c 15 -l embryophyta_odb10


