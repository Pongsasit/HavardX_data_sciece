library(dplyr)
library(ggplot2)
library(dslabs)
data(us_contagious_diseases)
#head(us_contagious_diseases)

dat <- us_contagious_diseases %>%
  filter(year == 1967 & disease=="Measles" & !is.na(population)) %>% 
  mutate(rate = count / population * 10000 * 52 / weeks_reporting)

state <- dat$state 
rate <- dat$count/(dat$population/10000)*(52/dat$weeks_reporting)

#Redefine the state object so that the levels are re-ordered by rate.
state <- reorder(state,rate)

#Print the new object state and its levels 
#so you can see that the vector is now re-ordered by the levels.
print(state)
print(levels(state))

#redefining
#reorder the states by the rate variable.
dat <- dat %>% mutate(state=reorder(state,rate))

#create a bar plot using the newly defined dat
dat %>% ggplot(aes(state, rate)) + geom_bar(stat="identity") + coord_flip()