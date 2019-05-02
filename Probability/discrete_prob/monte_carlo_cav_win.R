B <- 10000
set.seed(1)

# `results` that replicates for `B` iterations a simulated series 
# and determines whether that series contains at least four wins for the Cavs.

results <- replicate(B,{
  simulated_games = sample(c(0,1),6,replace=TRUE)
  any(simulated_games == 1)
  sum(simulated_games) >= 4
})

mean(results)