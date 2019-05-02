#vectorized Operation

town <- c("BKK","TKY","NY")

#kelvin
temperature <- c(303,304,305)
#to celsius
temperature <- temperature -273.15

town_temp <- data.frame(name = town , temp =temperature)
town_temp


#OR

a <- seq(1,100)
sum(a)
sum(1+a/2)