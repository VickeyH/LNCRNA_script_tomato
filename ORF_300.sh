#!/bin/bash

mkdir ORF
mv step1_script.fa ORF 
cd ORF
nohup ORFfinder -in step1_script.fa -s 2 -ml 300 -out ORF.out -outfmt 3 &
