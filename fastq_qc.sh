#!/bin/bash
# 指控循环脚本
#需要提供质控文件所在文件夹目录
for i in  $1/*.gz;
do 
nohup fastqc -o .  $i &
done
