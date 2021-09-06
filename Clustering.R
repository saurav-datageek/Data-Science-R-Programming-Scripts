
### Code to perform Clustering in R ### 

### Both K-Means Clustering and Hierarchical Clustering performed ###

### Also includes relevant tests necessary for Clustering ###

### Dataset used is the mtcars dataset, which is the built in dataset in R ###


remove(list = ls())


library(dplyr)
library(ggplot2)


mtcars_df <- mtcars

View(mtcars_df)


#Now we are going to do clustering. 

# We use the function known as kmeans where we give data, center and iter.max 

cluster_model <- kmeans(mtcars_df, 3, iter.max = 10) # One Line Code 
cluster_model$tot.withinss
cluster_model$centers
cluster_model$cluster

table(cluster_model$cluster)



help("kmeans")


cluster_model$cluster
cluster_model$centers


mtcars_df$cluster_number <- cluster_model$cluster # Creating a new column in your dataset and adding cluster number information there 
View(mtcars_df)


### ggplot ### data, variable to plot, and what to plot ##
### data = data, variables = aes, plot comes under geom (geometry)

ggplot(mtcars_df, aes(x=mpg, y=wt))+geom_point()


ggplot(mtcars_df, aes(x=mpg, y=wt,col=as.factor(cluster_number)))+geom_point()

### Now onto Hierarchical Clustering 

distance_cluster <- dist(mtcars_df) # It calculates distance 
class(distance_cluster)
cluster_hier_model <- hclust(distance_cluster)

summary(cluster_hier_model)

plot(cluster_hier_model)


### To know the appropriate number of clusters (that is k) ### 

k.max <- 10
total_wss <- c()

for (k in 1:k.max) {
  total_wss <- c(total_wss, kmeans(mtcars_df, k, iter.max = 10 )$tot.withinss)
}


total_wss


plot(1:k.max, total_wss,
     type="b", 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")


### Now doing it with only two variables mpg and wt

distance_cluster_only_two <- dist(mtcars_df[,c('mpg','wt')])
cluster_hier_model_only_two <- hclust(distance_cluster_only_two)

plot(cluster_hier_model_only_two)


cluster_model_two_variables <- kmeans(mtcars_df[,c('mpg','wt')], 4, iter.max = 10)
mtcars_df$cluster_number_two_variables <- cluster_model_two_variables$cluster
ggplot(mtcars_df, aes(x=mpg, y=wt,col=as.factor(cluster_number_two_variables)))+geom_point()


### Scale ### 

### Does scale influence the result of clustering? 

### This is for you to think! 

### Now we will learn how to scale / normalize / standardize data.



### 1, 2, 3, 6, ...,9 # Variable 1 

### 30, 40, 57, 87 ....78 # Variable 2

### 100000, 300000, 533333, 22222, .... 4435335 # Variable 3 

### Can you think of a way to make ensure all these variables have similar scale?

### Centering = Making mean of your data 0, subtracting from mean (distance from mean)

### 1, 2, 3, 6, ...,9 # Variable 1, Mean = 3, => -2, -1, 0, 3 

### 100000, 300000, 533333, 22222, .... 4435335 # Variable 3, Mean = 30k, -20K, 0, 23K, 

### Scaling = Dividing by SD of the variable 


### One way to scale is Centering followed by divison by SD 


### Whenever you use Clustering (or any algorithm that uses metrics like distance for that matter), Scaling is a must

scale(mtcars_df$mpg); scale(mtcars_df$wt) #Just scaling variables mpg and wt 

class(scale(mtcars_df))

mtcars_scaled <- as.data.frame(scale(mtcars_df))
class(mtcars_scaled)

cluster_model_scaled <- kmeans(mtcars_scaled[,c('mpg','wt')], 4, iter.max = 10)
mtcars_scaled$cluster_number <- cluster_model_scaled$cluster
ggplot(mtcars_scaled, aes(x=mpg, y=wt,col=as.factor(cluster_number)))+geom_point()

### If you want to use whole variables for cluster plotting, PCA is used. # Principal Component Analysis # 
### You can look for its implementation in R. 



help("scale")



