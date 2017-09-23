# use pokemon data from Kaggle (https://www.kaggle.com/abcsds/pokemon)
mydata <- read.csv("C:/Users/ingrid.brizotti/Downloads/Pokemon.csv")
summary(mydata)

# In order to create the cluster, we can have missing data 
# Also, we can't have categorical variables need to be transformed to numeric (tip: factor to numeric)

# so exclude variable type2 (has missing) and just leave some variables
mydata <-  mydata[c(-1,-2,-3,-4,-5,-6,-9,-10,-12,-13)]


# k means algorithm in R with 5 centers, run 20 times
set.seed(4)
km.out <- kmeans(mydata, centers=3, nstart=20)
summary(km.out)

# Print the cluster membership component of the model
print(km.out$cluster)

# Print clusters
plot(mydata, col=km.out$cluster, main="example model documentation")

##########################################################
########## CHECK HOW MANY CLUSTERS ARE NECESSARY #########
#########################################################

# Initialize total within sum of squares error: wss
wss <- 0

# For 1 to 15 cluster centers
for (i in 1:15) {
  km.out <- kmeans(mydata, centers = i, nstart=20)
  # Save total within sum of squares to wss variable
  wss[i] <- km.out$tot.withinss
}

# Plot total within sum of squares vs. number of clusters
plot(1:15, wss, type = "b", 
     xlab = "Number of Clusters", 
     ylab = "Within groups sum of squares")
