#!/bin/bash
awk '$2=="coding"{print $1}' CNCI.index > CNCI_coding_ID.out
cp CNCI_coding_ID.out ../
cd ../
cat CNCI_coding_ID.out ORFIND_uniq_ID.out | sort |uniq > ORF_CNCI_total_ID.out

