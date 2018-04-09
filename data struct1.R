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
(mat1= matrix(1:50, nrow=5, byrow=T))  #in matrix, data is filled by column default
(mat2= matrix(136:330, ncol=5, byrow=T))
length(136:330)
?matrix   # question mark sign for help and documentation
mat2[2:5, 1:2]  #to print specific range of rows and columns in sequence respectively
mat2[,2] # to print only column
mat2[1, ] #to print only rows
mat2[3:4, 3:4]
mat2
rn= paste('R', 1:39, sep='-')
cn= paste('C', 1:5, sep='_')
dimnames(mat2)= list(c(rn), c(cn)) #to give names to rows and columns in your matrix
?paste   #concatenate values
mat2
?c      #combine values

mat2[c('R-1' ), ]  #filter matrix values based on row names
mat2[ ,c('C_4')]   #filter matrix values based on column names
colSums(mat2)
rowSums(mat2)
rowMeans(mat2)
colMeans(mat2)



#arrays----
(ar1= array(230:432, dim=c(4,3,2))) #create array dim(row, col, no.of matrix)

(ar2= array(50:78, dim=c(4,3,2), dimnames=list(c('s1','s2','s3','s4'),c('sub1','sub2','sub3'),c('dept1','dept2'))))   #creating multi dimensional array

?apply

apply(ar2,1,sum)   #sum student wise
apply(ar2,2,sum)   #sum subject wise
apply(ar2,3,sum)   #sum department wise

apply(ar2,1,mean)   #mean student wise
apply(ar2,2,mean)   #mean subject wise
apply(ar2,3,mean)   #mean department wise

apply(ar2, c(1,3), mean) #mean marks each student department wise not a logical interpretation
apply(ar2, c(1,2), mean) #mean marks of each student in three subjects for every department




#list----
#it is a multipurpose object that can hold different datatype
l1= list(34, 'soupal', v1, stud, mat1, ar1) #example of a list
l1




#factors----
name= c('x1','x2','x3','x4','x5')
gender= c('M','F', 'M', 'M','F')
course= c('Ph.D', 'M.Tech','B.Tech', 'Ph.D','B.Tech')
grades= c('a','c','d','b','e')
marks= floor(rnorm(5,60,13))
df11= data.frame(name, course,gender, marks, grades)
df11
str(df11) #structure of the data frame
df11[1, ]
df11[,1]
df11[1:2,]
df11[,1:2]

df11$name = as.character(df11$name)
str(df11)
df11$grades= factor(df11$grades, ordered='T', levels=c('a','b','c','d','e'))
df11$grades
df11
df11$gender= factor(df11$gender, ordered = 'T', levels=c('M','F'))
df11$gender
df11

#dataframes----
#every column can be of different datatype
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

#Base package----
(letters[1:5])
(l1=letters[1:26])
(l2= LETTERS[1:26])
(m1= month.abb[1:12])
(m2= month.name[1:12])


sample(l1, 2)
sample(l2, 25)
sample(l2, 35, replace= T)  #to sample more data than your data size, use replace


sample(m1)
sample(m1, 5)
set.seed (15)

sample(m1, 15, replace=T)


(grades= LETTERS[1:5])
(sgrades= sample(grades, 20, replace = T, prob = c(0.3,0.1,0.1,0.3,0.2)))
table(sgrades)
