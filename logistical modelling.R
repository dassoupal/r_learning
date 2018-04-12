#logical regression

dataset= read.csv(file.choose())
str(dataset)
summary(dataset)
View(dataset)


install.packages('caTools')
library(caTools)
set.seed(2000)
split= sample.split(dataset$purchased, SplitRatio = 0.7)
training_set= subset(dataset, split== TRUE)
test_set= subset(dataset, split== FALSE)
dim(training_set)
dim(test_set)



class(dataset$gender)



logisticmodel= glm(purchased~ gender+age+salary, family = binomial, data= training_set)
summary(logisticmodel)

logisticmodel1= glm(purchased~ age+salary, family = binomial, data= training_set)
summary(logisticmodel1)


test1= data.frame(age= c(40, 60), salary=c( 40000, 50000))
prob_prd= predict(logisticmodel1, type= 'response', newdata= test1)
prob_prd
cbind(test1, prob_prd)
?predict
prob_test= predict(logisticmodel1, type= 'response', newdata= test_set)
prob_test
summary((prob_test))
head(test_set, prob_test)
cbind(test_set, prob_test)
 y_pred= ifelse(prob_test>0.6, 1, 0)
y_pred 
cbind(test_set, y_pred)
cm= table(test_set[,5], y_pred)
cm
install.packages('caret')

library(ggplot2)
library(lattice)
library(caret)
caret:: confusionMatrix(cm)
x= rnorm( 1:350)
x
quantile(x)
quantile(x, c(.1, .25, .5, .75, 1))
quantile(x, seq(.1,1, .1))


