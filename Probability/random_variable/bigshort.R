#Bank earning
set.seed(1)
#Say you manage a bank that gives out 10,000 loans. n=10000
#The default rate is 0.03 and you lose $200,000 in each foreclosure.

n <- 10000
loss_per_foreclosure <- -200000
p_default <- 0.03

#Create a random variable S that contains the earnings of your bank.

defaults <- sample(c(0,1),n,prob=c(1-p_default,p_default),replace=TRUE)

#calculate the total amount of money lost in S
S <- sum(defaults*loss_per_foreclosure)
S

#NOw use Monte Carlo simulation to check
#Run a Monte Carlo simulation with 10,000 outcomes for S, B=10000
B <-10000

S <- replicate(B,{
  defaults <- sample(c(0,1),n,prob=c(1-p_default,p_default),replace=TRUE)
  sum(defaults*loss_per_foreclosure)
})

#Make a histogram of the results.
hist(S)

#the expected value of S, the sum of losses over 10,000 loans? ==> expected loss
#assume a bank makes no money if the loan is paid. ==> *0
n*(p_default*loss_per_foreclosure + (1-p_default)*0)

#standard error of  S
#Compute the standard error of the sum of 10,000 loans
sqrt(n)*abs(loss_per_foreclosure)*sqrt(p_default*(1-p_default))

#Bank earnings interest rate - 1
#Assume we give out loans for $180,000. 
#. How much money do we need to make when people pay their loans 
#so that our net loss is $0

#If the amount of money lost or gained equals 0, 
#the probability of default times the total loss per default equals 
#the amount earned per probability of the loan being paid.
# loss * defaults_prob + paid_prob * amount needed per loan =0
x <- -loss_per_foreclosure*p_default / (1-p_default)
#we give out loans for $180,000, amount needed per loan/180,000 is interest rate
x/180000

#Bank earnings interest rate - 2
#Use the qnorm function to compute a continuous variable at given quantile 
#of the distribution to solve for z
z <- qnorm(0.05)

x <- -loss_per_foreclosure*(n*p_default-z*sqrt(n*p_default*(1-p_default)))/(n*(1-p_default)+z*sqrt(n*p_default*(1-p_default)))
x/180000