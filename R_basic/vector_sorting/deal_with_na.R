library(dslabs)
data(na_example)

ind <- is.na(na_example)

mean(na_example[ind])
mean(na_example[!ind])