library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)
head(gapminder)

#Using ggplot and the points layer, 
#create a scatter plot of life expectancy versus fertility 
#for the African continent in 2012.
#coloring your plot
plot1 <- gapminder %>% filter(continent =="Africa", year == "2012") %>%
  ggplot(aes(life_expectancy, fertility,color = region)) +
  geom_point()

#Create a table showing the country and region 
#African countries,in 2012,fertility rates of 3 or less
#life expectancies of at least 70, data frame called df

df <- gapminder %>% filter(continent =="Africa", year =="2012",
                           fertility <= 3,life_expectancy > 70) %>%
  select(country, region)
