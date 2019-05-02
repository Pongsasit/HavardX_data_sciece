#Galton Dataset
library(HistData)
data(Galton)
x <- Galton$child

#Average and Median
mean(x)
median(x)

#SD(standard deviation) and MAD(median absolute deviation)
sd(x)
mad(x)

# suppose Galton made a mistake when entering the first value
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
#上はミスを持つようにデ－タを作る

# how many inches the average grow after this mistake. 
mean(x_with_error)-mean(x)

# how many inches the standard deviation grow after this mistake.
sd(x_with_error)-sd(x)

# how many inches the median grow after this mistake.
median(x_with_error) - median(x)

# how many inches the MAD(median absolute deviation) grow after this mistake.
mad(x) - mad(x_with_error)


#how outliers can affect the average of a dataset, 
#let's write a simple function that takes the size of the outlier 
#as input and returns the average
error_avg <- function(k){
  x[1] = k
  return (mean(x))
}

error_avg(1000)
error_avg(-1000)
error_avg(x[1])