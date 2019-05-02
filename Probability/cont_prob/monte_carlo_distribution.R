#Distribution of IQ scores
#The average is 100 and the standard deviation is 15.
#person with the highest IQ in your school district --- max
#where 10,000 people are born each year.
#Generate 10,000 IQ scores 1,000 times using a Monte Carlo simulation.

avg <- 100
sd <- 15
people <- 10000
B <- 1000
set.seed(1)


highestIQ <- replicate(B,{
  simulated_data <- rnorm(people,avg,sd)
  max(simulated_data)
})

#Make a histogram of the highest IQ scores
hist(highestIQ)