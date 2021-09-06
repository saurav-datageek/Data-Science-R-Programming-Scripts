
### Magic of Normal

### Demonstration of Central Limit Theorem Using the Dice example ###

library(DataExplorer)
library(dplyr)

remove(list = ls())

#To get samples with replacement. 
sample(1:100,50,replace = TRUE)

#Creating a dice that rolls n number of times. 
DiceRoler  <- function(n) sample(1:6, n, replace=T)  

DiceRoler(3)

DiceRoler(100)
hist(DiceRoler(1000))


hist(DiceRoler(10))
hist(DiceRoler(10000))


### Now throwing two dices at a time. 
df_twodice  <- data.frame(Dice1=DiceRoler(1000),  Dice2=DiceRoler(1000))  
outcome_twodice <- mutate(df_twodice, sum=Dice1+Dice2, mean=(Dice1+Dice2)/2)  
head(outcome_twodice)  
hist(outcome_twodice$Dice1)
hist(outcome_twodice$Dice2)
hist(outcome_twodice$sum)
hist(outcome_twodice$mean)

#To get all the plots at once.
plot_histogram(outcome_twodice)

###Now throwing three dices at a time. 
df_threedice  <- data.frame(Dice1=DiceRoler(1000),  Dice2=DiceRoler(1000),Dice3=DiceRoler(1000))  
outcome_threedice <- mutate(df_threedice, sum=Dice1+Dice2+Dice3, mean=(Dice1+Dice2+Dice3)/3)  
head(outcome_threedice)  

plot_histogram(outcome_threedice)

#Creating a biased dice. 
DiceRoler_biased  <- function(n) sample(1:6, n, replace=TRUE, prob=c(2,1,1,1,1,2)/7 )
DiceRoler_biased(100)
hist(DiceRoler_biased(10))
hist(DiceRoler_biased(1000))

#Now throwing two biased dices at a time. 
df_twodice_biased  <- data.frame(Dice1=DiceRoler_biased(1000),  Dice2=DiceRoler_biased(1000))  
outcome_twodice_biased <- mutate(df_twodice_biased, sum=Dice1+Dice2, mean=(Dice1+Dice2)/2)  
head(outcome_twodice_biased)  

plot_histogram(outcome_twodice_biased)

#Now throwing three biased dices at a time. 
df_threedice_biased  <- data.frame(Dice1=DiceRoler_biased(1000),  Dice2=DiceRoler_biased(1000),Dice3=DiceRoler_biased(10000))  
outcome_threedice_biased <- mutate(df_threedice_biased, sum=Dice1+Dice2+Dice3, mean=(Dice1+Dice2+Dice3)/3)  
head(outcome_threedice_biased)  

plot_histogram(outcome_threedice_biased)


#Comparing two dices at a time vs three for biased dice
hist(outcome_twodice_biased$sum)
hist(outcome_threedice_biased$sum)

#As we increase the number of dices, our distribution of sum will assume more and
# and more normal. 

#Creating a random dice. 
DiceRoler_random  <- function(n) sample(1:6, n, replace=TRUE, prob=runif(6) )
DiceRoler_random(10)
hist(DiceRoler_random(10))
hist(DiceRoler_random(1000))

#Now throwing two random dices at a time. 
df_twodice_random  <- data.frame(Dice1=DiceRoler_random(1000),  Dice2=DiceRoler_random(1000))  
outcome_twodice_random <- mutate(df_twodice_random, sum=Dice1+Dice2, mean=(Dice1+Dice2)/2)  
head(outcome_twodice_random)  

plot_histogram(outcome_twodice_random)

#Now throwing three random dices at a time. 
df_threedice_random  <- data.frame(Dice1=DiceRoler_random(1000),  Dice2=DiceRoler_random(1000),Dice3=DiceRoler_random(10000))  
outcome_threedice_random <- mutate(df_threedice_random, sum=Dice1+Dice2+Dice3, mean=(Dice1+Dice2+Dice3)/3)  
head(outcome_threedice_random)  

plot_histogram(outcome_threedice_random)

#Comparing two dices at a time vs three for biased dice
hist(outcome_twodice_random$sum)
hist(outcome_threedice_random$sum)

