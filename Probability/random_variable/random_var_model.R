#random variables ,sampling model

# The variables `green`, `black`, and `red` contain the number of pockets for each color
green <- 2
black <- 18
red <- 18

# Assign a variable `p_green` as the probability of the ball landing in a green pocket
p_green <- green/(green+black+red)
#probability for not green
p_not_green <- 1-p_green

#American Roulette payout
set.seed(1)

#Create a model to predict the random variable X,Sample one time
X <- sample(c(1,-1),1,prob=c(p_green,p_not_green))

# Calculate the expected outcome if 
#you win $17 if the ball lands on green 
#and you lose $1 if the ball doesn't land on green
17*p_green - 1*p_not_green

# Compute the standard error of the random variable
abs(-1-17)*sqrt(p_green*p_not_green)

# Define the number of bets using the variable 'n'
n <- 1000

# Create a vector called 'X' that contains the outcomes of 1000 samples
X <- sample(c(17,-1),n,replace=TRUE,prob=c(p_green,p_not_green))
#sum of all 1000 outcomes to the variable
S <- sum(X)
S

#Calculate the expected outcome of 1,000
(17*p_green - 1*p_not_green)*n

#Compute the standard error of the sum of 1,000 outcomes
sqrt(n)*abs(-1-17)*sqrt(p_green*p_not_green)