library(rpart)
library(randomForest)

fit <- randomForest(Kyphosis ~ Age + Number + Start,   data=kyphosis)

# view results 
print(fit) 

# importance of each predictor
importance(fit)

# or a plot to check the relevance
varImpPlot(fit)


