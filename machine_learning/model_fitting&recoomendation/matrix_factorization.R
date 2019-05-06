#Matrix Factorization
#singular value decomposition svd

#construct a dataset that represents grade scores for 
#100 students in 24 different subjects
#0 =c ,1 25 = A+, -25 = F
set.seed(1987)
n <- 100
k <- 8
Sigma <- 64 * matrix(c(1,.75,.5,.75,1,.5,.5,.5,1),3,3)
m <- MASS::mvrnorm(n, rep(0, 3), Sigma)
m <- m[order(rowMeans(m),decreasing = TRUE),]
y <- m %x% matrix(rep(1,k), nrow =1) + matrix(rnorm(matrix(n*k*3)), n,k*3)
colnames(y) <- c(paste(rep("Math",k), 1:k,sep = "_"),
                 paste(rep("Science",k), 1:k,sep= "_"),
                 paste(rep("Arts",k),1:k, sep= "_"))
# visualize the 24 test scores for the 100 students 
my_image <- function(x, zlim = range(x), ...){
  colors = rev(RColorBrewer::brewer.pal(9, "RdBu"))
  cols <- 1:ncol(x)
  rows <- 1:nrow(x)
  image(cols, rows, t(x[rev(rows),,drop=FALSE]), xaxt = "n", yaxt = "n",
        xlab="", ylab="",  col = colors, zlim = zlim, ...)
  abline(h=rows + 0.5, v = cols + 0.5)
  axis(side = 1, cols, colnames(x), las = 2)
}

my_image(y)

#correlation between the test scores directly
my_image(cor(y), zlim = c(-1,1))
range(cor(y))
axis(side = 2, 1:ncol(y), rev(colnames(y)), las = 2)
#Use the function svd to compute the SVD of y
s <- svd(y)
names(s)

#Check svd work or not
y_svd <- s$u %*% diag(s$d) %*% t(s$v)
max(abs(y - y_svd))
