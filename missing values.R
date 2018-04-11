#missing values

v1= c(1,2, NA, NA,3,5, NA,6,NA, NA)
is.na(v1)   #to check for missing values in a vector
sum(is.na(v1))
mean(v1)
mean(v1, na.rm=T)  #.rm ignores the missing values
v1a= na.omit(v1)  #.omit totally removes the missing values
v1a
sum(v1a)
?anyNA
anyNA(v1)
?is.na
v1[is.na(v1)]= mean(v1, na.rm=T) #to insert the average value into all NA places
v1

install.packages('VIM')
library(VIM)

data("sleep", package = 'VIM')
head(sleep)
tail(sleep)
dim (sleep)
complete.cases(sleep)  #all complete rows without any missing values
sum(complete.cases(sleep))
sum(!complete.cases(sleep))

sleep[complete.cases(sleep),] #to print the complete data
sleep[!complete.cases(sleep),] #to print the incomplete data

is.na(sleep$Dream)
sum(is.na(sleep$Dream))
mean(is.na(sleep$Dream))

sum(is.na(sleep))
names(sleep)
colSums(is.na(sleep))  #find the missing values in columns
rowSums(is.na(sleep))   #find the missing values in rows


install.packages('mice')
library(mice)
library(lattice)
mice :: md.pattern(sleep)

#visualizations
VIM::aggr(sleep, prep=F, numbers=T)

#NonD max na values
VIM::aggr(sleep, prop=T)
VIM::matrixplot(sleep)
VIM::marginmatrix(sleep)
