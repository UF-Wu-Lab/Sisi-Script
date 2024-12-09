#!/bin/bash
#SBATCH --job-name=cdhit_batch
#SBATCH --output=cdhit_batch_output.log
#SBATCH --error=cdhit_batch_error.log
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=64G
#SBATCH --time=12:00:00

# Load the CD-HIT module
module load cdhit/4.6.8

# Create output directory if it doesn't exist
mkdir -p longest_isoform

# Set identity threshold (adjust if necessary)
IDENTITY_THRESHOLD=0.99

# Loop through all .aa files in the current folder
for file in input/*.pep; do
    # Extract the filename without the extension
    base_name=$(basename "$file" .pep)

    # Run CD-HIT to retain the longest isoform for each protein
    cd-hit -i "$file" -o "longest_isoform/${base_name}_longest_isoform.pep" -c $IDENTITY_THRESHOLD -n 5 -d 0

    echo "Processed $file"
done

echo "CD-HIT clustering completed for all .pep files."

