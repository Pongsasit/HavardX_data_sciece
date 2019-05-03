#practice building a machine learning algorithm using dataset "iris"

library(caret)
data(iris)
head(iris)
# remove the setosa species 
#and we will focus on the versicolor and virginica iris species
iris <- iris[-which(iris$Species=='setosa'),]
y <- iris$Species

#create an even split of the data into train and test
#using createDataPartition
set.seed(2)
test_index <- createDataPartition(y,times=1,p=0.5,list=FALSE) 
test <- iris[test_index,]
train <- iris[-test_index,]

#Using only the train iris dataset, for each feature, 
#perform a simple search to find the cutoff that produces the highest accuracy
#Using only the train iris dataset, for each feature, perform a simple search 
#to find the cutoff that produces the highest accuracy
foo <- function(x){
  rangedValues <- seq(range(x)[1],range(x)[2],by=0.1)
  sapply(rangedValues,function(i){
    y_hat <- ifelse(x>i,'virginica','versicolor')
    mean(y_hat==train$Species)
  })
}
predictions <- apply(train[,-5],2,foo)
sapply(predictions,max)	

#what is the overall accuracy in the test data
predictions <- foo(train[,3])
rangedValues <- seq(range(train[,3])[1],range(train[,3])[2],by=0.1)
cutoffs <-rangedValues[which(predictions==max(predictions))]

y_hat <- ifelse(test[,3]>cutoffs[1],'virginica','versicolor')
mean(y_hat==test$Species)
#Petal.width feature best optimizes our overall accuracy


plot(iris,pch=21,bg=iris$Species)
#Optimize the the cutoffs for Petal.Length and Petal.Width separately 
#in the train dataset by using the seq function with increments of 0.1. 
petalLengthRange <- seq(range(train$Petal.Length)[1],range(train$Petal.Length)[2],by=0.1)
petalWidthRange <- seq(range(train$Petal.Width)[1],range(train$Petal.Width)[2],by=0.1)

#report the overall accuracy when applied to the test dataset 
#by creating a rule that predicts virginica & vesicolor
#if Petal.Length is greater than the length cutoff OR 
#Petal.Width is greater than the width cutoff

length_predictions <- sapply(petalLengthRange,function(i){
  y_hat <- ifelse(train$Petal.Length>i,'virginica','versicolor')
  mean(y_hat==train$Species)
})
length_cutoff <- petalLengthRange[which.max(length_predictions)] # 4.7

width_predictions <- sapply(petalWidthRange,function(i){
  y_hat <- ifelse(train$Petal.Width>i,'virginica','versicolor')
  mean(y_hat==train$Species)
})
width_cutoff <- petalWidthRange[which.max(width_predictions)] # 1.5

y_hat <- ifelse(test$Petal.Length>length_cutoff | test$Petal.Width>width_cutoff,'virginica','versicolor')
mean(y_hat==test$Species)

