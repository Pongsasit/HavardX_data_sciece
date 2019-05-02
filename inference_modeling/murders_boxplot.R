#making box plot
library(dplyr)
library(ggplot2)
library(dslabs)
data("murders")

#Make a box plot of the murder rates by region.
#Order the regions by their median murder rate.
#Show all of the points on the box plot.

murders %>% mutate(rate = total/population*100000) %>%
  mutate(region=reorder(region,rate,FUN=median)) %>%
  ggplot(aes(region,rate)) +
  geom_boxplot() +
  geom_point()