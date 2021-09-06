

### Code to perform basic Data Analysis in R ### 

### Dataset used is the mtcars dataset, which is the built in dataset in R ###



remove(list=ls())

library(dplyr)
library(ggplot2)

data()

 
df_mtcars <- mtcars

head(df_mtcars)
help("mtcars")

class(df_mtcars)
dim(df_mtcars)

class(df_mtcars$am)
class(df_mtcars$wt)

table(df_mtcars$wt);table(df_mtcars$am)


df_mtcars$am <- as.factor(df_mtcars$am)
class(df_mtcars$am)


### So the first thing you do after you import a dataset is: get a glimpse of it, check out the dimension, and the data types of the variables.

### Change the data types of variables if you think it is necessar. 

View(df_mtcars)

### Selecting observations depending on some criteria ###

### I need all the cars with weight less than 3

df_mtcars[1,]

df_mtcars[df_mtcars$wt > 3,] #Give me all the rows with wt < 3 and all columns 

df_mtcars$wt

### Libary known as dplyr ###

library(dplyr)

### Filter ### Selecting rows on the basis of certain criteria. (Criteria decided by Variables/Columns)

filter(df_mtcars, wt >3)

filter(df_mtcars, wt > 3 & am==0) #Clubbing of operations together 
filter(df_mtcars, wt > 3 | am==0)

### Explore And, Or, Not and other logical constructs on your own ###


### Select ### Selectin certain columns from the dataframe ####


select(df_mtcars, wt, hp)

df_mtcars[,c('wt','hp')]


head(df_mtcars)

### Mutation of Data ### Bascially Mutating/Changing our Variables ### 

df_mtcars$wt_new <- df_mtcars$wt * 1000 # Without using library 
df_mtcars$wt <- df_mtcars$wt / 1000

df_mtcars <- mutate(df_mtcars, wt = wt * 100000)

### Now on to sorting/arranging your dataset ###

### You need a Variable on the basis of which you can  sort your data ###

### Arranging your dataset ### 

arrange(df_mtcars, wt)

arrange(df_mtcars, desc(wt))

arrange(df_mtcars, desc(cyl),desc(hp)) #Sort on the basis of first criteria first, if there are matches, use second criteria within the match 

df_mtcars[order(df_mtcars$wt, decreasing=FALSE), ] ###This means all rows with indices given, and all columns 

### Please perform the above operation arrange(df_mtcars, desc(wt)) without using dplyr using the help of google ###

### Arrange the mtcars dataset on the basis of wt in descending order 

rename(df_mtcars, wt_renamed = wt_new)

### Renaming the Variable without using dplyr is also a super clumsy process. Try this if you are bored ###

### We use the operation called Group by and Summarise whenever we want to find some metric for particular groups/categories

### Whenever we need to combine multiple operations together in R, we use the Pipeline Operator (% > %)

group_by(df_mtcars, cyl) %>% summarise(mean(wt))

### f(g(h(x))) -> Composite function in Mathematics 
### First perform h(x), then pass the result to g(), then pass the result that is g(h(x)) into f(), with final output f(g(h(x)))

### In R, you can perform such operatios using the Pipeline operator ###

### Pipeline comes from dplyr ###

# h(x) %>% g() %>% f() 

group_by(df_mtcars, am) %>% summarise(sum(mpg))

# group_by(df_mtcars, am) %>% summarise(my_function(hp))


# Things like creating your own functions, doing if-else and other control operations, loop operations, we are not going to cover in our lab
# It's basically same as in C and other functions, so explore on your data#

my_function <- function(x, y){
  return(x*y)
}

my_function(2,10)

### Mutate, Filter, Select ###

### First divide your hp by 100, filter anything less than certain value, and select only wt ###

filter(df_mtcars, mpg > 20) %>% select(hp)

select(df_mtcars, hp) %>% filter(wt > 100) #We can do this, because as we have selected only hp earlier, there won't be any wt variable for second operation 

class(df_mtcars$mpg);class(df_mtcars$am)

### Whenever we are about to perform a same function across all the Variables/All the elements, we use Apply functions in R ###

### apply, sapply, lapply # Explore on your own 

sapply(df_mtcars, class) # Apply the function class() to all the Columns/Variables of the dataset df_mtcars

df_mtcars[,-9] # All rows, all columns except column 9 # minus(-) means all but that 

sapply(df_mtcars[,-9], sum)
lapply(df_mtcars[,-9], sum)

help(apply) # Explore the apply function #

class(df_mtcars$am)
unclass(df_mtcars$am)

dim(df_mtcars)

df_mtcars$gender <- rep(c("Male","Female"),16)


