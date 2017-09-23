# use pokemon data from Kaggle (https://www.kaggle.com/abcsds/pokemon)
mydata <- read.csv("C:/Users/ingrid.brizotti/Downloads/Pokemon.csv")
summary(mydata)

# In order to create the cluster, we can have missing data 
# Also, we can't have categorical variables need to be transformed to numeric (tip: factor to numeric)

# so exclude variable type2 (has missing) and just leave some variables
mydata <-  mydata[c(-1,-2,-3,-4,-5,-6,-9,-10,-12,-13)]

# Using the same data let’s create hierarchical clustering model: hclust.out
dist_matrix <- dist(mydata)
hclust.out <- hclust(d=dist_matrix)

# Inspect the result
summary(hclust.out)

# Plot 
plot(hclust.out)

# Cut by height
hclust.out2 <- cutree(hclust.out, h=10)

# Cut by number of clusters
hclust.out2 <- cutree(hclust.out, k=4)


