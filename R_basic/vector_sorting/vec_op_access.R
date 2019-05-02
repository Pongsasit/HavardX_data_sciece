#example with acessor

library(dslabs)
data(murders)

murder_total <- murders$total
murder_total

murder_population <- murders$population
murder_population

murder_rate <- murder_total/murder_population
murder_rate

mean(murder_rate)