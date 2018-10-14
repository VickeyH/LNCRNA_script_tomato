gffread step1_script.gtf -g ~/lncRNA/hisat2_out/S_lycopersicum_chromosomes.3.00.fa -w step1_script.fasta &
sleep 5s
# get step1 fatsa sequence
sed 's/ gene.*$//g' step1_script.fasta >step1_script.fa
# due to sone character which on need,remove it
