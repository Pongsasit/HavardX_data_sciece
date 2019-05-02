#Life expectancy and the Vietnam War
library(dplyr)
library(dslabs)
data(gapminder)

#create a table called tab with data for the years 
#from 1960 to 2010 in Vietnam and the United States.

tab <- gapminder %>% filter(country %in% c("Vietnam","United States"), 
                            year %in% 1960:2010)


# plot life expectancy vs year for Vietnam and the United States
#Use color to distinguish the two countries.

p <- tab %>% ggplot(aes(year, life_expectancy,color = country)) +
  geom_line()

#Life expectancy in Cambodia

q <- gapminder %>% filter(country == "Cambodia", year %in% 1960:2010) %>%
  ggplot(aes(year, life_expectancy, color = country ))+
  geom_line()
q