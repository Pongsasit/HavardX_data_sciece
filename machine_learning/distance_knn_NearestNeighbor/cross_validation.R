#Cross-validation
library(dplyr)
library(tidyverse)
library(caret)
library(e1071)
#Generate a set of random predictors and outcomes
set.seed(1996)
n <- 1000
p <- 10000
x <- matrix(rnorm(n*p), n , p)
colnames(x) <- paste("x", 1:ncol(x), sep = "_")
y <- rbinom(n, 1 , 0.5) %>% factor()

x_subset <- x[ ,sample(p,100)]

#using logistic regression to fit the model.
fit <- train(x_subset, y, method = "glm")
fit$results

#comparing the values for the y=1 group to those in the y=0 group, 
#for each predictor, using a t-test.
library(devtools)
devtools::install_bioc("genefilter")
library(genefilter)
tt <- colttests(x, y)

#creates a vector of the p-values called pvals
pvals <- tt$p.value

# predictors survive this cutof using p-value cutoff of 0.01
ind <- which(pvals <= 0.01)
length(ind)

#What is the accuracy after re-run the cross-validation 
#after redefinining x_subset to be the subset of x
x_subset <- x[,ind]
fit <- train(x_subset, y, method = "glm")
fit$results

#Re-run the cross-validation again
#use kNN
#k = seq(101, 301, 25) of tuning parameters. 
#Make a plot of the resulting accuracies.
fit <- train(x_subset, y, method = "knn", 
             tuneGrid = data.frame(k = seq(101, 301, 25)))
ggplot(fit)

