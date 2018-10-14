#!/bin/bash


for i in *.gtf;do
sed 's/[";]//g' $i | awk '$3~"transcript"&&$15~"FPKM"&&$16>1{print $12}'> $i.Trans
nohup python ~/lncRNA/scrip_lncRNA/transcript_FPKM.py $i $i.FPKM $i.Trans &
done

