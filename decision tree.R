#decision tree

install.packages('rpart')
install.packages('rpart.plot')
library(rpart)
library(rpart.plot)
library(arules)
library(Matrix)
rollno= paste('s', 1:1000, sep = '-')
rollno

set.seed(100)
gender= sample(x=c('Male', 'Female'), size= 1000, replace=T, prob= c(0.5, 0.5))
head(gender)
tail(gender)
table(gender)

#favourable buy decison
set.seed(3000)
buy= sample(x=c('buy', 'notBuy'), size=1000, replace= T, prob= c(0.5,0.5))
head(buy)
tail(buy)
prop.table(table(buy))

#create data frame
student1= data.frame(gender, buy)
rownames(student1)= rollno
head(student1)

#table
table(student1)
prop.table(table(student1))
addmargins(prop.table(table(student1)))
(t1= table(student1$gender, student1$buy))

#decision model
fitx= rpart(buy~ gender, data=student1, minsplit= 4, minbucket=2)
fitx
rpart.plot(fitx, main='Classification tree',nn= T, type=4, extra=104)

#predict
predict(fitx, newdata= data.frame(gender='Female')) 
predict(fitx, newdata= data.frame(gender='Male'))
predict(fitx, newdata= data.frame(gender='Male', 'Female', 'Male', 'Female', 'Female', 'Female'))


#add another column
set.seed(3000)
married= sample(x=c('Married', 'Single'), size= 1000, replace = T, prob= c(0.5, 0.5))
table(married)
students2= data.frame(gender, married, buy)
rownames(students2)= rollno
head(students2)
tail(students2)
str(students2)
prop.table(ftable(students2))
addmargins(prop.table(ftable(students2)))

#decision tree
fity= rpart(buy~gender+married, data= students2, minsplit=2)
summary(fity)
fity
rpart.plot(fity, type=2, extra=104, tweak=0.8, shadow=c('brown', 'green', 'red'), nn=T)
fity
prp(fity)
