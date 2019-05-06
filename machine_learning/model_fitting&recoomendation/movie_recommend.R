#recommendation system
#matrix factorization =~ neural net perceptron!
library(ggplot2)
library(dslabs)
library(lubridate)
data("movielens")
head(movielens)
#year that has highest median number of ratings
movielens %>% group_by(movieId) %>%
  summarize(n=n(), year = as.character(first(year))) %>%
  qplot(year, n, data = ., geom ="boxplot") +
  coord_trans(y="sqrt") +
  theme(axis.text.x = element_text(angle = 90, hjust =1))
#Among movies that came out in 1993 or later, 
#what are the 25 movies with the most ratings per year
#average rating of each of the top 25 movies
movielens %>% 
  filter(year >= 1993) %>%
  group_by(movieId) %>%
  summarize(n = n(), years = 2018 - first(year),
            title = title[1],
            rating = mean(rating)) %>%
  mutate(rate = n/years) %>%
  top_n(25, rate) %>%
  arrange(desc(rate)) 

#Make a plot of average rating versus ratings per year
movielens %>%
  filter(year >= 1993) %>%
  group_by(movieId) %>%
  summarize(n=n(), years = 2017 - first(year),
            title = title[1],
            rating = mean(rating)) %>%
  mutate(rate = n/years) %>%
  ggplot(aes(rate, rating)) +
  geom_point() +
  geom_smooth()
#the more often a movie is rated, the higher its average rating.

#Create a new column date with the date.
movielens <- mutate(movielens,date = as_datetime(timestamp))

#Compute the average rating for each week and plot this average against day.
movielens %>% mutate(date = round_date(date, unit = "week")) %>%
  group_by(date) %>%
  summarize(rating = mean(rating)) %>%
  ggplot(aes(date, rating)) +
  geom_point() +
  geom_smooth()
#There is some evidence of a time effect on average rating.

#Which genre has the lowest average rating
movielens %>% group_by(genres) %>%
  summarize(n = n(), avg = mean(rating), se = sd(rating)/sqrt(n())) %>%
  filter(n >= 1000) %>% 
  mutate(genres = reorder(genres, avg)) %>%
  ggplot(aes(x = genres, y = avg, ymin = avg - 2*se, ymax = avg + 2*se)) + 
  geom_point() +
  geom_errorbar() + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
