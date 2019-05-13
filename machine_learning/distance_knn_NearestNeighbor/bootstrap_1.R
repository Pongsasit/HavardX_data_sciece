#bootstrap ==> similarto CLT but focus on median

#The createResample function can be used to create bootstrap samples.

set.seed(1995)
indexes <- createResample(mnist_27$train$y, 10)

#How many times do 3, 4, and 7 appear in the "first" resampled index
sum(indexes[[1]] == 3)
sum(indexes[[1]] == 4)
sum(indexes[[1]] == 7)

#What is the total number of times that 3 appears in all of the resampled
x <- sapply(indexes, function(ind){
  sum(ind == 3)
})
sum(x)

