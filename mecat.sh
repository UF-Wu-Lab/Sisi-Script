#!/bin/bash
#SBATCH --job-name=mecat # Job name
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sisi.chen@ufl.edu    # Where to send mail
#SBATCH --cpus-per-task=40
#SBATCH --mem-per-cpu=10g
#SBATCH --time=96:00:00              # Time limit hrs:min:sec
#SBATCH --output=mecat_%j.log # Standard output and error log
#SBATCH --qos=xingbo.wu-b
date;hostname;pwd


/blue/xingbo.wu/sisi.chen/app/MECAT2/Linux-amd64/bin/mecat.pl correct brilliant_config_file.txt
/blue/xingbo.wu/sisi.chen/app/MECAT2/Linux-amd64/bin/mecat.pl trim brilliant_config_file.txt
/blue/xingbo.wu/sisi.chen/app/MECAT2/Linux-amd64/bin/mecat.pl assemble brilliant_config_file.txt
