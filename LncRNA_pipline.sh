#LNCRNA 流程主要步骤

1 质控 和RNA_seq 质控一致

/home/lgao/pro/trim_galore.sh FPi-1D-R1-lnc 50 &

2 比对 使用hisat进行比对 此命令在质控文件下运行 
# 会生成sam文件
#建议运行完毕后，将生成的sam文件另外单独存放，便于后续分析 eg mv *.sam ~/lncRNA/hisat2_out/stringtie/3d-shoot_sam

mkdir trim_out
mv *val*gz trim_out 
cd trim_out
~/lncRNA/scrip_lncRNA/hisat2_script.sh FPi-1D-S1-lnc FPi-1D-S1-lncR1_val_1.fq.gz FPi-1D-S1-lncR2_val_2.fq.gz

需要提供三个参数 1 生成文件名前缀 2 1'fastq文件 2 2‘fastq文件

#3 使用 samtools 将sam文件转换为bam文件并且排序 用于strigntie拼接 
# 这一步需要在hisat生成的sam文件夹下运行 
~/lncRNA/scrip_lncRNA/samtools.sh

4使用stringtie进行拼接 在生成的bam文件下运行
#需要输入三个参数 1gtf文件名前缀 2 bam文件 3 文件名前缀
~/lncRNA/scrip_lncRNA/stringtie.sh NPi-3D-R3-lnc NPi-3D-R3-lnc.bam NPi-3D-R3-lnc

5 筛选FPKM值大于1的转录本，并且用stringtie_merge进行转录本的合并
 ~/lncRNA/scrip_lncRNA/FPKM_MT_1.sh 
#回生成.FPKM和.Trans文件 等到程序运行完毕在进行下一步 大概5min

 ~/lncRNA/scrip_lncRNA/stringtie_merge.sh
#会生成一个gtf文件 进入gtf文件 stringie_merged.gtf 即使合并后的转录本文件
6 使用gffcompare 将合并好的转录本和番茄原有的注释进行比较 剔除重合部分
~/lncRNA/scrip_lncRNA/gffcompare.sh
#会生成merged.annotated.gtf文件 里面有比较信息
7剔除与原有注释有重合的 和长度小于200nt的转录本
~/lncRNA/scrip_lncRNA/step1_script.sh
#会生成一个step1_script.gtf文件

8获取转录本的fasta序列用于下一步CNCI和ORFfind分析
~/lncRNA/scrip_lncRNA/gtf_to_fasta.sh

9筛选ORF<100的转录本
 ~/lncRNA/scrip_lncRNA/ORF_300.sh
#会生成一个ORF文件夹
10 使用CNCI进行编码性能预测
#进入生成的ORF文件夹运行
~/lncRNA/scrip_lncRNA/CNCI.sh
11提取ORF ID 在ORF文件夹运行
~/lncRNA/scrip_lncRNA/ORF_uniq_ID.sh

12提取CNCI结果 在生成的CNCI_out文件夹下运行
~/lncRNA/scrip_lncRNA/CNCI_coding.sh

13 剔除所有编码和ORF大于100的转录本
~/lncRNA/scrip_lncRNA/get_step2_fa.sh

14将筛选得到的序列和swisspro，植物非编码RNA进行比对 miRNA前体
~/lncRNA/scrip_lncRNA/step3_blast.sh

15 进入生成的step3_blast文件 获取最后的LncRNA 序列
~/lncRNA/scrip_lncRNA/get_final_lnc.sh
16 使用HT-seq进行表达量的提取 需要进入bam文件夹下运行例如~/lncRNA/hisat2_out/stringtie/1d-shoot_sam
~/lncRNA/scrip_lncRNA/HT-seq.sh
17 对生成的表达量矩阵进行处理 
#运行之前需要将之钱在step3文件夹下生成的step3_ID.out fina_lncRNA.fa 复制到bam文件目录下
#例子 cp step3_ID.out fina_lncRNA.fa ~/lncRNA/hisat2_out/stringtie/1d-shoot_sam/
#会生成fina_lnc_ID.out all.count 
~/lncRNA/scrip_lncRNA/Count_del_noise.sh
18生成LncRNA表达矩阵Lnc_RNA.count 用于后续差异表达分析
python ~/lncRNA/scrip_lncRNA/LNC_ID_fliter.py


