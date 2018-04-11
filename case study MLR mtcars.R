#using mtcars
data()
 ?mtcars
mtcars
dim(mtcars)
names(mtcars)
head(mtcars)

#when we select all the variables and try to fit, bad model crops up
mtcarsfit1= lm(mpg ~ cyl+ disp+ hp+ drat+ wt+ qsec+ vs+ am+ gear+ carb, data= mtcars)
mtcarsfit2= lm(mpg ~ . , data= mtcars)
summary(mtcarsfit1)
summary(mtcarsfit2)


install.packages('MASS')
library(MASS)
(model1a= lm(mpg ~. , data= mtcars))
(model2a= lm(mpg~ 1, data=mtcars))
summary (model1a)
summary (model2a)

#use AIC algorithm to calculate best fit model with variables (lower the AIC value, precise is the model)
stepboth= stepAIC( model1a, direction = 'both')
(fit11= lm(mpg~ wt+qsec+am, data= mtcars))
summary(fit11)
 stepfwd= stepAIC(model2a, direction= 'forward', scope= list(upper= model1a, lower=model2a))
stepbck= stepAIC(model1a
                 , direction = 'backward')
 
 install.packages('olsrr')
 library('olsrr')
 
 #using olssrr for model prediction (lower the value of mallow cp, precise is the model)
 
 model1= lm(mpg~ disp+hp+wt+qsec, data= mtcars)
x1= ols_step_all_possible(model1) 
plot(x1)
x1
