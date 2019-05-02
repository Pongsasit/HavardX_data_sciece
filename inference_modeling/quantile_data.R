#Vector lengths

library(dslabs)
data(heights)
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]

length(male)

length(female)

#Percentiles

#Create two five row vectors showing 
#the 10th, 30th, 50th, 70th, and 90th 
#percentiles for the heights of each sex

female_percentiles <- quantile(female,seq(0.1,0.9,0.2))
male_percentiles <- quantile(male,seq(0.1,0.9,0.2))

#Then create a data frame,The column names should be female and male
df <- data.frame("female"= female_percentiles,"male" = male_percentiles)
df