#gene expression example
#usin fit <- knn3(x,y,k) pattern

#load data & library
library(dslabs)
data("tissue_gene_expression")

set.seed(1)
y <- tissue_gene_expression$y
x <- tissue_gene_expression$x
train_index <- createDataPartition(y , list = FALSE)

#report the accuracy you obtain. Try it for k = 1, 3, 5, 7, 9, 11
sapply(seq(1,11,2),function(k){
  fit <- knn3(x[train_index,], y[train_index], k=k)
  y_hat <- predict(fit, newdata = data.frame(x=x[-train_index,]),
                   type = "class")
  mean(y_hat == y[-train_index])
})
