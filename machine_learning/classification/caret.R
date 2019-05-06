#Use the rpart function to fit a classification tree to the 
#tissue_gene_expression dataset.

#Use the train function to estimate the accuracy.
#Try out cp values of seq(0, 0.1, 0.01)
#Plot the accuracies to report the results of the best model. 
#Which value of cp gives the highest accuracy

library(caret)
library(dslabs)
library(rpart)

#set.seed(1991)
#data("tissue_gene_expression")

#fit <- with(tissue_gene_expression, train(x, y, method = "rpart",
#            tuneGrid = data.frame(cp = seq(0,0.1,0.01))))
#ggplot(fit)

#Note that there are only 6 placentas in the dataset
#By default, rpart requires 20 observations before splitting a node
#allow rpart to split any node by using the argument control 
#= rpart.control(minsplit = 0)
#Look at the confusion matrix again to determine whether the accuracy increases
set.seed(1991)
data("tissue_gene_expression")
fit_rpart <- with(tissue_gene_expression,
                  train(x, y, method ="rpart",
                        tuneGrid = data.frame(cp = seq(0,0.1,0.01)),
                        control = rpart.control(minsplit = 0)))
ggplot(fit_rpart)

#What is the accuracy
confusionMatrix(fit_rpart)

#Which gene is at the first split
plot(fit_rpart$finalModel)
text(fit_rpart$finalModel)

#Use the train function and the rf method to train a Random Forest
#Try out values of mtry ranging from seq(50, 200, 25)
#use the following argument: nodesize = 1
#What value of mtry maximizes accuracy

#set.seed(1991)
#library(randomForest)
#fit <- with(tissue_gene_expression,
#            train(x, y, method = "rf",
#                  nodesize = 1,
#                  tuneGrid = data.frame(mtry = seq(50, 200, 25))))
#ggplot(fit)

#imp <- varimp(fit)

#The rpart model we ran above produced a tree that used just seven predictors
#Extracting the predictor names is not straightforward, but can be done
#If the output of the call to train was fit_rpart, we can extract the names like this:

#tree_terms <- as.character(unique(fit_rpart$finalModel$frame$var[!(fit_rpart$finalModel$frame$var == "<leaf>")]))
#tree_terms

#find rank and importance
#data_frame(term = rownames(imp$importance), 
#           importance = imp$importance$Overall) %>%
#  mutate(rank = rank(-importance)) %>% arrange(desc(importance)) %>%
#  filter(term %in% tree_terms)


