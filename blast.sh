#!/bin/bash
#SBATCH --job-name=blast # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --cpus-per-task=15
#SBATCH --mem-per-cpu=5g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=blast_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd
for i in Alanpur Caraboa Haden Safeda
do

/apps/ncbi_toolkit/12.0.0/bin/makeblastdb -in /blue/xingbo.wu/sisi.chen/03.mango/00.data/alphonso.fa -dbtype nucl -parse_seqids  -out /blue/xingbo.wu/sisi.chen/03.mango/00.data/alphonso.blastdb

/apps/ncbi_toolkit/12.0.0/bin/blastn -query "$i"_single_telomeres.fa -out "$i"_alphonso.blast -db /blue/xingbo.wu/sisi.chen/03.mango/00.data/alphonso.blastdb -outfmt 6

done
