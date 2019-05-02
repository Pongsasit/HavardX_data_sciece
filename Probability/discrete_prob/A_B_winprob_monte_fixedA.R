# A wins fixed at p <- 0.75
#compute the probability for different series lengths
#wins in best of 1 game, 3 games, 5 games, and so on through 
#a series that lasts 25 games

# prob B will win using Monte Carlo
prob_win <- function(N, p=0.75){
  B <- 10000
  result <- replicate(B,{
    b_win <- sample(c(1,0),N,replace=TRUE, prob= c(1-p , p))
    sum(b_win)>= (N+1)/2
    })
  mean(result)
}

#'N' as the vector of series lengths from 1 to 25
N <- seq(1,25,2)

#series lengths(N) to determine the probability that team B will win (prob_win). 
#Call this object 'Pr'
Pr <- sapply(N,prob_win)

plot(N,Pr)
