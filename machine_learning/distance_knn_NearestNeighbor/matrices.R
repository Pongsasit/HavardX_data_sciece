

#creates a 100 by 10 matrix of randomly generated normal numbers and assigns it to x
x <- matrix(rnorm(100*10), 100, 10)

#Dimension of x
dim(x)
#Number of rows of x
nrow(x)
#Number of columns of x
ncol(x)

#add the scalar 1 to row 1, the scalar 2 to row 2, and so on, for the matrix x,y
x <- matrix(rnorm(100*10), 100, 10)
x <- x + seq(nrow(x))

y <- matrix(rnorm(100*10), 100, 10)
y <- sweep(y, 1, 1:nrow(y),"+")


#add the scalar 1 to column 1, the scalar 2 to column 2, and so on, for the matrix x
x <- sweep(x, 2, 1:ncol(x), FUN = "+")

#computes the average of each row of x
rowMeans(x)

#computes the average of each column of x
colMeans(x)

#What proportion of pixels are in the grey area overall, 
#defined as values between 50 and 205

#library(ggplot2)
#library(dslabs)
#mnist <- read_mnist()
#y <- rowMeans(mnist$train$images>50 & mnist$train$images<205)
#qplot(as.factor(mnist$train$labels), y, geom = "boxplot")
#mean(y)

