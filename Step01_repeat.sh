#!/bin/bash
#SBATCH --job-name=repeat # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --cpus-per-task=20
#SBATCH --mem-per-cpu=10g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=repeat_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd

module load repeatmodeler
for i in Haden Safeda ordorata
do

#BuildDatabase -name alphonso -engine ncbi /blue/xingbo.wu/sisi.chen/03.mango/00.data/alphonso.fa

#RepeatModeler -engine ncbi -database alphonso -pa 20 -LTRStruct 

module load repeatmasker
RepeatMasker -e rmblast -lib alphonso-families.fa -pa 20 /blue/xingbo.wu/sisi.chen/03.mango/00.data/"$i"_ragtag.fa

done
