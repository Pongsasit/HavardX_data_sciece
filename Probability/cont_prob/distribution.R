#Distribution of female heights

#in inch unit
female_avg <- 64
female_sd <- 3

#calculate the probability that a randomly selected female is shorter than 5 feet
#5 feet =50*12 inch
pnorm(5*12,female_avg,female_sd)

#calculate the probability that a randomly selected female is 6 feet or taller
1 - pnorm(6*12,female_avg,female_sd)

#calculate the probability that a randomly selected female is 
#between the desired height range (61 to 67)
pnorm(67,female_avg,female_sd) - pnorm(61,female_avg,female_sd)

#Probability of 1 SD from average
# sd =3 so,taller =64+3,shorter=64-3
pnorm(67,female_avg,female_sd) - pnorm(61,female_avg,female_sd)

#Determine the height of a woman in the 99th percentile of the distribution
qnorm(0.99,female_avg,female_sd)