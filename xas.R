#creating 30 students recorsd

(rollno= paste( 's',1:30, sep='-')); length(rollno)
(name= paste('Student-', 'xyz', 1:30)); length(name)
(gender= sample(c('Male','Female'), size = 30, prob= c(0.5,0.5), replace = T)); length(gender)
(age= floor(runif(30, 20,50))); length(age)
(course= sample(x= c('B.Tech', 'M.tech', 'Ph.D'), size=30, replace = T, prob= c(0.3,0.4,0.3)))
(marks= floor(rnorm(30, mean = 50, sd=20)))
(married= sample(x= c(TRUE, FALSE), size = 30, replace = T, prob= c(0.6, 0.4)))
(student= data.frame(rollno, name, gender, age, course, marks, married))

#subset the data

sample(nrow(student), 3)
student1= student[sample(nrow(student),3), 0]
(student2= subset(student, age>= 20 & age< 30, select= c(rollno, name)))
(student3= subset(student, marks>= 50 & marks< 60, select= c(rollno, name))) 

write.csv(student, './data/stud.csv')
library(xlsx)

Sys.system(JAVA_HOME= "C:\\Programfiles(x64)\\JAVA\\jre 1.8.0_144")
