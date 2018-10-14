#!/bin/bash

nohup python2.7 ~/lncRNA/hisat2_out/stringtie/gtf/CNCI/CNCI.py -f step1_script.fa -o CNCI_ID.out -m pl -p 16 &
