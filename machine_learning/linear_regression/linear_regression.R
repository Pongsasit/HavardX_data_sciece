#Linear regression
library(dplyr)
library(MASS)
library(dslabs)
library(caret)

set.seed(1)
n <- 100
Sigma <- 9*matrix(c(1.0, 0.5, 0.5, 1.0), 2, 2)
dat <- MASS::mvrnorm(n = 100, c(69, 69), Sigma) %>%
  data.frame() %>% setNames(c("x", "y"))

#Within a replicate loop
#(1) partition the dataset into test and training sets of equal size using dat$y 
#to generate your indices
#(2)train a linear model predicting y from x
#(3)generate predictions on the test set
#(4) calculate the RMSE of that model. 

#Then, report the mean and standard deviation of the RMSEs from all 100 models.
set.seed(1)
rmse <- replicate(100,{
  test_index <- createDataPartition(dat$y, times = 1, p= 0.5, list = FALSE)
  train_set <- dat %>% slice(-test_index)
  test_set <- dat %>% slice(test_index)
  fit <- lm(y ~x,data = train_set)
  y_hat <- predict(fit, newdata = test_set)
  sqrt(mean((y_hat-test_set$y)^2))
})

#mean and standard deviation of the combined models
mean(rmse)
sd(rmse)

#repeat the exercise above but using larger datasets.takes a size n
#Set the seed to 1 and 
#then use sapply or map to apply this function to n <- c(100, 500, 1000, 5000, 10000)
#(1) builds a dataset using the code provided in Q1 but with n observations 
#instead of 100 and without the set.seed(1)
#(2) runs the replicate loop that you wrote to answer Q1, 
#which builds 100 linear models and returns a vector of RMSEs
#(3) calculates the mean and standard deviation. 
set.seed(1)
n <- c(100,500,1000,5000,10000)
res <- sapply(n,function(n){
  Sigma <- 9*matrix(c(1.0, 0.5, 0.5, 1.0), 2, 2)
  dat <- MASS::mvrnorm(n = 100, c(69, 69), Sigma) %>%
    data.frame() %>% setNames(c("x", "y"))
  rmse <- replicate(100,{
    test_index <- createDataPartition(dat$y, times = 1, p= 0.5, list = FALSE)
    train_set <- dat %>% slice(-test_index)
    test_set <- dat %>% slice(test_index)
    fit <- lm(y ~x,data = train_set)
    y_hat <- predict(fit, newdata = test_set)
    sqrt(mean((y_hat-test_set$y)^2))
  })
  c(avg = mean(rmse),sd = sd(rmse))
})
res

#change 9*matrix(c(1.0, 0.5, 0.5, 1.0), 2, 2) to 9*matrix(c(1.0, 0.95, 0.95, 1.0), 2, 2)
set.seed(1)
n <- 100
Sigma <- 9*matrix(c(1.0, 0.95, 0.95, 1.0), 2, 2)
dat <- MASS::mvrnorm(n = 100, c(69, 69), Sigma) %>%
  data.frame() %>% setNames(c("x", "y"))
set.seed(1)
rmse <- replicate(100, {
  test_index <- createDataPartition(dat$y, times = 1, p = 0.5, list = FALSE)
  train_set <- dat %>% slice(-test_index)
  test_set <- dat %>% slice(test_index)
  fit <- lm(y ~ x, data = train_set)
  y_hat <- predict(fit, newdata = test_set)
  sqrt(mean((y_hat-test_set$y)^2))
})

mean(rmse)
sd(rmse)

#above show that When 
#increase the correlation between x and y, x has more predictive power 
#and thus provides a better estimate of y.

#Which of the three models performs the best (has the lowest RMSE)
#Set the seed to 1, then use the caret package to partition into a 
#test and training set of equal size.
#Compare the RMSE when using just x_1, just x_2 and both x_1 and x_2. 
#Train a linear model for each.

set.seed(1)
Sigma <- matrix(c(1.0, 0.75, 0.75, 0.75, 1.0, 0.25, 0.75, 0.25, 1.0), 3, 3)
dat <- MASS::mvrnorm(n = 100, c(0, 0, 0), Sigma) %>%
  data.frame() %>% setNames(c("y", "x_1", "x_2"))

set.seed(1)
test_index <- createDataPartition(dat$y, times = 1, p = 0.5, list = FALSE)
train_set <- dat %>% slice(-test_index)
test_set <- dat %>% slice(test_index)

fit <- lm(y ~ x_1, data = train_set)
y_hat <- predict(fit, newdata = test_set)
sqrt(mean((y_hat-test_set$y)^2))

fit <- lm(y ~ x_2, data = train_set)
y_hat <- predict(fit, newdata = test_set)
sqrt(mean((y_hat-test_set$y)^2))

fit <- lm(y ~ x_1 + x_2, data = train_set)
y_hat <- predict(fit, newdata = test_set)
sqrt(mean((y_hat-test_set$y)^2))

# in which x_1 and x_2 are highly correlated , 
#Adding extra predictors can improve RMSE substantially, 
#but not when the added predictors are highly correlated with other predictors. 
set.seed(1)
Sigma <- matrix(c(1.0, 0.75, 0.75, 0.75, 1.0, 0.95, 0.75, 0.95, 1.0), 3, 3)
dat <- MASS::mvrnorm(n = 100, c(0, 0, 0), Sigma) %>%
  data.frame() %>% setNames(c("y", "x_1", "x_2"))
set.seed(1)
test_index <- createDataPartition(dat$y, times = 1, p = 0.5, list = FALSE)
train_set <- dat %>% slice(-test_index)
test_set <- dat %>% slice(test_index)

fit <- lm(y ~ x_1, data = train_set)
y_hat <- predict(fit, newdata = test_set)
sqrt(mean((y_hat-test_set$y)^2))

fit <- lm(y ~ x_2, data = train_set)
y_hat <- predict(fit, newdata = test_set)
sqrt(mean((y_hat-test_set$y)^2))

fit <- lm(y ~ x_1 + x_2, data = train_set)
y_hat <- predict(fit, newdata = test_set)
sqrt(mean((y_hat-test_set$y)^2))

