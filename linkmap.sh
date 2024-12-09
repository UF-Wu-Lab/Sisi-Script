#!/bin/bash
#SBATCH --job-name=dotplot # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --cpus-per-task=10
#SBATCH --mem-per-cpu=10g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=dotplot_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd

module load minimap2

minimap2 -x asm5 -t 10 hass.fa WestIndian_ragtag.fa > WestIndian_minimap2.paf


module load R/4.2

    /blue/xingbo.wu/sisi.chen/app/dotPlotly/pafCoordsDotPlotly.R -i WestIndian_minimap2.paf -o WestIndian -s -t -l
date
