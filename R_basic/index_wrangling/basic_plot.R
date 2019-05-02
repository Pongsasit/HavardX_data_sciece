#Basic plot
library(dslabs)
data(murders)

population_in_million <- murders$population / 1000000
total_murders <- murders$total

#plot(population_in_million,total_murders)

#Histogram
#hist(population_in_million)

#Use log base 10 to transform and plot
log10_population <- log10(murders$population)
log10_total_murders <- log10(murders$total)

#plot(log10_population,log10_total_murders)

#boxplot of state populations by region for murders dataset
boxplot(population ~ region, data = murders)
