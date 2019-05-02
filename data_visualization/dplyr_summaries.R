#National Center for Health Statistics
library(NHANES)
data(NHANES)

#Lot of data have NA that can not calculate like this
library(dslabs)
data(na_example)
mean(na_example)
sd(na_example)

#To ignore the NAs, we can use the na.rm argument
mean(na_example, na.rm = TRUE)
sd(na_example, na.rm = TRUE)


#Filter the NHANES dataset so that only 
#20-29 year old females are included and assign 
#this new data frame to the object tab
tab <- NHANES %>% filter(AgeDecade == " 20-29", Gender =="female")
tab

#save the average and standard deviation of systolic blood pressure 
# of 20-29 year old females
#as average and standard_deviation to a variable called ref

ref <- NHANES %>% filter(AgeDecade == " 20-29", Gender =="female") %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            stdev = sd(BPSysAve, na.rm = TRUE))

#Summarizing averages
ref_avg <- NHANES %>% filter(AgeDecade ==" 20-29", Gender == "female") %>%
  summarize(average = mean(BPSysAve, na.rm =TRUE)) %>%
  .$average

#Min and Max systolic blood pressure(BPSysAve) as min and max
min_max <- NHANES %>% filter(AgeDecade == " 20-29", Gender =="female") %>%
  summarize(min=min(BPSysAve, na.rm = TRUE),
            max=max(BPSysAve, na.rm = TRUE))

#group_by,  groups are contained in AgeDecade
#save the average and standard deviation of systolic blood pressure(BPSysAve) 
#as average and standard_deviation

groupby <- NHANES %>% filter(Gender == "female") %>% 
  group_by(AgeDecade) %>%
  summarize(average = mean(BPSysAve, na.rm = TRUE),
            stdev = sd(BPSysAve, na.rm = TRUE))

#group by 2
groupby_2 <- NHANES %>% group_by(AgeDecade, Gender) %>% 
  summarize(average = mean(BPSysAve,na.rm = TRUE),
            stdev = sd(BPSysAve, na.rm = TRUE))

#Arrange
arrrange_1 <- NHANES %>% 
                filter(Gender == "male", AgeDecade == " 40-49") %>%
                group_by(Race1) %>%
                summarize(average = mean(BPSysAve, na.rm = TRUE), 
                          standard_deviation = sd(BPSysAve,na.rm =TRUE)) %>%
                arrange(average)




  