#Defining function 
sum_n <- function(n){
  m <- 1:n
  sum(m)
}

#Use function
sum_n(100)

#define altman function
altman_plot <- function(x,y){
  plot(x+y,x-y)
}
#use altman
altman_plot(10,3)

