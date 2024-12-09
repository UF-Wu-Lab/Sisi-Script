#!/bin/bash
#SBATCH --job-name=tidk # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --cpus-per-task=5
#SBATCH --mem-per-cpu=2g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=tidk_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd

module load conda
conda activate sisiconda

tidk search -s AAACCCT -o WestIndian -d . WestIndian_ragtag.fa

tidk plot -t WestIndian_telomeric_repeat_windows.tsv -o WestIndian  -w 600

date
