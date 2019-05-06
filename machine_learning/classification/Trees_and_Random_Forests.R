#Trees and Random Forests

#simple dataset where the outcome grows 0.75 units on average 
#for every increase in a predictor
library(dplyr)
library(ggplot2)
library(rpart)
n <- 1000
sigma <- 0.25
set.seed(1)
x <- rnorm(n, 0, 1)
y <- 0.75 * x + rnorm(n, 0, sigma)
dat <- data.frame(x = x, y = y)

#fit the regression tree
fit <- rpart(y ~ ., data =dat)

#show the tree
plot(fit)
text(fit)

#make a scatter plot of y versus x
#along with the predicted values based on the fit
dat %>%
  mutate(y_hat = predict(fit)) %>%
  ggplot() +
  geom_point(aes(x,y)) +
  geom_step(aes(x,y_hat),col = 2)

#RUN random forest instead of regression tree
library(randomForest)
fit <- randomForest(y ~., data = dat)
dat %>%
  mutate(y_hat = predict(fit)) %>%
  ggplot() +
  geom_point(aes(x,y)) +
  geom_step(aes(x,y_hat),col = 2)
plot(fit)

#Re-run the Random Forest, node size of 50 and a maximum of 25 nodes
fit <- randomForest(y~ x, data = dat,nodesize = 50, maxnodes = 25)
dat %>%
  mutate(y_hat = predict(fit)) %>%
  ggplot() +
  geom_point(aes(x, y)) +
  geom_step(aes(x, y_hat),col = 2)
  