#!/bin/bash
#SBATCH --job-name=Hic_va # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=700g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=juicer_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b

date;hostname;pwd

#module load java
#module load bwa
#module load samtools
module load juicer
#module load gcc
#module load dna_3d
#module load parallel
#export spack_PATH=/project/gbru_hydrangea/gbru_hydrangea/sisi.chen/apps/spack/bin
#export juicer_PATH=/project/gbru_hydrangea/gbru_hydrangea/sisi.chen/apps/juicer

#/project/gbru_hydrangea/gbru_hydrangea/sisi.chen/apps/gfatools/gfatools gfa2fa /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/00.project/05.vinilla/01.asm/Vpom_hic.asm.hic.p_ctg.gfa > /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/00.project/05.vinilla/01.asm/Vpom.asm.hic.p_ctg.fa

#build index file
#bwa index /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/00.project/05.vinilla/01.asm/Hic/reference/Vpom.asm.hic.p_ctg.fa

####calculate the contig length
# perl /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/script/calculate_contig_len.pl reference/Vpom.asm.hic.p_ctg.fa >Vpom.chrom.sizes

###juicer###
###python /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/apps/juicer/misc/generate_site_positions.py -s none Vpom /project/gbru_hydrangea/gbru_hydrangea/sisi.chen/00.project/05.vinilla/01.asm/Hic/reference/Vpom.asm.hic.p_ctg.fa

###awk 'BEGIN{OFS="\t"}{print $1, $NF}'  Vpom.txt > Vpom.chrom.sizes


juicer.sh -g Vpom.asm.hic.p_ctg -z /blue/xingbo.wu/sisi.chen/06.Vanilla/01.asm_Hic/Hic/reference/Vpom.asm.hic.p_ctg.fa -p /blue/xingbo.wu/sisi.chen/06.Vanilla/01.asm_Hic/Hic/Vpom.chrom.sizes -s none -d /blue/xingbo.wu/sisi.chen/06.Vanilla/01.asm_Hic/Hic -t 72

date
