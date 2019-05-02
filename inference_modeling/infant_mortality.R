#Infant mortality scatter plot

library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)

#Generate dollars_per_day using mutate and 
#filter for the year 2010 for African countries.
#Remember to remove NA values.
#Store the mutated dataset in gapminder_Africa_2010

gapminder_Africa_2010 <- gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa",year == "2010",!is.na(dollars_per_day), !is.na(infant_mortality ))

#Make a scatter plot of infant_mortaility versus dollars_per_day 
#for regions in the African continent

p <- gapminder_Africa_2010 %>% ggplot(aes(infant_mortality,dollars_per_day,
                                          color =region)) +geom_point()


#logarithmic axis
#Transform the y axis to be in the log (base 2) scale.
q <- p + scale_y_continuous(trans="log2")

#Addind labels
#Add a layer to display country names instead of points.
r <- gapminder_Africa_2010 %>% ggplot(aes(infant_mortality,dollars_per_day,
                                          color =region, label = country)) +
  geom_text() + scale_y_continuous(trans="log2")

#comparison of scatter plots
gapminder %>%
  mutate(dollars_per_day = gdp/population/365) %>%
  filter(continent == "Africa",year %in% c("1970","2010"),!is.na(dollars_per_day), 
         !is.na(infant_mortality )) %>% 
  ggplot(aes(dollars_per_day,infant_mortality,
             color=region, label= country)) + geom_text() +
  scale_x_continuous(trans="log2") +
  facet_grid(year~.)
#facet_grid(year~.) はグラフを２つに分ける。