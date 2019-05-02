library(dplyr)
library(dslabs)
data(gapminder)

#Use mutate to create a dollars_per_day variable, 
#which is defined as gdp/population/365
#Create the dollars_per_day variable for African countries for the year 2010.
#Remove any NA values.
#Save the mutated dataset as daydollars

daydollars <- gapminder %>% mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa", year == 2010, !is.na(dollars_per_day))

#calculate and plot dollars per day for African countries in 2010 using GDP data
#The dataset including the dollars_per_day variable is preloaded as daydollars
#Create a smooth density plot of dollars per day from daydollars
#Use a log (base 2) scale for the x axis.

plot <- daydollars %>% ggplot(aes(dollars_per_day)) + 
  geom_density() +
  scale_x_continuous(trans = "log2")

#Dollars per day - multiple density plots
daydollars_2 <- gapminder %>% mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa", year %in% c("1970","2010"), !is.na(dollars_per_day))
#Use facet_grid to show a different density plot for 1970 and 2010.
plot_2 <- daydollars_2 %>% ggplot(aes(dollars_per_day)) + 
  geom_density() +
  scale_x_continuous(trans = "log2") +
  facet_grid(c("1970","2010"))

#stacked histograms
#Use the fill and position arguments 
#where appropriate to create the stacked histograms of each region.
#densities are smooth by using bw = 0.5
plot_his <- daydollars_2 %>% ggplot(aes(dollars_per_day, fill = region)) + 
  geom_density(position="stack", bw=0.5) +
  scale_x_continuous(trans = "log2") +
  facet_grid(c("1970","2010"))
plot_his