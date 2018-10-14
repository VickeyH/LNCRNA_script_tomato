#!/bin/bash
mkdir gtf
mv *.gtf.FPKM gtf
cd gtf
ls *.gtf.FPKM >mergelist.txt

nohup stringtie --merge -p 8 -G ~/lncRNA/hisat2_out/ITAG3.2_gene_models.gtf -o stringie_merged.gtf mergelist.txt &      
