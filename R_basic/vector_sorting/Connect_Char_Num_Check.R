#Connecting Numeric and Character

cost <- c(50,60,70,80)
cost
flower <- c("Rose","Lotus","Tulip","Sunflower")
flower

#connect
names(cost) <- flower

#check list
cost[0:4]
#or
cost[c(2,3)]