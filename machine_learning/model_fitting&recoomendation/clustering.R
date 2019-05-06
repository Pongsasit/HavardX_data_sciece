#clustering

library(dslabs)
library(dplyr)
data("tissue_gene_expression")

#Remove the row means and compute the distance between each observation
#Store the result in d
d <- dist(tissue_gene_expression$x - rowMeans(tissue_gene_expression$x))

#Which tissue type is in the branch farthest to the left, plot it
h <- hclust(d)
plot(h)

#Run a k-means clustering on the data with k=7
#Make a table comparing the identified clusters to the actual tissue types
cl <- kmeans(tissue_gene_expression$x, centers =7)
table(cl$cluster, tissue_gene_expression$y)

#Select the 50 most variable genes. 
#use the ColSideColors argument to assign colors. Also, use col = RColorBrewer::brewer.pal(11, "RdBu") for a better use of colors
library(RColorBrewer)

sds <- matrixStats::colSds(tissue_gene_expression$x)
ind <- order(sds, decreasing = TRUE)[1:50]
colors <- brewer.pal(7, "Dark2")[as.numeric(tissue_gene_expression$y)]

heatmap(t(tissue_gene_expression$x[,ind]), col = brewer.pal(11, "RdBu"), 
        scale = "row", ColSideColors = colors)
