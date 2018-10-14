#!/bin/sh
ls *sra |while read id; do fastq-dump --split-3 $id;done 
