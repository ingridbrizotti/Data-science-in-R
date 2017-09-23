library(ggplot2)
library(rpart) #decision tree
library(ROCR)
library(RCurl)

# load data (from https://www.kaggle.com/ludobenistant/hr-analytics)
hr = read.csv("C:/Users/ingrid.brizotti/Downloads/HR_comma_sep.csv")

# Divide 70% to train and 30% to test
set.seed(4)
hr_train <- sample(nrow(hr), floor(nrow(hr)*0.7))
train <- hr[hr_train,]
test <- hr[-hr_train,]

# run the classification tree 
tree1 <- rpart(formula = left ~  satisfaction_level
               + last_evaluation
               + number_project
               + average_montly_hours
               + Work_accident
               + promotion_last_5years
               + salary,
               data = train,
               method = "class")

# plot tree
plot(tree1, uniform=TRUE, main="Classification Tree")
text(tree1, use.n=TRUE, all=TRUE, cex=.8)

# confusion matrix (training data)
conf_matrix_tree <- table(train$left, predict(tree1, type="class"))
rownames(conf_matrix_tree) <- paste("Actual", rownames(conf_matrix_tree), sep = ":")
colnames(conf_matrix_tree) <- paste("Pred", colnames(conf_matrix_tree), sep = ":")
print(conf_matrix_tree)

# On test set
test_tree = predict(tree1, test, type = "prob")

#Storing Model Performance Scores
pred_tree <-prediction(test_tree[,2], test$left)

# Calculating Area under Curve
perf_tree <- performance(pred_tree,"auc")
perf_tree

# Calculating True Positive and False Positive Rate
perf_tree <- performance(pred_tree, "tpr", "fpr")

# Plot the ROC curve
plot(perf_tree,  lwd = 1.5)

#Calculating KS statistics
ks1.tree <- max(attr(perf_tree, "y.values")[[1]] - (attr(perf_tree, "x.values")[[1]]))
ks1.tree
