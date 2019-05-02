library(dslabs)
data(murders)

# We (access) extract the population like this:
p <- murders$population
#show p
p
# using the square brackets
o <- murders[["population"]] 
#show o
o
# confirm these two are the same
identical(o, p)

