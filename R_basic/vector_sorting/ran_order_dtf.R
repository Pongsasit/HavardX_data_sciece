library(dslabs)
data("murders")


pop <- murders$population
order_pop <- order(pop)
states <- murders$state
ranking <- rank(pop)


data_frame <- data.frame(name = states[order_pop], ranks = ranking[order_pop])
data_frame