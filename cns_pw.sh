#!/bin/bash

export PATH=/project/gbru_hydrangea/sisi.chen/app/MECAT2/Linux-amd64/bin:/project/gbru_hydrangea/sisi.chen/app/MECAT2/Linux-amd64/bin:$PATH
retVal=0
if [ $retVal -eq 0 ]; then
  /project/gbru_hydrangea/sisi.chen/app/MECAT2/Linux-amd64/bin/mecat2map -kmer_size 13 -task pm -outfmt seqidx -num_threads 40 -db_dir /project/gbru_hydrangea/sisi.chen/project/01.hibiscus/01.asm/brilliant/1-consensus/cns_pm_dir -keep_db -min_query_size 1000 -out /project/gbru_hydrangea/sisi.chen/project/01.hibiscus/01.asm/brilliant/1-consensus/cns_pm.seqidx /project/gbru_hydrangea/sisi.chen/project/01.hibiscus/01.asm/fastq.lst /project/gbru_hydrangea/sisi.chen/project/01.hibiscus/01.asm/fastq.lst
  temp_result=$?
  if [ $retVal -eq 0 ]; then
    retVal=$temp_result
  fi
fi

echo $retVal > /project/gbru_hydrangea/sisi.chen/project/01.hibiscus/01.asm/brilliant/scripts/cns_pw.sh.done
