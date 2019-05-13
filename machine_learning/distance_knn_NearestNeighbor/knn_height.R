# predict sex based on height using knn

#load data & library
library(dslabs)
library(tidyverse)
library(caret)
data("heights")

set.seed(1)
test_index <- createDataPartition(heights$sex, times = 1, p = 0.5, list = FALSE)
test_set <- heights[test_index, ]
train_set <- heights[-test_index, ]

#Use the sapply function to perform knn with k values of seq(1, 101, 3) 
#and calculate F_1 scores.
ks <- seq(1,101,3)
F_1 <- sapply(ks,function(k){
  fit <- knn3(sex ~ height, data = train_set, k=k)
  y_hat <- predict(fit, test_set,type = "class") %>%
    factor(levels = levels(train_set$sex))
  F_meas(data = y_hat,reference = test_set$sex)
  
})

plot(ks,F_1)
#max value of F_1
max(F_1)
#value of k does the max occur
ks[which.max(F_1)]
