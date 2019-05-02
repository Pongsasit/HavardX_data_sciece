library(dslabs)
data("murders")

populations <- murders$population

ranks <- rank(populations)
ranks

states <- murders$state

states_ranks <- data.frame(name = states, rank = ranks)
states_ranks