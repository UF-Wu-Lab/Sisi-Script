#!/bin/bash
#SBATCH --job-name=busco # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --cpus-per-task=20
#SBATCH --mem-per-cpu=5g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=busco_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd

module load quast

#quast.py /blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hifiasm_V2/WestIndian_ragtag_V2.fa -r /blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hass.fa -g /blue/xingbo.wu/sisi.chen/02.avacado/00.GCA_029852735.1_hass/genomic.gff  -o quast_out -t 20

quast.py /blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hifiasm_V2/WestIndian_ragtag_V2.fa  -o quast_out -t 20
date
