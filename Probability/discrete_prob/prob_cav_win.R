#seven game championship series.
#The first to win four games wins the series.
#each team have a 50-50 chance of winning each game.

#If the Cavs lose the first game, what is the probability that they win the series?

#number of remaining game
n <- 6

#outcome ,0=loss,1=win for CAV
outcomes <- c(0,1)

#use function rep and list to creat list that replicate n times
l <- rep(list(outcomes),n)

#creat data frame named"possibilities" contain all possible outcomes
possibilities <- expand.grid(l)

#if Cav win this season, Cav must have 4 wins, all wins the season will stored in results
results <- rowSums(possibilities)>=4

#proportion of 'results' in which the Cavs win the series.
mean(results)