#for loops
example_func <- function(n){
  x <- 1:n
  sum(x)
}

compute_s_n <-function(n){
  x <- 1:n
  sum(x^2)
  
}

#creat for loop
s_n <- vector("numeric", 10)
#for loop to compute s_n
n <- 10
for(i in 1:n){
  s_n[i] <- compute_s_n(i)
}
s_n
#plot(1:n,s_n)

x_n <- vector("numeric",10)
#for loop to compute x_n
n <- 10
for(i in 1:n){
  x_n[i] <- example_func(i)
}
x_n


#vectot("numeric",10) mean numeric vector that have 10 value packed inside