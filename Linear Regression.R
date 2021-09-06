

### Code to perform Linear Regression in R ### 

### Also includes relevant tests necessary for Linear Regression Model ###

### Dataset used is the mtcars dataset, which is the built in dataset in R ###


remove(list = ls())

View(mtcars)


library(ggplot2)

### Visualization ###

df <- mtcars
ggplot(df, aes(wt, mpg))+geom_point()+geom_smooth(method="lm")


### Two motives of using Linear Regression ####

### 1. To find the relationship between Output and Input
### 2. To predict Output using Input in future



### Correlation ###

cor(df$wt, df$mpg)

### How Linear Regression goes a step further ###

#-> It gives for for unit change in input, what is the change in output. 

### Simple Linear Regression ###

### One output, One input ###

### wt = input, mpg = output

lm(mpg ~ wt, data = df ) # lm stands for Linear Model # y ~ x 

# mpg = 37.285 - 5.344 * wt # y = mx + c 

# mpg = intercept + coefficient_of_wt * wt

model_simple <- lm(mpg ~ wt, data = df)  # lm(y ~ X)
model_simple

summary(model_simple)

# wt = 10, what is the mpg of that car? 

# mpg = 37.285 - 5.344 * 10 = This will be your mpg for a vehicle with weight 10. 

# If I make my weight 11, my mpg will decrease by 5.344 

# mpg = 37.285 - 5.344 wt 

# Two insights from this formula
# 1. For unit change in wt, mpg changes (decreases) by 5.344
# 2. For wt = 5, now you know the mpg, which is basically prediction

# w = 5 -> mpg = 37.285 - 5.344*5 


### Multiple Linear Regression ###

# One output, multiple inputs 

## Output = mpg, Input = wt, hp 

lm(mpg ~ wt + hp, data = df)

# mpg = 37.227 - 3.877 * wt - 0.03177 * hp # This is the formula we get in Mutiple LM. 


model_multiple <- lm(mpg ~ wt + hp + drat, data = df) # lm(y ~ x1 + x2 + ... Xn)
model_multiple

# mpg = 29.39 -3.22*wt -0.03*hp + 1.61drat 

# Future prediction for any vehicle with wt = 3, hp = 120 and drat 4 
# mpg = 29.39 - 3.22*3 - 0.03*120 + 1.61*4 


### Now onto the prediction part ### 

#Prediction: wt = 4, hp = 100, drat = 4.5

### Prediction ###

# predict(Name_of_your_mode, Your_Input)

predict(model_multiple, df[1:10, c('wt','hp','drat')]) # predict(model, input_features)
df[1:10, "mpg"]

### Prediction with interval = confidence 
predict(model_multiple, df[1:10, c('wt','hp','drat')],interval = "confidence")

### Model Evaluation - Statistical Method ### Residual Test ### Concept of P-Value ### Concept of R Square ###

summary(model_simple)

# Residual or Error 

# y, y'; residual = y - y' or y' - y

#residual = predicted - original 


# p-value at the bottom is of model. Pr(> |t|) is P-Value of Coefficients of Variables. 
#p-value -> Basically lets us know if our model is statistically significant or not. If p-value < 0.05, statistically significant. 



### Baseline without ML prediction = Line from Average = Mean Output = All Output 
### More Error than ML Model Line Error

### Baseline Error = 100; ML Model Error = 30 

### What is the improvement in Error = 70? ### Extra Information Capture increase by 70

### Change in Error / Original Baseline Error = R Square 

### Total Increase in Information (Decrease in Error) / Original Baseline Error 
### This is known as R Square in Linear Model. 

### If your R Square is 0.7 (70 Percent), then your Linear Model captures 80 percent
### of information / variance of your model.

### If Baseline Error = 50, ML Model Error = 10, what is your R Square? 40 / 50 = 80 Percent 
### What if your ML Model Error was 0 in above case? R Square = 1 = 100 Percent 

### What if your ML Model Error was 50? R Square = 0 = 0 Percent 





# R Square 

# Safe bet without doing any ML: average mpg = predicted mileage for all 

# y = Original Output, y' = Predicted Output, y-mean = Mean of Output 

# R square = (y-y-mean)^2 - (y-y')^2 / (y-ymean)^2 # (No need to memorise such formulae)




# R square = Error around safe bet prediction - Error around ML prediction / Error around safe bet prediction 

# What if your Error around ML prediction is 0. What is your R square? This will be 1. 

# What if your Error around ML prediction = Error around safe bet prediction? What is your R square? 

# R square is a metric that lies between 0 and 1. Worst case 0, Best case 1. 

# R square basically gives us what percentage of information of the Data is captured by the model

# R square is 0.8 means, 80 percent of information of data is caputured by our model

# For simple linear regression, R square is square of correlation (r)

cor(df$wt, df$mpg)

summary(model_multiple)


### Residual Test ### Residual = Predicted - Original = y' - y

model_multiple$residuals

# Residual = Error should be normally distributed, should not be one-directional, and should not be high. 

# If your Error (Predicted - Original) is all +ve, then your model clearly overestimates. 
# If your Error (Predicted - Original) is all -ve, then your model clearly underestimates. 

hist(model_multiple$residuals)

plot(model_multiple$residuals)
abline(0, 0) #abline(intercept,slope)

### Model Evaluation - Machine Learning Method ### 

### Splitting your data into Train and Test set in 80:20 ###

### You create your model on 80 percent of data, that is your Training Set, and you test that model on your Test Set ###


df_training <- df[1:25,]
df_testing <- df[26:32,]


training_model <- lm(mpg ~ wt, data = df_training)

predict(training_model, data.frame(wt = df_testing[,"wt"]))

### Training and Testing is closely related to a concept known as Cross-Validation, which is for you to research ### 






### What happens we have Categorical Variables as our predictors?


### Salary = 4.5 Age + 10000

### 4.5 meaning = If I increase age by 1, my salary will increase by 4.5

### Salary = 4.5 * Age + 1.5 * Gender + 10000 # Basically adding Cateogrical Variable as my input 

### 1.5 meaning??


# mpg ~ wt + am (where am = 0 for automatic and 1 for manual)

# What does the coefficient of am give in layman terms?

# salary ~ age + gender (where gender = 0 for female and 1 for male)
#Coefficient of age is 2.4?
#Coefficient of gender is 5.6?











