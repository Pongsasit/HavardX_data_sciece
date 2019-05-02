#Two teams, A and B, are playing a seven series game series. 
#Team A is better than team B and has chance of winning each game more than 0.5

#p is probability that team A will win 
p <- seq(0.5,0.95,0.025)
#start,stop,step

# The probability that B will win this serie using Monte Carlo Simulation
# related to A
prob_win <- function(p){
  B <- 10000
  result <- replicate(B,{
    b_win <- sample(c(1,0),7,replace=TRUE,prob =c(1-p,p))
    sum(b_win)>=4
  })
  mean(result)
  
}

#team A will win (p) to determine the probability that team B will win (prob_win). 
#Call this object 'Pr'
Pr <- sapply(p,prob_win)

#plot the probability 'p' on the x-axis and 'Pr' on the y-axis.

plot(p,Pr)