#is %in% to find is these data are in the dataframe

#We have 4 abbreviations now
abbs <- c("AK","MI","IA","BKK")

#check that are they all in this data sit or not
abbs %in% murders$abb

#Which are fake dude?
ind <- which(!abbs %in% murders$abb)
#the state that is not include in data set
abbs[ind]