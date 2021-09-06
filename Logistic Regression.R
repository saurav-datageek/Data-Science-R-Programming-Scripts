
### Code to perform Logistic Regression in R ### 

### Dataset used is the mtcars dataset, which is the built in dataset in R ###


remove(list=ls())

mtcars_df <- mtcars


mtcars_df$am <- as.factor(mtcars$am)

### Train Test Dataset ###

random_sample <- sample(1:32, 5)

mtcars_training <- mtcars_df[-random_sample,]
mtcars_testing <- mtcars_df[random_sample,]

### One step process for splitting training test data ### 

### Output is am variable, and our input is mpg, hp and wt ###

### We want to create a logistic regression model for the above inputs and output ###

#lm(am ~ mpg + hp + wt, data = mtcars_df) # If we were doing linear regression 

#We will use something known as general linear model. 
#One of the general linear model is Logistic Regression, which is our algorithm 



glm(am ~ mpg + hp + wt, data = mtcars_training, family = "binomial")


help(glm)


### Coefficients of intercept, and coefficients of each input ###

### B0 = 221.49, B1 = 3.89, B2 = 0.46, B3 = -115.66

### Output = 221.49 + 3.89*mpg + 0.46*hp - 115.66*wt (if we were doing Linear Regression) 

model_logistic <- glm(am ~ mpg + hp + wt, data = mtcars_training, family = "binomial")

predict(model_logistic, mtcars_testing[,c("mpg","hp","wt")]) 





# Till now, all this model predicts is Output = 221.49 + 3.89*mpg + 0.46*hp - 115.66*wt


# We need to find a way to restrict these outputs between 0 and 1. 
# That is passing via sigmoid function 


# 1 / 1 + e^-output 

# 1 / 1 + e^- (221.49 + 3.89*mpg + 0.46*hp - 115.66*wt) # We get values within 0 and 1 only after this step 



predicted_values <- predict(model_logistic, mtcars_testing[,c("mpg","hp","wt")], type = "response") 

### type = response basically ensures that your output value is passed via a Sigmoid function to restrict your
### final output value between 0 and 1. 

### P (Output = 1 is 0.6) ; Output = 0 or 1? 1 is safe if you have a balanced data and no domain requirement. 

### If we were to use decision boundary of 0.5, we would have following predictions ### 

round(predicted_values)

### The above was our predicted output ####

### Let us see what was the real output ### 


mtcars_testing[,"am"]


### Accuracy = 80 Percent 

### Precision = 0 Percent 

### Sensitivity (of detecting 1) = We had no 1 case for test 

### Specificity (of detecing 0) = 4 / 5 




### Add in the confusion matrix part here ### 

library(caret)


### Caret is one of the most used Machine Learning library in R Programming ###

# use caret and compute a confusion matrix

### Confusion Matrix using training dataset ###


# confusionMatrix(Predicted_Value, Actual_Value) # This will give us our Confusion Matrix metrics

# That is, metrics like Accuracy, Sensitivity (Recall),Specificity, Precision etc. 


confusionMatrix(data = as.factor(round(predict(model_logistic, mtcars_training[,c("mpg","hp","wt")], type = "response"))),reference = mtcars_training$am)






help("confusionMatrix")

### Confusion Matrix using test dataset ###
confusionMatrix(data = as.factor(round(predict(model_logistic, mtcars_testing[,c("mpg","hp","wt")], type = "response"))),reference = mtcars_testing$am)


