
### Code to perform basic Data Visualization in R ### 

### Dataset used is the mtcars dataset, which is the built in dataset in R ###


library(dplyr)
library(ggplot2)

### Data Visualization ###

### Used in two different stages in Data Science ###

### First is during Exploratory Data Analysis ### EDA ###

df_mtcars <- mtcars

head(df_mtcars)

sapply(df_mtcars,table)

summary(df_mtcars)

### Quartiles ### Q1, Q2 and Q3 ### Same logic as Median. Q2=Median ###

fivenum(df_mtcars$wt)



filter(df_mtcars, wt > 5.3)

### Weight ### We want to explore about Weight ###

hist(df_mtcars$wt,main = "Histogram of Weight")
help("hist")

boxplot(df_mtcars$wt,ylim=c(0,10))


### Histogram vs Bar Plot ###

### Histogram is used for Cont. Variables, and Bar Plot is used for Categorical Variables. 

barplot(df_mtcars$cyl)

table(df_mtcars$cyl)

barplot(table(df_mtcars$cyl))

### Till now, we have just used one variable for analysis. This type of EDA is known as Univariate Analysis. ###


### Multivariate Analysis ###

### Bi-Variate Analysis ###


cor(df_mtcars$mpg, df_mtcars$wt) # -0.86 which means strong negative (linear) relationship

### Scatter Plot ### 
plot(df_mtcars$wt, df_mtcars$mpg, main = "Weight vs Mpg", xlab = "Weight", ylab = "Mpg",col="red")


### Doing Scatter Plot where input is Categorical Variable ###
plot(df_mtcars$cyl, df_mtcars$mpg)

boxplot(df_mtcars$mpg ~ df_mtcars$cyl)


### Once we go towards more complex visualisation, we usually use other libraries in R ###

### And the most commonly used one is ggplot2 ###

## gg means Grammar of Graphics, plot means plot, 2 means its the second version 2.0 ##

# install.packages("ggplot2")

### ggplot2 is created by the same guy who created dplyr ### 

### Just for scatter plot, I need to write more letters into my code ###

plot(df_mtcars$wt, df_mtcars$mpg)


ggplot(df_mtcars, aes(wt, mpg)) + geom_point() + stat_smooth(method = lm)

### Grammar gives us some order in daily language ### Some structure ### 

### ggplot takes 3 things into consideration ###

### First is Data ### Second is Variables (what variables you want to use) ### Third is what plot you want to visualise ###

### data comes in data part, variables come under Aesthetics part (aes), and the plot comes under geometry part (geom)

ggplot(df_mtcars, aes(wt)) + geom_histogram(bins = 30)


ggplot(df_mtcars, aes(cyl)) + geom_bar()

### Till now, we have visualized two variables at a time ###

### What if we want to do more than two? ###

ggplot(df_mtcars, aes(wt, mpg,col=as.factor(cyl))) + geom_point()

class(df_mtcars$cyl)


### What if we want to use 4 Variables at a time? ###
ggplot(df_mtcars, aes(wt, mpg,col=as.factor(cyl), shape=as.factor(am))) + geom_point()

### If one were to try above line code using plot, it would be way too complicated ###









