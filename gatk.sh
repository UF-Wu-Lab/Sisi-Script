#!/bin/bash

#SBATCH --job-name=pamer_alignment # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem-per-cpu=5g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=pammer_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd

module load cutadapt
module load bwa
module load samtools
module load picard/2.9.2
module load gatk/4.4.0.0

#mkdir $(pwd)/tmp
#mkdir $(pwd)/refgenome
#mkdir 01.alignment
#mkdir 02.gvcfs
#mkdir gbstrim

#for file in $(pwd)/00.data/*.fastq.gz; 
#do
#filename=$(basename "$file")
#$(pwd)/gbstrim.pl --enzyme1 BtgI --enzyme2 TaqI --fastqfile "$file" --read R1 --outputfile $(pwd)/gbstrim/${filename%.fastq.gz}.fq.gz
#done

#cp /blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hifiasm_V2/WestIndian_ragtag_V2.fa $(pwd)/refgenome/WestIndian_ragtag_V2.fa
#bwa index -a bwtsw $(pwd)/refgenome/brilliant_p.fa

#for file in $(pwd)/gbstrim/*.fq.gz; 
#do
#    filename=$(basename "$file") 
#    bwa mem -t 40 $(pwd)/refgenome/brilliant_p.fa "$file" | samtools view -bS | samtools sort -o $(pwd)/01.alignment/${filename%.fq.gz}.bam
#done

#for file in $(pwd)/01.alignment/*.bam
#do
#filename=$(basename "$file")
#java -Xmx72g -jar /apps/picard/2.9.2/picard.jar \
#AddOrReplaceReadGroups \
#INPUT="$file" \
#OUTPUT=$(pwd)/01.alignment/${filename%.bam}_RG.bam \
#RGID=${filename} RGSM=${filename} RGLB=${filename} RGPL=ILLUMINA RGPU=ignore
#done

#for file in $(pwd)/01.alignment/*_RG.bam
#do
#filename=$(basename "$file")
#java -Xmx72g -jar /apps/picard/2.9.2/picard.jar \
#MarkDuplicates \
#INPUT= "$file" \
#OUTPUT=$(pwd)/01.alignment/${filename%_RG.bam}_mkdupl.bam \
#METRICS_FILE=$(pwd)/01.alignment/${filename%_RG.bam}_mkduplMetrics.txt TMP_DIR=`pwd`/tmp
#done

#for file in $(pwd)/01.alignment/*_mkdupl.bam
#do
#filename=$(basename "$file") \
#java -Xmx72g -jar /apps/picard/2.9.2/picard.jar \
#BuildBamIndex \
#INPUT="$file"
#done

#java -Xmx72g -jar /apps/picard/2.9.2/picard.jar \
#CreateSequenceDictionary \
#REFERENCE=$(pwd)/refgenome/brilliant_p.fa \
#OUTPUT=$(pwd)/refgenome/brilliant_p.dict

#samtools faidx /blue/xingbo.wu/sisi.chen/05.hibiscus/02.GBS/refgenome/brilliant_p.fa

for file in $(pwd)/01.alignment/*_mkdupl.bam
do
filename=$(basename "$file")
       withpath="${file}"
       filename=${withpath##*/}
       base="${filename%_mkdupl.bam}"
       printf "taking %s for HaplotypeCaller processing...\n" $base
/blue/xingbo.wu/michael.vn/tools/gatk-4.2.6.1/gatk --java-options "-Xmx72G" HaplotypeCaller -ERC GVCF \
-R $(pwd)/refgenome/brilliant_p.fa \
-I "$file" \
-O $(pwd)/02.gvcfs/${filename%_mkdupl.bam}_gvcf.vcf
done

