#!/bin/bash
#SBATCH --job-name=mafft
#SBATCH --qos=xingbo.wu-b
#SBATCH --ntasks=1
#SBATCH --mem=100G
#SBATCH --time=23:00:00
#SBATCH --cpus-per-task=12


module load mafft

for file in ../OG*.fa
do
    base=$(basename $file)
    mafft --thread 12 --auto $file > aligned_$base
done

