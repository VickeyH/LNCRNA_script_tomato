#!/bin/bash

awk '$0~">"{print $0}' ORF.out | cut -d "_" -f 2|cut -d ":" -f 1 |uniq >ORFIND_uniq_ID.out
