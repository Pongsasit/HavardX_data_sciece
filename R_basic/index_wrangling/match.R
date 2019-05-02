#Matching 
abbs <- c("AK","MI","IA")

#Match the abbs to murders$abb
ind <- match(abbs,murders$abb)

#Which states are match
murders$state[ind]