#mnist-preprocessing-modelfitting-knn-randomforest&Rborist
#ENSEMBLES

#Use the training set to build a model with 
#several of the models available from the caret package

#We will test out all of the following models 

models <- c("glm", "lda",  "naive_bayes",  "svmLinear", 
            "gamboost",  "gamLoess", "qda", 
            "knn", "kknn", "loclda", "gam",
            "rf", "ranger",  "wsrf", "Rborist", 
            "avNNet", "mlp", "monmlp",
            "adaboost", "gbm",
            "svmRadial", "svmRadialCost", "svmRadialSigma")
#using train with all the default parameters
#download data

library(caret)
library(dslabs)

set.seed(1)
data("mnist_27")

fits <- lapply(models, function(model){ 
  print(model)
  train(y ~ ., method = model, data = mnist_27$train)
}) 

names(fits) <- models

#use sapply or map to create a matrix of predictions for the test set
pred <- sapply(fits, function(object) 
  predict(object, newdata = mnist_27$test))
#find row and column of dataset
dim(pred)

#compute accuracy for each model on the test set.
acc <- colMeans(pred == mnist_27$test$y)
acc
mean(acc)

#build an ensemble prediction by majority vote 
#and compute the accuracy of the ensemble
votes <- rowMeans(pred == "7")
y_hat <- ifelse(votes > 0.5, "7","2")
mean(y_hat == mnist_27$test$y)

# Which individual methods perform better than the ensemble
ind <- acc > mean(y_hat == mnist_27$test$y)
sum(ind)
models[ind]

#What is the mean accuracy of the new estimates
# using the test data
acc_hat <- sapply(fits, function(fit) min(fit$results$Accuracy))
mean(acc_hat)

#the accuracy of the ensemble for test data
ind <- acc_hat >= 0.8
votes <- rowMeans(pred[,ind] == "7")
y_hat <- ifelse(votes>=0.5, 7, 2)
mean(y_hat == mnist_27$test$y)
