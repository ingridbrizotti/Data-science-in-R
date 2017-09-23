
# load the dataset airquality
data("airquality")

# split train(70%) and test(30%)
set.seed(312) # this seed number allows you to reproduce the sample later on
rn_train <- sample(nrow(airquality),floor(nrow(airquality)*0.7))
train <- airquality[rn_train,]
test <- airquality[-rn_train,]

summary(train)

# fit a linear regression trying to predictthe wind using the rest of the variables
model1 <- lm(Wind ~ Solar.R + Ozone + Temp, data=train) 

# check the model parameters
summary(model1)

# Ozone is the most relevant variable

# Let's apply the prediction on the test set
prediction <- predict(model1, interval="prediction", newdata=test)

# Calculate the error
errors <- prediction[,"fit"]-test$Wind
hist(errors)

# Calculate teh RMSE (root mean square error)
sqrt(sum((errors)^2/nrow(test),na.rm=TRUE))


# Let's calculate a percentage of predictions with a most 25% error rate
rel_change <- 1 - ((test$Wind - abs(errors))/test$Wind)
table(rel_change<0.25)["TRUE"]/nrow(test)
