#!/bin/bash

nohup hmmscan -o hmmscan.out --tblout hamm_tb.tbl --noali -E 1e-5 ~/lncRNA/hisat2_out/stringtie/gtf/blast_step3/Pfam/Pfam-A.hmm step2_D_ORFCNCI.fa &
