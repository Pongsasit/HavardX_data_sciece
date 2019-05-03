#conditional probability

#We have a hypothetical population of 1 million individuals 
#The test is positive 85% of the time when tested on a patient with the disease 
#(high sensitivity): 0.85 P(test+|disease) = 0.85

#The test is negative 90% of the time when tested on a healthy patient 
#(high specificity): 0.90 P(test-|healthy) = 0.90

#The disease is prevalent in about 2% of the community: 
#P(disease) = 0.02

set.seed(1)
disease <- sample(c(0,1), size=1e6, replace=TRUE, prob=c(0.98,0.02))
test <- rep(NA, 1e6)
test[disease==0] <- sample(c(0,1), size=sum(disease==0), 
                           replace=TRUE, prob=c(0.90,0.10))
test[disease==1] <- sample(c(0,1), size=sum(disease==1), 
                           replace=TRUE, prob=c(0.15, 0.85))

#probability that a test is positive
mean(test)

#probability that an individual has the disease if the test is negative
mean(disease[test==0])

#probability that you have the disease if the test is positive
mean(disease[test==1]==1)

#If the test is positive, what is the relative risk of having the disease
mean(disease[test==1]==1)/mean(disease==1)
