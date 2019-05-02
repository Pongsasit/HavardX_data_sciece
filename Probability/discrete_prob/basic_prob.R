#basic

cyan <- 3
magenta <- 5
yellow <- 7

# probability of choosing a cyan ball from the box
p <- cyan/(cyan + magenta + yellow)

#probability of choosing ball that is not cyan from the box
1-p

#probability of choosing a cyan ball from the box on the first draw
p_1 <- cyan / (cyan + magenta + yellow)

#probability of not choosing a cyan ball on the second draw without replacement.
p_2 <- (magenta + yellow) / (cyan + magenta + yellow -1)

#first draw is cyan and the second draw is not cyan
p_1_2 <- p_1*p_2

#probability of not choosing a cyan ball on the second draw with replacement.
p_2_r <- 1- p_1

#probability that the first draw is cyan and the second draw is not cyan 
#using `p_1` and `p_2_r`
p_1_2_r <- p_1*p_2_r

