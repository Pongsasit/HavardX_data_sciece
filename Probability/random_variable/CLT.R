#American Roulette probability of winning money
p_green <- 2 / 38
p_not_green <- 1-p_green

#number of bets is n
n <- 100
#expected outcomes when win(on green) get 17$, lose(not on green) pay 1$, store in avg
avg <- n*(17*p_green - 1*p_not_green)
avg
#standard error of the sum of n outcomes store in se
se <- sqrt(n)*(17- -1)*sqrt(p_green*p_not_green)
se
#compute the probability that you win money betting on green 100 times
1 - pnorm(0,avg,se)

#Create an object called `S` that replicates the sample code 
#for `B` iterations and sums the outcomes.
B <- 10000
set.seed(1)

S <- replicate(B,{
  X <- sample(c(17,-1),size = n, replace = TRUE,prob =c(p_green,p_not_green))
  sum(X)
})

mean(S)
sd(S)
#calculate the probability of winning money from the Monte Carlo simulation
mean(S>0)

#X contains the outcomes of `n` bets
n <- 10000
X <- sample(c(17,-1),size = n, replace = TRUE,prob =c(p_green,p_not_green))
# mean outcome per bet
Y <- mean(X)
Y
#Calculate the expected outcome of `Y`, 
#the mean outcome per bet in 10,000 bets
Y <- 17*p_green -1*p_not_green
Y

#What is the standard error of Y, the average result of 10,000 spins
abs(-1-17)*sqrt(p_green*p_not_green)/sqrt(10000)

#What is the probability that your winnings are positive 
#after betting on green 10,000 times?
avg <- 17*p_green -1*p_not_green
se <- 1/sqrt(10000)*(17- -1)*sqrt(p_green*p_not_green)
1-pnorm(0,avg,se)

#monte carlo
#10,000 bets on green.
#average outcomes of 10,000 bets model
S <- replicate(B,{
  X <- sample(c(17,-1),size = n, replace = TRUE,prob =c(p_green,p_not_green))
  mean(X)
})
mean(S)
sd(S)
# Compute the proportion of outcomes in the vector 'S' where you won more than $0
mean(S>0)

#The CLT works better when the sample size is larger