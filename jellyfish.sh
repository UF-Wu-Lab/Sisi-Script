#!/bin/bash

#SBATCH --job-name="jellyfish"              #name of the job submitted
#SBATCH --ntasks=1                    # Run on a single CPU
#SBATCH -t 4-00:00:00              # Time limit hrs:min:sec
#SBATCH --cpus-per-task=48            # Number of CPU Cores per task
#SBATCH --mem=200G
#SBATCH --qos=xingbo.wu-b
#SBATCH --mail-user=sisi.chen@ufl.edu      #email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

date;hostname;pwd

module load jellyfish


