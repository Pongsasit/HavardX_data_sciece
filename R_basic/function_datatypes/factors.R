library(dslabs)
data(murders)

#factor
# We can see the class of the region variable using class
class(murders$region)

# Determine the number of regions included in this variable 
murders$region
levels(murders$region)
length(levels(murders$region))