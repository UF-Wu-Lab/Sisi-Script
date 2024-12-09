#!/bin/bash
#SBATCH --job-name=gblock
#SBATCH --qos=xingbo.wu-b
#SBATCH --ntasks=1
#SBATCH --mem=100G
#SBATCH --time=23:00:00
#SBATCH --cpus-per-task=10


module load gblocks/0.91b

# Create an output directory for the trimmed files
mkdir -p trimmed_files

# Loop through the aligned files in the parent directory (../)
for file in ../aligned_OG*.fa
do
    # Extract the filename without the path
    base=$(basename $file)

    # Run Gblocks on the aligned file
    Gblocks $file -t=p -b4=5 -b5=a

    # Move the trimmed files to the trimmed_files directory
    mv ../${base}-gb* trimmed_files/
done

