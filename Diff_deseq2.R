library(DESeq2)
sampleNames <- c("F_1","F_2","F_3","N_1","N_2","N_3")
mydata <- read.table("Lnc_RNA.count", header = FALSE, quote = '\t')
names(mydata)[2:7] <- sampleNames
countMatrix <- as.matrix(mydata[2:7])
rownames(countMatrix) <-mydata$V1
table2 <- data.frame(name = c("F_1","F_2","F_3","N_1","N_2","N_3"),condition = c("F","F","F","N","N","N"))
rownames(table2) <- sampleNames
head(countMatrix)
dds <- DESeqDataSetFromMatrix(countMatrix, colData=table2, design= ~ condition)
dds
dds <- dds[ rowSums(counts(dds)) > 1, ]
dds
rld <- rlog(dds)
plotPCA(rld, intgroup=c("name","condition"))
library(DESeq)
dds <- DESeq(dds)
res <- results(dds)
write.table(res,"result.csv", sep = ",", row.names = TRUE)
head(res)
summary(res)
pdf('volcano.pdf',width = 6, height = 7)
library(ggplot2)
library(dplyr)
results<- read.csv("result.csv",header = TRUE,sep=',')
data <- data.frame(
  pvalue = results$pvalue, 
  lfc = results$log2FoldChange,
  change=results$log2FoldChange)
data <- na.omit(data)
head(data)
data$change<-as.factor(ifelse(abs(data$lfc)>1.5 & (data$pvalue<0.05),
                              ifelse((data$lfc) > 1.5,"UP","down"),"NOT"))
this_title <- paste0('The number of up gene is',nrow(data[data$change == 'UP', ]),
                     '\nThe number of down gene is ',nrow(data[data$change == 'down', ]),
                     '\n cutoff for logFC is 1.5')
ggplot(data,aes((x=data$lfc),y=-log10((data$pvalue)),colour=change))+xlab("log2fold change")+ylab("-log10p-value")+ geom_point(alpha=0.7, size=1) + theme_set(theme_set(theme_bw(base_size = 20)))+ggtitle( this_title) +theme(plot.title = element_text(size = 15,hjust = 0.5))+scale_colour_manual(values = c('blue','black','red'))
dev.off()
sum(res$padj < 0.1, na.rm=TRUE)
library("pheatmap")
select <- order(rowMeans(counts(dds,normalized=TRUE)),decreasing=TRUE)[1:500]
nt <- normTransform(dds) # defaults to log2(x+1)
log2.norm.counts <- assay(nt)[select,]
df <- as.data.frame(colData(dds)[,c("name","condition")])
pdf('heatmap500.pdf',width = 6, height = 7)
pheatmap(log2.norm.counts, cluster_rows=TRUE, show_rownames=FALSE,
         cluster_cols=TRUE, annotation_col=df)
dev.off()


