library(dslabs)
data("murders")

rate <- murders$total/murders$population *1000
low_rate <- rate<1

#show states that have low in abb
murders$abb[low_rate]

#show the low rate index
which(low_rate)