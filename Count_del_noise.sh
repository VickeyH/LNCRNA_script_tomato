#!/bin/bash
# HT-seq结果处理
for i in *.count;do
 awk '$0!~"processed|Warning|__"{print $0}' $i > ${i}.del
done
paste *.del |awk '{print$1, $2,$4,$6,$8,$10,$12}' >all.count
sed 's/.[1-9]$//g' step3_ID.out |sort|uniq >fina_lnc_ID.out
