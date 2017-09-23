library(ggplot2)
library(ROCR)

# use the data below to perform a logistic regression
mydata <- read.csv("http://www.ats.ucla.edu/stat/data/binary.csv")
head(mydata)
summary(mydata)

# split the data
set.seed(65)
rn_train <- sample(nrow(mydata), floor(nrow(mydata)*0.7))
train <- mydata [rn_train,]
test <- mydata [-rn_train,]

# fit a logistic regression
model1 <- glm(formula = (admit)  ~  gre + gpa + rank,
              family=binomial(logit), data=train) 

# check the model
summary(model1)


# apply the model on the test set and check performance
p1 <- predict(model1, test, type="response")
pr1 <- prediction(p1, test$admit)
prf1 <- performance(pr1, measure = "tpr", x.measure = "fpr")
plot(prf1) 

# Area Under the Curve
auc1 <- performance(pr1, measure = "auc")
auc1 <- auc1@y.values[[1]]
auc1

# KS
max(attr(prf1,'y.values')[[1]]-attr(prf1,'x.values')[[1]])
