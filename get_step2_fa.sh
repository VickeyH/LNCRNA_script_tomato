#!/bin/bash
awk '$0~">"{print $0}' step1_script.fa | sed 's/>//g'|sort >step1_ID.out
comm ORF_CNCI_total_ID.out step1_ID.out -1 -3 >step2_ID.out
xargs samtools faidx step1_script.fa < step2_ID.out > step2_D_ORFCNCI.fa
