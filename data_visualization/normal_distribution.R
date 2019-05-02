#proportion

library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
#proportion of the data is between 69 and 72 "inches "
exact <- mean(x>69 & x<=72)
y

#average of x
avg <- mean(x)
avg
#standard deviation
stdev <- sd(x)
stdev
#approximation of proportion of the data is between 69 and 72 inches using pnorm
approx <-pnorm(72,avg,stdev) - pnorm(69,avg,stdev)

#the approximation is not always useful.
#An example is for the more extreme values,
#often called the "tails" of the distribution.
#compare exact with approx
exact/approx


#estimate the proportion of adult men that are 7 "feet" tall or taller
avg_feet <- avg/12
stdev_feet <- stdev/12
p <- pnorm(7,avg_feet,stdev_feet)
round(p)
print(1-pnorm(7,avg_feet,stdev_feet))