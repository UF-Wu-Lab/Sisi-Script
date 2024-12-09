#!/bin/bash
#SBATCH --job-name=dotplot # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --cpus-per-task=30
#SBATCH --mem-per-cpu=10g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=dotplot_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd

module load minimap2

#for i in Alanpur Caraboa Haden ordorata Safeda
#do
#minimap2 -x asm5 -t 30 /blue/xingbo.wu/sisi.chen/03.mango/00.data/alphonso.fa /blue/xingbo.wu/sisi.chen/03.mango/00.data/"$i"_ragtag.fa > "$i"_minimap2.paf
minimap2 -x asm5 -t 30 /blue/xingbo.wu/sisi.chen/03.mango/00.data/alphonso.fa /blue/xingbo.wu/sisi.chen/03.mango/00.data/HongXiangYa.fa > HongXiangYa_alphonso_minimap2.paf
minimap2 -x asm5 -t 30 /blue/xingbo.wu/sisi.chen/03.mango/00.data/HongXiangYa.fa /blue/xingbo.wu/sisi.chen/03.mango/00.data/Caraboa_ragtag.fa> Caraboa_HongXiangYa_minimap2.paf
#done

module load R/4.2

#for i in Alanpur Caraboa Haden ordorata Safeda
#do
#    /blue/xingbo.wu/sisi.chen/app/dotPlotly/pafCoordsDotPlotly.R -i "$i"_minimap2.paf -o $i -s -t -l
#done

 /blue/xingbo.wu/sisi.chen/app/dotPlotly/pafCoordsDotPlotly.R -i HongXiangYa_alphonso_minimap2.paf -o HongXiangYa_alphonso -s -t -l
 /blue/xingbo.wu/sisi.chen/app/dotPlotly/pafCoordsDotPlotly.R -i Caraboa_HongXiangYa_minimap2.paf -o Caraboa_HongXiangYa -s -t -l
 
 date
