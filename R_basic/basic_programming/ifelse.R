#if the entry is 30 it return NA, otherwise it return the entry
x <- c(0.1,0.2,0.3,0.5,30)
ifelse( x== 30, NA, x)


#in murders data
#if the entry char_len is more than 8 it return abb, otherwise it return the entry

library(dslabs)
data("murders")

char_len <- nchar(murders$state)
new_names <- ifelse(char_len > 8,murders$abb,murders$state)
new_names