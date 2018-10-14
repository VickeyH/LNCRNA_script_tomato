#!/bin/bash
for i in *.sam;do
# echo $i
bam=$(echo $i | sed 's/sam/bam/g')
#echo $bam
nohup samtools sort -n -@ 8 -o $bam $i &
done
