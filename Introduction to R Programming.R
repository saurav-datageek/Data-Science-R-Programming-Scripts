
### This is the introduction lecture on R Programming ###


# This is how we comment in R. So I will be writing notes this way. 

# 3 Atomic Types # Usually #

# Numbers. Characters. Booleans #

2 # Number

"Saurav" # Character

# TRUE FALSE # Boolean 

### Variable ###

name = "Saurav" # This is basically creating a variable 

### Assignment Operator ### 

# We usually use <- instead of = in R # 

name <- "Saurav Mason"

print("Hello World")

goals <- 18

GOALS <- 20

goals;GOALS # Case Sensitive Language # Semi Colon means two separate code # Otherwise, new line means new code 

### Basic Data Types in R ###


### All data of same atomic type ###

### Name of footballers ### 

### Vector ### Don't confuse with mathematical vectors #

### Vector basically stores collection of data of same type #

footballer_names <- c("Mason","Anthony","Marcus","Paul")

### Indexing starts from 1 in R Programming ###

### Unlike 0 in most other programming languages ### 

footballer_names[1:3] #Give me the 1st 3 elements of the vector 

salary <- c(20000,30000,"500K") #Implicit Coersion 

as.integer("300") #Explicit Coersion 


### name = Mason, age = 18, address = Manchester , goals_scored = YES ###

mason_altlist <- list("Mason",18, "Manchester",TRUE)

mason_list <- list(name = "Mason",age = 18, address = "Manchester", goals_scored = TRUE) # This is the preferable method # 

### Dollar Symbol ### Whenever you want to access element using names ### 

mason_list$name

mason_altlist[3]

random_list <- list(name="Saurav",code=c(10,20,30,40),bool=c(TRUE,FALSE))

length(random_list)
length(random_list$code)

class(random_list) # This is to know class of data or variable # 

class(salary)


### Mathematical Data Structure called Matrix ### 

mat1 <- matrix(c(1,2,3,4)) #It gets arranged as 4 by 1 matrix 

mat2 <- matrix(c(1,2,3,4), nrow = 2) # It fills the data column wise. That is, first 1 and 2 in 1 column, remaining 3, 4 in another

1:10 #To create a sequence of number# 

mat3 <- matrix(1:8,nrow = 2)

first_matrix <- matrix(1:9, nrow = 3)
second_matrix <- matrix(10:18, nrow = 3)


first_matrix * second_matrix # This is not the correct of doing matrix multiplicatio 

first_matrix %*% second_matrix # %*% This is symbol that we need to remember in R 

### Now we will look into a data type which is the most used data in R ### 

### Dataframe ### (This is same as Pandas Dataframe from Python)

### Think of some Excel / CSV dataset ### 

### There are certain consistencies/rules that we encounter in a typical Excel/CSV File. 
### 1. There will be rows and columns 
### 2. All the columns are of equal length 
### 3. All the data within the same column are of same type 


#Name Age Address
#"Mason" 20 "Lanchasire"
#"Marcus" 23 "Manchester"
#"Anthony" 25  
#"Paul"  28  "Paris"

### These same 3 consistencies are the cornerstone of Dataframe data type in R ### 

mydataframe <- data.frame(name=c("Mason","Marcus","Anthony","Paul"), age=c(20,23,25,28), address=c("Lanchasire","Manchester",
                                                                                                   "Paris","Paris"))




class(mydataframe)

dim(mydataframe) # Dimension (which is called Shape in Pandas Python) is also an important feature to know about your data 


mydataframe$name

mydataframe$address[2]

mydataframe[1,3] # This is like saying, 1st row - 3rd column data 

mydataframe[2,] # This means 2nd Row, All Columns (Blank means all)

mydataframe[,3] # This is same as the above 

### Can I call dataframe collection of Vectors??? 

newdataframe <- data.frame(name=c("Saurav","Mark"),code=c(20,"Thirty"))

newdataframe$code[1]

### We have a tricky data type known as Factor ### 


#Name Age Address Gender Salary 
#"Mason" 20 "Lanchasire" Male (?)
#"Mary" 23 "Manchester" Female (?)
#"Anthony" 25  "Paris" Male (?)
#"Paulina"  28  "Paris" "Female" (?)

### So data like Gender which can be categorized into fixed levels are known as Categorical data ###
### And in R, we call this Factor data ###

factor(c("Male","Female","Male","Female","Male"))
unclass(factor(c("Male","Female","Male","Female","Male")))

### Size ### Small Medium Large ###
### Countries ### Developed Developing Under-Developed 

class(mydataframe$name)

### By default, whenever we have Character data in Dataframe, R changes that to Factor ### 

mydataframe <- data.frame(name=c("Mason","Marcus","Anthony","Paul"), age=c(20,23,25,28), address=c("Lanchasire","Manchester",
                                                                                   "Paris","Paris"), stringsAsFactors = FALSE)


class(mydataframe$name)

mydataframe$address <- as.factor(mydataframe$address) # This is the right way of making a variable/column Factor. 

class(mydataframe$address)


help("data.frame")


help(list)

### How to install a library or package in R ###

install.packages("name of the package")

### The most used library in R is known as dplyr 

# install.packages("dplyr") #

### If you need to install multiple libraries at a time ### 

# install.packages(c("dplyr","ggplot2","stringr")) ### Multiple libraries at a time get installed 

### Usually I would recommend you all to perform operations like installing a library (that is anything that is not related to your code)
### in your console ###


























