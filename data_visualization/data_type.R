library(dslabs)
data(heights)
names(heights)
x <- heights$height

# how many unique values are used by the heights varialbe
unique(x)
#count the unique by using length
length(unique(x))

#make table
tab <- table(x)
#Use logicals and the function sum to count
sum(tab==1)
