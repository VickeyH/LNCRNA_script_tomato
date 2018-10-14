#！/bin/bash
for i in *.bam;do
pre=$(ls $i|sed 's/.bam//g' )
nohup htseq-count -f bam -r name -s reverse -a 10 -t exon -i gene_id -m union $i ~/lncRNA/hisat2_out/stringtie/total_gtf/stringie_merged.gtf > ${pre}.count &
done
