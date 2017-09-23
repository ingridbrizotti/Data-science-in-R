###   NEURAL NETWORK FOR CLASSIFICATION      

source("http://scg.sdsu.edu/wp-content/uploads/2013/09/dataprep.r")
train <- data$train

library(nnet)

 # fit a neural net
a = nnet(income~., data=data$train,size=20,maxit=10000,decay=.001)

# maxit: maximum number of iterations= 10,000
# size: there is no real set method of determining the number of nodes in the hidden layer. 
# A good rule of thumb is to set it between the number of input nodes and number of output nodes.
# I am using 20 here, because though we have only 14 input variables
# decay: is there to ensure that the model does not overtrain

# nnet is somewhat limited to a single hidden layer of nodes, but there is evidence that more layers
# are unnecessary. While they significantly increase complexity and calculation time, they may not
# provide a better model

# Confusion matrix
table(data$val$income,predict(a,newdata=data$val,type="class"))

# ROC curve
library(ROCR)

pred = prediction(predict(a,newdata=data$val,type="raw"),data$val$income)
perf = performance(pred,"tpr","fpr")
plot(perf,lwd=2,col="blue",main="ROC - Neural Network on Adult")
abline(a=0,b=1)

