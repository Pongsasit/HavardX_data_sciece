library(dslabs)
data("na_example")

#index the na from data
index <- is.na(na_example)
index

amount_of_na <- sum(index)

ok_index <- !is.na(na_example)
ok_index

amount_of_ok <- sum(ok_index)


amount_of_na
amount_of_ok

mean(na_example)