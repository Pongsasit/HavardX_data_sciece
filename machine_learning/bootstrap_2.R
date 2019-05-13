#Generate a random dataset
y <- rnorm(100, 0, 1)

#Estimate the 75th quantile, which we know is qnorm(0.75),
#with the sample quantile: quantile(y, 0.75)

#Set the seed to 1 and perform a Monte Carlo simulation with 10,000 repetitions,
#generating the random dataset and estimating the 75th quantile each time.

#What is the expected value and standard error of the 75th quantile

set.seed(1)
B <- 10000
q_75 <- replicate(B, {
  y <- rnorm(100,0,1)
  quantile(y, 0.75)
})
#expected value
mean(q_75)
#standard error
sd(q_75)

#-----In practice, we can't run a Monte Carlo simulation. ----#
set.seed(1)
y <- rnorm(100, 0, 1)
#10 bootstrap samples and calculate the expected value and standard error:
set.seed(1)
indexes <- createResample(y,10)
q_75_star <- sapply(indexes , function(ind){
  y_star <- y[ind]
  quantile(y_star, 0.75)
})
mean(q_75_star)
sd(q_75_star)

#10,000 bootstrap samples instead of 10
set.seed(1)
indexes <- createResample(y, 10000)
q_75_star <- sapply(indexes,function(ind){
  y_star <- y[ind]
  quantile(y_star, 0.75)
})
mean(q_75_star)
sd(q_75_star)

#sd value roughly the same