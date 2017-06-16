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
