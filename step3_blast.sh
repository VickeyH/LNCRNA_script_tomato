#!/bin/bash
mkdir step3_blast
mv step2_D_ORFCNCI.fa step3_blast
cd step3_blast/
nohup blastx -query step2_D_ORFCNCI.fa -db ~/lncRNA/hisat2_out/stringtie/gtf/blast_step3/swiss_pro/swiss_unipro -outfmt 6 -out swiss_unipro_blast.out -num_threads 8 &
nohup blastn -query step2_D_ORFCNCI.fa -db ~/lncRNA/hisat2_out/stringtie/gtf/blast_step3/plant_housekeepingRNA/house_keeping  -outfmt 6 -out house_keeping_blast.out -num_threads 8 &
nohup blastn -query step2_D_ORFCNCI.fa -db ~/lncRNA/hisat2_out/stringtie/gtf/blast_step3/miRNA_precursor/hairpin  -outfmt 6 -out hairpin_mirna_blast.out -num_threads 8 &
