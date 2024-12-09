#!/bin/bash
#SBATCH --job-name=iqtree
#SBATCH --ntasks=1                    # Run on a single CPU
#SBATCH -t 48:00:00              # Time limit hrs:min:sec
#SBATCH --cpus-per-task=24            # Number of CPU Cores per task
#SBATCH --mem=100G
#SBATCH --qos=xingbo.wu-b
#SBATCH --mail-user=sisi.chen@ufl.edu      #email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

date;hostname;pwd

# Load IQ-TREE module
module load iq-tree/2.2.2.7

# Set input alignment file (PHYLIP format) and output directory
alignment_file="combind.fa"
output_dir="./"

# Step 1: Run IQ-TREE to construct the maximum likelihood phylogenetic tree
iqtree -s $alignment_file -m MFP -bb 1000 -nt AUTO

# Explanation of parameters:
# - `-s`: Specifies the input alignment file in PHYLIP format.
# - `-m MFP`: Model Finder Plus, which automatically selects the best substitution model.
# - `-bb 1000`: Perform 1000 ultrafast bootstrap replicates to assess branch support.
# - `-nt AUTO`: Automatically detects and utilizes the available number of threads.
# - `-pre`: Prefix for the output files.

echo "Phylogenetic tree construction completed."

