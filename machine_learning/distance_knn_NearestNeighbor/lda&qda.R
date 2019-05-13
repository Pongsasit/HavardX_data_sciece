#generative model
#Create a dataset of samples from just cerebellum and hippocampus, 
#two parts of the brain, and a predictor matrix with 10 randomly selected 

library(dslabs)
library(caret)
data("tissue_gene_expression")

set.seed(1993)
ind <- which(tissue_gene_expression$y %in% c("cerebellum", "hippocampus"))
y <- droplevels(tissue_gene_expression$y[ind])
x <- tissue_gene_expression$x[ind, ]
x <- x[, sample(ncol(x), 10)]

#Use the train function to estimate the accuracy of LDA. 
#For this question, use the entire tissue_gene_expression dataset:
#What is the accuracy
fit_lda <- train(x,y,method="lda")
fit_lda$results["Accuracy"]

#Which TWO genes appear to be driving the algorithm
#Look at the fitted model by looking at the finalModel 
#component of the result of train
# there is a component called means 
#that includes the estimated means of both distributions
#Plot the mean vectors against each other and determine which predictors (genes) 
#appear to be driving the algorithm
t(fit_lda$finalModel$means) %>% data.frame() %>%
  mutate(predictor_name =rownames(.)) %>%
  ggplot(aes(cerebellum,hippocampus,label = predictor_name)) +
  geom_point() +
  geom_text() +
  geom_abline()

#Repeat the exercise with QDA
set.seed(1993)
ind <- which(tissue_gene_expression$y %in% c("cerebellum", "hippocampus"))
y <- droplevels(tissue_gene_expression$y[ind])
x <- tissue_gene_expression$x[ind, ]
x <- x[, sample(ncol(x), 10)]
fit_qda <- train(x,y,method = "qda")
#What is the accuracy
fit_qda$results["Accuracy"]
#Which TWO genes drive the algorithm when using QDA
t(fit_qda$finalModel$means) %>% data.frame() %>%
  mutate(predictor_name = rownames(.)) %>%
  ggplot(aes(cerebellum,hippocampus,label = predictor_name)) +
  geom_point() +
  geom_text() +
  geom_abline()

#Re-run LDA with preProcess = "center"
#Which TWO genes drive the algorithm after performing the scaling
fit_lda <- train(x,y,method="lda",preProcess ="center" )
fit_lda$results["Accuracy"]
t(fit_lda$finalModel$means) %>% data.frame() %>%
  mutate(predictor_name = rownames(.)) %>%
  ggplot(aes(predictor_name, hippocampus,label = predictor_name)) +
  geom_point() +
  geom_text() +
  coord_flip() 

#plot the predictor values for the two genes 
#with the largest differences between the two groups in a scatter plot 
#to see how they appear to follow a bivariate distribution as assumed 
#by the LDA and QDA approaches, coloring the points by the outcome
d <- apply(fit_lda$finalModel$means, 2, diff)
ind <- order(abs(d), decreasing = TRUE)[1:2]
plot(x[, ind], col = y)


set.seed(1993)
y <- tissue_gene_expression$y
x <- tissue_gene_expression$x
x <- x[, sample(ncol(x), 10)]
fit_lda <- train(x,y,method="lda",preProcess ="center" )
fit_lda$results["Accuracy"]
  