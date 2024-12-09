awk '/^>/&&NR>1{print "";}{printf "%s",/^>/?$0"\n":$0}' ../hass.fa >hass.fa
less ../WestIndian_ragtag.fa | grep -f Chr.ID -A 1 > WestIndian_Chr.fa
less hass.fa | grep -f Chr.ID -A 1 > hass_Chr.fa
for i in WestIndian
do
sed -i 's/CM056809\.1\_RagTag/Chr1/' "$i"_Chr.fa
sed -i 's/CM056810\.1\_RagTag/Chr2/' "$i"_Chr.fa
sed -i 's/CM056811\.1\_RagTag/Chr3/' "$i"_Chr.fa
sed -i 's/CM056812\.1\_RagTag/Chr4/' "$i"_Chr.fa
sed -i 's/CM056813\.1\_RagTag/Chr5/' "$i"_Chr.fa
sed -i 's/CM056814\.1\_RagTag/Chr6/' "$i"_Chr.fa
sed -i 's/CM056815\.1\_RagTag/Chr7/' "$i"_Chr.fa
sed -i 's/CM056816\.1\_RagTag/Chr8/' "$i"_Chr.fa
sed -i 's/CM056817\.1\_RagTag/Chr9/' "$i"_Chr.fa
sed -i 's/CM056818\.1\_RagTag/Chr10/' "$i"_Chr.fa
sed -i 's/CM056819\.1\_RagTag/Chr11/' "$i"_Chr.fa
sed -i 's/CM056820\.1\_RagTag/Chr12/' "$i"_Chr.fa
done
