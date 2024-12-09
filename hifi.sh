#!/bin/bash
#SBATCH --job-name=hifiasm # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --cpus-per-task=40
#SBATCH --mem-per-cpu=12g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=hifiasm_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd

#module load hifiasm

#hifiasm -o WestIndian  -t 40 /blue/xingbo.wu/share/avocado/adapterfil/*.filt.fastq.gz

#/blue/xingbo.wu/sisi.chen/app/gfatools/gfatools gfa2fa /blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hifiasm_V2/WestIndian.bp.p_ctg.gfa >/blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hifiasm_V2/WestIndian_p.fa
module load ragtag
###reference-based assembly using Ragetag
#correct a query assembly
ragtag.py  correct /blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hass.fa /blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hifiasm_V2/WestIndian_p.fa -t 40

# scaffold a query assembly
ragtag.py scaffold /blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hass.fa /blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hifiasm_V2/ragtag_output/ragtag.correct.fasta -t 40

# make joins and fill gaps in target.fa using sequences from query.fa
ragtag.py patch /blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hass.fa /blue/xingbo.wu/sisi.chen/02.avacado/01.assem/hifiasm_V2/ragtag_output/ragtag.scaffold.fasta -t 40
date
