# Amber Garner
# Nov. 14, 2016
# Clustering on seeds.csv

# install necessary packages
install.packages("cluster")
library(cluster)

# Load credit seeds dataset
seeds <- read.csv("seeds.csv", header = T, sep = ",")

# View dataset
head(seeds)
summary(seeds)
str(seeds)

# how many of each variety of wheat
table(seeds$variety.of.wheat)

# create new variable
newseeds <- seeds

# remove variety of wheat
newseeds$variety.of.wheat <- NULL

# verify removal
head(newseeds)

# reproduce same output
set.seed(1234)

# build cluster model
kc <- kmeans(newseeds, 3)

# print results
print(kc)

# cluster centers
kc$centers

# total sum of squared distances
kc$totss

# check accuracy
table(seeds$variety.of.wheat, kc$cluster)

# Rows correspond to actual wheat variety
# column correspond to cluster they were assigned to 
# highest number is each row is the dominant cluster for the variety of wheat
# cluster 1 is dominate for wheat variety 3

# how many correctly clustered 
# highest #'s divided by total numbers
((70+57+60)/nrow(seeds))*100

# plot clustering
clusplot(newseeds, kc$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

