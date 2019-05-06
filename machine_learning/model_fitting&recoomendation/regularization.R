library(dplyr)
library(ggplot2)
#simulated dataset for 100 school
set.seed(1986)
n <- round(2^rnorm(1000, 8, 1))
#true quality for each school that is completely independent from size.
set.seed(1)
mu <- round(80 + 2*rt(1000, 5))
range(mu)
schools <- data.frame(id = paste("PS",1:100),
                      size =n,
                      quality =mu,
                      rank =rank(-mu))
#see the top 10 schools
schools %>% top_n(10, quality) %>% arrange(desc(quality))

#simulate the test scores as normally distributed with the average 
#determined by the school quality with a standard deviation of 30 percentage points      
set.seed(1)
scores <- sapply(1:nrow(schools), function(i){
  scores <- rnorm(schools$size[i], schools$quality[i], 30)
  scores
})
schools <- schools %>% mutate(score = sapply(scores, mean))


#ID and average score of the 10th school
schools %>% top_n(10, score) %>% arrange(desc(score)) %>% select(id, size, score)

#median school size overall
median(schools$size)
#median school size of the top 10
schools %>% top_n(10, score) %>% .$size %>% median()

#median school size of the bottom 10 schools based on the score
#median(schools$size)
schools %>% top_n(-10, score) %>% .$size %>% median()

#Plot the average score versus school size to see what's going on
schools %>% ggplot(aes(size, score)) +
  geom_point(alpha = 0.5) +
  geom_point(data = filter(schools, rank <= 10), col =2)
#schools %>% top_n(10, score) %>% arrange(desc(score))
#define the overall average for all schools,
overall <- mean(sapply(scores, mean))
#estimates the score above the average for each school but dividining by n+alpha
#alpha=25
#TOP school with regularization
alpha <- 25
score_reg <- sapply(scores, function(x){
  overall + sum(x-overall)/(length(x)+alpha)
  })
#regularized score of the 10th school
schools %>% mutate(score_reg = score_reg) %>%
  top_n(10, score_reg) %>% arrange(desc(score_reg))

#What value of alpha gives the minimum RMSE?
alphas <- seq(10,250)
rmse <- sapply(alphas, function(alpha){
  score_reg <- sapply(scores, function(x){
    overall + sum(x-overall)/(length(x)+alpha)})
  mean((score_reg - schools$quality)^2)
  })
  
plot(alphas, rmse)
alphas[which.min(rmse)]

#Rank the schools based on the average obtained with the best alpha
# ID of top school
alpha <- 128
score_reg <- sapply(scores, function(x){
  overall + sum(x-overall)/(length(x)+alpha)
  })
schools %>% mutate(score_reg = score_reg) %>%
  top_n(10, score_reg) %>% arrange(desc(score_reg))

#if we don't subtract the overall average before shrinking,
#we actually obtain a very similar result.
alphas <- seq(10,250)
rmse <- sapply(alphas, function(alpha){
  score_reg <- sapply(scores, function(x){sum(x)/(length(x)+alpha)})
  mean((score_reg - schools$quality)^2)
})
plot(alphas, rmse)
alphas[which.min(rmse)]

