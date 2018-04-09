#data struct in R
# types of data struct

# use four dashes to bookmark subtopics

#vectors----
v1 = c('A','B','C')    #create a vector
v1                     #print a vector      
class(V1)              #print the class of vector
(v2= c(1,2,3))         #()before initialization helps in printing in same line  
class (v2)
(v3= c(TRUE,FALSE,TRUE))
class (v3)
v4= 100:200           #prints all the numbers in the range defined
v4
v5= seq(1,50,4)       #prints all the  numbers in specified sequence in range    
v5
v4; v5
v4[c(1,4,5)]          #select data in specific positions
v4[-c(1,4,5)]         #deselect specific data at specific positions and print the other data
v4[v4 < 123]
v7= c('A', 'C')
v1[v1 %in% v7]        #filter out datas between two data sets (union)
v1[!v1 %in% v7]       #filter out datas between two data sets (intersection)
v1[1]
length(v4)            #number of elements in the dataset



#matrix----



#arrays----



#list----



#factors----



#dataframes----
rollno= c(1,2,3)
name= c('x','y','z')
course= c('x11','y11','z11')
dept= c('a','b','c')
marks= floor(rnorm(3,80,20))    #randomly create values using rnorm (n, mean, sd)
marks
?rnorm
stud= data.frame(rollno,name,course, dept, marks)  #create the dataframe
class(stud)
str(stud)     #statiscal summary of charecter values
summary(stud) #statiscal summary of numerical values
stud

