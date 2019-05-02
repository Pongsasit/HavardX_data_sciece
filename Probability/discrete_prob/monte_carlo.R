#monte carlo sim

#simulates four independent random games where the Celtics(team) either lose or win.
simulated_games <- sample(c("lose","win"), 4, replace = TRUE, prob = c(0.6, 0.4))

#run Monte carlo simulation 10,000 times
B <- 10000

# Use the `set.seed` function 
#to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `celtic_wins` 
# replicates two steps for B iterations:
# (1) using the sample code to generate a four-game series `simulated_games`,
# (2) determining whether the simulated series contains at least one win

celtic_wins <- replicate(B,{
  simulated_games <- sample(c("lose","win"),4,replace = TRUE,prob = c(0.6,0.4))
  any(simulated_games == "win")
})


mean(celtic_wins)
