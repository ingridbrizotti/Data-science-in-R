# use pokemon data from Kaggle (https://www.kaggle.com/abcsds/pokemon)
mydata <- read.csv("C:/Users/ingrid.brizotti/Downloads/Pokemon.csv")
summary(mydata)

# In order to perform PCA, we can have missing data 
# Also, we can't have categorical variables need to be transformed to numeric (tip: factor to numeric)

# so exclude variable type2 (has missing) and just leave some variables (leave: HP, Attack, Defense, Speed # Attack, Speed Defense, and Speed)
mydata <-  mydata[c(-1,-2,-3,-4,- 12,-13)]

pr.out <- prcomp(mydata, scale=TRUE)

# Inspect model output
summary(pr.out)


#You also can visualize PCA using:
biplot(pr.out)

# 	We can observe the variables attack and HP have approximately the same loadings in the first two principal components.

# Some practical issues with cluster and PCA:
# •	Scaling the data (if your data have very different units: example salary and time on bureau)
# •	Missing values 
# •	Categorical data (you can encode categorical features as numbers)

# So a good practice is to scale the data before perform cluster and PCA.

# Mean of each variable
colMeans(mydata)

# Standard deviation of each variable
apply(mydata, 2, sd)

# PCA model with scaling: pr.with.scaling
pr.with.scaling <- prcomp(mydata, scale=TRUE, center=TRUE)

# Create biplots of both for comparison
par(mfrow=c(1,2))
biplot(pr.with.scaling, main="with scaling")
biplot(pr.out, main="without scaling")

