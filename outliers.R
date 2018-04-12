#outlier analysis
#outlier not predicted well in fitted regression model

marks= c(1:80, 100, 1000)
marks2= c(1:80, 100)
marks
par(mfrow= c(1,2))  #to plot multiple graphs in one window


mean(marks); mean(marks2)
median(marks); median(marks2)
boxplot(marks2)
boxplot(marks)
summary(marks); summary(marks2)
abline(h=c(1,21,41,41.23,61,100))
abline(h=c(1,21.5,41.5,52.93,61.75,1000))

#identifying outliers
par(mfrow= c(1,1))
set.seed(450)
y= rnorm(500)
boxplot(y)
identify(rep(1, length(y)), y, labels= seq_along(y)) #identify outliers
y[80]
