# user defined Functions:


#definition of function:
adi = function(){
  print("hi")
}

adi()  #calling of function
#--------------------------------------
adi = function(a){
  cat("my age is ",a)
}

adi(33)
#--------------------------------------
adi = function(a,b,c){
  return (a*b+ c)
}

adi(3,2,4)
#--------------------------------------
adi(a=3,b=2,c=4)

adi(b=2,c=4,a=3)
#--------------------------------------
adi = function(a=1,b=1,c=1){
  return (a*b+ c)
}

adi()
adi(3,2,4)
#--------------------------------------
#Lazy Evaluation of Function:

adi = function(a,b){
  a=a*2
  print(a)
  
  print(b)
}

adi(2,3)

adi(2)

#----------------------------------------
#packages:

library() #list of all the installed packages
# install.packages('ggplot2')
library(ggplot2) #import package
#----------------------------------------

#data Reshaping:
#rbind:
df1 =data.frame(height=c(132, 151, 162, 139, 166, 147, 122)
                ,gender=c("male" ,  "male",   "female", "female", "male" ,  "female", "male"  ))
df1

df2 =data.frame(height=c(48, 49, 66 ,53, 67, 52, 40)
                ,gender=c("male" ,  "male",   "female", "female", "male" ,  "female", "male"  ))
df2
df3 =rbind(df1,df2)
#------------------------------------
#cbind:
df1 =data.frame(height=c(132, 151, 162, 139, 166, 147, 122)
                ,gender=c("male" ,  "male",   "female", "female", "male" ,  "female", "male"  ))
df1

df2 =data.frame(weight=c(48, 49, 66 ,53, 67, 52, 40)
                ,Age=c(33,32,34,33,35,23,35))
df2

df3 =cbind(df1,df2)
#-------------------------
# Merging Data frames:

library(MASS)
data(Pima.te)
data(Pima.tr)

merged.data =merge(x=Pima.te, y=Pima.tr, 
                   by.x=c('bp','bmi'),by.y=c('bp','bmi'))

#---------------------------
#melt:
library(MASS)
data(ships)

# install.packages('reshape2')
library('reshape2')

melt.ship= melt(ships)

#converting all columns other than type and year into multiple rows:
melt.ship= melt(ships,id.vars = c('type','year'))
#----------------------------

dcast(melt.ship,.~variable,sum)
dcast(melt.ship,type~variable,sum)
dcast(melt.ship,type+year~variable,sum)
#------------------------------------------------------------------
# Reading Files:
#---------------------------

read.csv(file.choose())
#---------------------------


getwd()

# setwd('D:\6831_evening\6831_ R')
#or
#go to Files in left---> from there change the directory. 

df =read.csv('myfile.csv')

#----------------------------------
# Statistical analysis:
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
mean(x)

mean(x,trim = .3)
# drop:-21,-5,2           drop: 12,18,54

x <- c(12,7,3,4.2,18,2,54,-21,8,-5,NA)
mean(x)

mean(x, na.rm = T)

#------------------------------
median(x,na.rm = T)
#--------------------------
getmode <-function(v){
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
v <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)

result <- getmode(v)
#-------------------------




















