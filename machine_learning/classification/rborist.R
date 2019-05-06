library(randomForest)
library(dplyr)
library(ggplot2)
n <- 1000
sigma <- 0.25
set.seed(1)
x <- rnorm(n, 0, 1)
y <- 0.75 * x + rnorm(n, 0, sigma)
dat <- data.frame(x = x, y = y)

#fit <- randomForest(y~ x, data = dat,nodesize = 50, maxnodes = 25)
#dat %>%
#  mutate(y_hat = predict(fit)) %>%
#  ggplot() +
#  geom_point(aes(x, y)) +
#  geom_step(aes(x, y_hat),col = 2)
#Which value minimizes the estimated RMSE
#we can't tune the maxnodes parameter or the nodesize argument with randomForests
#we will use the __Rborist__ package and tune the minNode argument.
set.seed(1)
library(caret)
fit <- train(y ~.,method = "Rborist",
             tuneGrid = data.frame(predFixed = 1,minNode = seq(25,100,25)),
             data = dat)
#ggplot(fit)


#library(caret)
dat %>% 
  mutate(y_hat = predict(fit)) %>% 
  ggplot() +
  geom_point(aes(x, y)) +
  geom_step(aes(x,y_hat),col=2)

