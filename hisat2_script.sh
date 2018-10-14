#!/bin/bash
pre=$1
fq_1=$2
fq_2=$3
nohup hisat2 -p 16 --dta -x ~/lncRNA/hisat2_out/ITAG3.2_tran -1 $2 -2 $3 --rna-strandness RF -S ${1}.sam &
