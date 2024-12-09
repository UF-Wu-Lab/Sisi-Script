#!/bin/bash
#!/bin/bash
#SBATCH --job-name=augustus # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=64
#SBATCH --mem=300g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=augustus_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b


date;hostname;pwd

###Augustus###########

module load augustus
module load seqkit
module load parallel
module load bedtools

mkdir Augustus
cd Augustus

seqkit split -p 40 /blue/xingbo.wu/sisi.chen/06.Vanilla/02.anno_atlas/01.repeat_CR0040/Repeat_results/Vpom.fa.masked

mv /blue/xingbo.wu/sisi.chen/06.Vanilla/02.anno_atlas/01.repeat_CR0040/Repeat_results/Vpom.fa.masked.split ./

find Vpom.fa.masked.split/ -type f -name "*.masked" |parallel -j 40 augustus --species=arabidopsis --gff3=on >> temp.gff
join_aug_pred.pl < temp.gff  | grep -v '^#' > temp.joined.gff
bedtools sort -i temp.joined.gff > augustus.gff

cd ../

date
