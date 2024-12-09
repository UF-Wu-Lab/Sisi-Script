module load gffread

gffread augustus.gff -g ../../01.repeat/WestIndian_ragtag.fa.masked -y augustus.pep
gffread augustus.gff -g ../../01.repeat/WestIndian_ragtag.fa.masked -x augustus.cds
