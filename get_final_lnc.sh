#!/bin/bash
cp ../step2_ID.out .
cat hairpin_mirna_blast.out house_keeping_blast.out swiss_unipro_blast.out >all_blast.out
awk '$3>90&&$11<1.0e-10{print $1}' all_blast.out |sort|uniq >balst_ID.out
comm balst_ID.out step2_ID.out -1 -3 >step3_ID.out
xargs samtools faidx step2_D_ORFCNCI.fa < step3_ID.out > fina_lncRNA.fa
