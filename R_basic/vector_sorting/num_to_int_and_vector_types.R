#make numeric to integer
a<-1
class(a)
b<-1L
class(b)

#vector  is numeric vector
c <- c(10,20,a)
class(c)
#make c to char an put in d
d <- as.character(c)
class(d)

#make d to num vector again
e <- as.numeric(d)
class(e)