library(dplyr)
#in dplyr have mutate,select,filter
library(ggplot2)
#for plot
library(dslabs)
#for data sets
data(murders)

p <- ggplot(murders)
class(p)

q <- murders %>% ggplot()
class(q)

#geom_point text
r <- murders %>% ggplot(aes(x= population, y=total)) +
  geom_point()
#r

#geom_point colors
s <- murders %>% ggplot(aes( total, population, label=abb)) +
  geom_point() +
  geom_label(color="blue")
#s

#geom_labels by region
t <- murders %>% ggplot(aes(total, population, label= abb,color =region))+
  geom_point() +
  geom_label() +
  geom_col()
#t

#log scale & Titles
u <- t + scale_x_log10() + scale_y_log10() + ggtitle("MURDERS")
u


