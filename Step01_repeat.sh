#!/bin/bash
#SBATCH --job-name=CR0040 # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=300g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=CR0040_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b


date;hostname;pwd

#ln -s /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/00.project/05.vinilla/01.asm/Vpom.asm.hic.p_ctg.fa ./
module load repeatmodeler

####Step 1: Build the RepeatModeler database
#BuildDatabase -name CR0040 -engine ncbi /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/00.project/05.vinilla/00.data/ref/CR0040/CR0040_hap.fa 

#### Step 2: Run RepeatModeler to build the custom repeat library
RepeatModeler -engine ncbi -database CR0040 -pa 64 -LTRStruct -recoverDir RM_1596954.FriOct250901542024  

echo "Repeatmodeler job complete successfully"

#### Step 3: Run RepeatMasker for masking small repeats (soft masked)
INPUT_GENOME="Vpom.fa"
OUTPUT_DIR="Repeat_results"

module load repeatmasker
RepeatMasker -e rmblast -lib CR0040-families.fa -xsmall -gff -pa 64 -dir $OUTPUT_DIR $INPUT_GENOME

echo "RepeatMasker job complete successfully."
