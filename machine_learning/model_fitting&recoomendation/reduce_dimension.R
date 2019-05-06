#Dimension Reduction

data("tissue_gene_expression")
dim(tissue_gene_expression$x)

#Which tissue is in a cluster by itself
pc <- prcomp(tissue_gene_expression$x)
data.frame(pc_1 = pc$x[,1], pc_2 = pc$x[,2], 
           tissue = tissue_gene_expression$y) %>%
  ggplot(aes(pc_1, pc_2, color = tissue)) +
  geom_point()

#What is the correlation between PC
avgs <- rowMeans(tissue_gene_expression$x)
data.frame(pc_1 = pc$x[,1], avg = avgs, 
           tissue = tissue_gene_expression$y) %>%
  ggplot(aes(avgs, pc_1, color = tissue)) +
  geom_point()
cor(avgs, pc$x[,1])

# Redo the PCA but only after removing the center
x <- with(tissue_gene_expression, sweep(x, 1, rowMeans(x)))
pc <- prcomp(x)
data.frame(pc_1 = pc$x[,1], pc_2 = pc$x[,2], 
           tissue = tissue_gene_expression$y) %>%
  ggplot(aes(pc_1, pc_2, color = tissue,label= tissue)) +
  geom_text()
  geom_point()

#which two tissues have the greatest median difference, using boxplot
for(i in 1:10){
  boxplot(pc$x[,i] ~ tissue_gene_expression$y, main = paste("PC", i))
}

#Plot the percent variance explained by PC number
#How many PCs are required to reach a cumulative percent variance 
#explained greater than 50%
plot(summary(pc)$importance[3,])