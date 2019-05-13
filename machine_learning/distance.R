library(dslabs)
data("tissue_gene_expression")
head(tissue_gene_expression)

dim(tissue_gene_expression$x)

table(tissue_gene_expression$y)
#computes the Euclidean distance 
#between each observation and stores it in the object d
d <- dist(tissue_gene_expression$x)

#Compare the distances between observations (1,2),(39,40),(73,74)
ind <- c(1, 2, 39, 40, 73, 74)
as.matrix(d)[ind,ind]

#Make a plot of all the distances using the image function 
#to see if the pattern you observed
image(as.matrix(d))