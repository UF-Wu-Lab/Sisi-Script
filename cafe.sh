#!/bin/bash
#SBATCH --job-name=cafe # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=50g
#SBATCH --time=48:00:00              # Time limit hrs:min:sec
#SBATCH --output=cafe_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b


date;hostname;pwd

# Load CAFE module if it is available on your cluster
module load gcc/9.3.0 cafe/5.0.0  # Change if you need to load a specific version or module

# Run CAFE
cafe5 -i Modified_GeneCount_filter.txt -t allspecies.2_rerooted.nwk  --output_prefix cafe_ortho --cores 24

