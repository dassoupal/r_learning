#case study- denco

sales2= read.csv("D:/r_learning/projects/r_learning/data/denco.csv")
sales2
sales= read.csv(file.choose())   #to open the csv file in r
sales
str(sales1)

#installing package
install.packages('gsheet')

library(gsheet) #to load a package

url= "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907"

sales3= as.data.frame(gsheet2tbl(url)) #to convert google sheet data to dataframe

#case study and analysis steps

#head(sales1,n=7)
#names(sales1)

sales = sales1  # keeping a backup
class(sales)
str(sales)
?summary
summary(sales)

str(sales)
dim(sales)    #dimensions of the data frame (rows and columns)
unique(sales$custname)  #unique fields in a dataset
length(unique(sales$custname))
length(unique(sales$region )) #numerically define the unique dataset

#aggregate-- to split the data into subsets and compute summary for each of those subsets
aggregate(sales$revenue , by=list(sales$custname), FUN=sum) 
?aggregate
df1 = aggregate(sales$revenue , by=list(sales$custname), FUN=sum)
head(df1)
str(df1)


#sorting
df1=df1[order(df1$x, decreasing=TRUE),]   #sorting in decreasing order
?order
head(df1,5)   #display first five values of the selected subsets
tail(df1,5)   #display last five values of the selected subsets

head(df1[order(df1$x, decreasing=TRUE),], 5)

#Aggregate Formula
(df2 = aggregate(revenue ~ custname + region, data=sales, FUN=sum))
head(df2[order(df2$revenue,decreasing=T),],10)  

#List
list1= tapply(sales$revenue, sales$custname, FUN=sum)
head(list1)
list1
head(sort(list1, decreasing=T))
summary(df3)
str(df3)

#dplyr
names(sales)
install.packages('dplyr')
library(dplyr)

sales %>% filter(margin>500000)

sales %>% filter(margin > 500000) %>% arrange(region, desc(revenue))
filter(sales, margin > 1000000)

sales %>% filter(region == '01-East' & revenue > 400000) %>% select(partnum, region, revenue)

sales %>% filter(region == '01-East' | revenue > 400000) %>% select(partnum, region, revenue)

names(sales)
sales %>% group_by(region) %>% 
  summarize(Revenue = sum(revenue)) %>% arrange(desc(Revenue))


library(data.table)
dt1 = as.data.table(sales)
dt2 = dt1[, sum(revenue), by=custname]
names(dt2)
dt1[, dt1[, sum(revenue), by=custname]]

dt1[, order(, decreasing = T)]

# Select
library(sqldf)
df5 =sqldf("Select custname, sum(revenue) from sales Group By custname order by sum(revenue) desc ")
head(df5)

# Freqency --------
names(sales)
table(sales$custname)
head(sort(table(sales$custname), decreasing=T), n=10)
tail(sort(table(sales$custname), decreasing=T), n=10)

#frequency in dplyr
?top_n()


#xtab
#
head(sort(xtabs(~ custname, sales), decreasing=T))
#
#
library(dplyr)
sales %>% dplyr::count(custname, sort=TRUE)

sales %>% dplyr::group_by(custname) %>% dplyr::summarise(n = n()) %>% dplyr::arrange(desc(n))



#plyr
df2a= plyr::count(sales, c('custname'))
str(df2a); names(df2a)
head(df2a[order(-df2a$freq),])

# summarise by part num myself
?group_by
?filter
df4= sales %>% group_by(partnum) %>% select(partnum, margin) %>% arrange(desc(margin)) 
df4

# Summarise by Part Num

df3a= aggregate(sales$revenue, by=list(sales$partnum), FUN=sum)
df3a[order(-df3a$x),][1:5,]

df3b = aggregate(revenue ~ partnum, data=sales, FUN=sum)
head(df3b)
head(df3b[order(df3b$revenue, decreasing=T),])

sales %>% dplyr::group_by(partnum) %>% dplyr::summarise(n = n()) %>% dplyr::arrange(desc(n))


# which parts have highest Profit : partno - sum(profit)
names(sales)
df4a = aggregate(margin ~ partnum, data=sales, FUN=sum)
head(df4a)




