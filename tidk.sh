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

conda activate sisiconda

#for i in Alanpur Caraboa Haden ordorata Safeda
#do
#tidk search -s AAACCCT -o "$i" -d . /blue/xingbo.wu/sisi.chen/03.mango/00.data/"$i"_ragtag.fa

#tidk plot -t "$i"_telomeric_repeat_windows.tsv -o "$i"  -w 600
#done

tidk search -s AAACCCT -o ordorata_hifi -d . /blue/xingbo.wu/sisi.chen/03.mango/00.data/hifiasm_data/ordorata.p_ctg.fa
tidk plot -t ordorata_hifi__telomeric_repeat_windows.tsv -o "$i"  -w 600

date
