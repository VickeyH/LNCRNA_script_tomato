#!/bin/bash
mkdir gffcompare
mv stringie_merged.gtf gffcompare
cd gffcompare
nohup gffcompare -r ~/lncRNA/hisat2_out/ITAG3.2_gene_models.gtf -G -o merged stringie_merged.gtf &
