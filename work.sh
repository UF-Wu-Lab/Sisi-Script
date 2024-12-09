cp ../iqtree/combind.fa.treefile ./my_tree.nwk
vi ./my_tree.nwk --> %s#_combind## 

awk 'BEGIN {OFS="\t"} NR==1 {print "Desc", $0} NR>1 {print "(null)", $0}' Orthogroups.GeneCount.tsv > Modified_GeneCount.txt

awk 'NR==1 || $3<100 && $4<100 && $5<100 && $6<100 && $7<100 && $8<100 && $9<100 && $10<100 && $11<100 && $12<100 && $13<100 {print $0}' Modified_GeneCount.txt >Modified_GeneCount_filter.txt

