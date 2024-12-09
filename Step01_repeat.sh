#!/bin/bash
#SBATCH --job-name=Hsyr # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=300g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=Hsyr_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b

date;hostname;pwd

#ln -s /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/00.project/04.hibiscus/00.data/assembly_V2/purge_dup_hifi/R2/briiliant_p.fa ./
#module load repeatmodeler

####Step 1: Build the RepeatModeler database
#BuildDatabase -name Hsyr -engine ncbi /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/00.project/04.hibiscus/00.ref/Hsyriacus/Hsyriacus.fa 

#### Step 2: Run RepeatModeler to build the custom repeat library
#RepeatModeler -engine ncbi -database Hsyr -pa 64 -LTRStruct -recoverDir RM_715884.FriOct250950492024 

#### Step 3: Run RepeatMasker for masking small repeats (soft masked)
INPUT_GENOME="brilliant_p.fa"
OUTPUT_DIR="Repeat_results"

module load repeatmasker
RepeatMasker -e rmblast -lib Hsyr-families.fa -xsmall -gff -pa 64 -dir $OUTPUT_DIR $INPUT_GENOME

echo "RepeatMasker job completed successfully."
