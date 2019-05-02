#Define function
compute_s_n <-function(n){
  x <- 1:n
  sum(x^2)
  
}

#creat for loop

#vector of n
n <- 1:25
s_n <- vector("numeric", 25)

#for loop to compute s_n
for(i in n){
  s_n[i] <- compute_s_n(i)
}

#creat the plot to check
plot(n,s_n)

#use identical to check
identical(s_n,n*(n+1)*(2*n+1)/6)