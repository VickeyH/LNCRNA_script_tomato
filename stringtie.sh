#!/bin/bash
gtf=$1

bam=$2
pre=$3
 nohup stringtie -p 8 --rf -G ~/lncRNA/hisat2_out/stringtie/ITAG3.2_gene_models.gtf -o ${gtf}.gtf -l $pre $bam &
