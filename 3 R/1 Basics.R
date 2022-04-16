10

a=12

a
print(a)

#---------------------
a = 10
a <- 10
a <<-10
#Error # 10=a
10 -> a
10->>a
#------------------

s <- 'hello'
print(s)

?print()
help(print)
print()  #or on the function, press F1 for help
#---------------------
#Data Types:


#1. Numeric :
i=10   #default a number is double(floating point number)
typeof(i)
class(i)

j=12.3
typeof(j)
class(j)

#2. Integer:
k = 10L
k
typeof(k)
class(k)

l =as.integer(13)
l
typeof(l)
class(l)

#3. Complex:
v <- 2+5i
v
typeof(v)
class(v)

#4. character:
c='aditya'  #or c="aditya"
c
typeof(c)
class(c)

c='a'
c
typeof(c)
class(c)

#5. Logical:
k=TRUE   #or k=T
k
typeof(k)
class(k)

k=FALSE   #or k=F
k
typeof(k)
class(k)

#6. raw:
r= charToRaw('A')
r
typeof(r)
class(r)
#--------cat for concatenation and printing-----------
age=33L
print('my age is',age)#error
cat('my age is',age)

name = 'Saket'
age = 26L
weight = 69.2
cat('Helo!!! my name is',name,',my age is',age,'and my weight is',weight)

#-----------input-----------
readline()

i = readline()
i
i =as.integer(i)

name = readline()
age = as.integer(readline())
weight = as.double(readline())
cat('Helo!!! my name is',name,',my age is',age,'and my weight is',weight)

name = readline(prompt = 'Enter ur name: ')
age = as.integer(readline(prompt = 'Enter ur age: '))
weight = as.double(readline(prompt = 'Enter ur weight: '))
cat('Helo!!! my name is',name,',my age is',age,'and my weight is',weight)
#-------------------------------------------------------------------------
#-------------------------------------------------------------------------
#-------------------------------------------------------------------------
#vectors:
v =c(12,34,67,89)
typeof(v)
class(v)

v =c(12,34,67,89,'r')
typeof(v)
class(v)
#----------------------------------------
#variables:
a=12
a_b=12
a.b=12
.a=45  #hidden variable(object)
# _a=12  #Error in r
# 2a=12   #Error in r
#---------------------------------
#list all the variables:
ls()
ls(pattern = 'a')
ls(all.names = T)
#---------------------------------
# Remove a variable from the environment
rm(a)
a
#-------------Operators--------------------
#arithmetic:
12/5
12*5
12+5
12-5
12%%5
12%/%5
3**2 #or 3^2

v1=c(12,34,23)
v2=c(2,3,4)
v1/v2

v1=c(12,34,23,10)
v2=c(2,3)
v1+v2

#Logical Operators:


is.integer(10L)
is.integer('adity')
isTRUE(10==12)

#   : operator    :
2:10

#   %in%    :
v1 <- 8
v2 <- 12
t <- 1:10
print(v1 %in% t)
print(v2 %in% t)

#    %*%   :
M = matrix( c(2,6,5,1,10,4), nrow = 2,ncol = 3,byrow = TRUE)
t = M %*% t(M)
print(t)

#------------------------------------------------------------------
#Decision Making:
#------if----------
if(10>50){
  print("hi")
}

if(10<50){
  print("hi")
}

#-----if-else---------
if(10>50){
  print("hi")
}else{
  print('something else')
}

quantity <- 25
if (quantity > 20) {
  print('You sold a lot!')
} else {
  print('Not enough for today')
}

#-------if-  else if  -else-----------
quantity <- 25

if (quantity <20) {
  print('Not enough for today')
} else if (quantity > 20 &quantity <= 30) {
  print('Average day')
} else {
  print('What a great day!')
}

switch (3,
        "First",
        "second",
        'third',
        'fourth')
        
#--------loop-----------------  
fruit <- c('Apple', 'Orange', 'Passion fruit', 'Banana')
for (i in fruit){
  print(i)
}



i=1
while(i<=10){
  cat('this is loop number',i,',\t')
  i=i+1
  cat('now i is ',i,'\n')
}

#------break---------------

c=2
repeat{
  print("Hello from Repeat")
  c= c+1
  if(c>5){
    break
  }
}

#------next----------

c=0
repeat{
  c= c+1
  if(c==5){
    next
  }
  print(c)
  
  if(c>=10){
    break
  }
}

v =LETTERS[1:6]
for (i in v){
  if(i=='C'){
    next
  }
  print(i)
}

#--------------------------------------------------------------------------
#---------Vector Creation------------

v= c(12,34,56)
v

v= 5:10
v

v=seq(5,10)
v

v=seq(5,10,by=2)
v

v=c(T,F,F,F,T)
v

#atomic vector of type numeric:
a=12
a

#atomic vector of type character:
a="hello"
a

rep(3,6)
#-----------------------------------
# Access the elements in the vector:
t <- c("Sun","Mon","Tue","Wed","Thurs","Fri","Sat")

t[]
# t[:] #Error

t[1]

t[2:6]
# t[2:] #Error
t[7:1] 

t[10]  #NA

t[-1]  #don't include this index
t[-2:-6]

t[length(t)]#last Element

t[c(2,4,7)]

t[c(3,6,1)]

t[seq(1,7,2)]

t[c(T,F,T,F,F,F,T)]

t[c(-3,-7)]
#--------------------------------------
#Vector arithmetic:
v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11,0,8,1,2)

add.result=v1+v2
sub.result=v1-v2

#-------------------Vector Element Recycling
#If we apply arithmetic operations to two vectors of unequal length, 
#then the elements of the shorter vector are recycled to complete the operations.

v1 <-c (3,8,4,5,0,11)

v2 <- c(4,11,1) # Noooo Error , it will be repeated and become c(4,11,1,4,11,1)

add.result=v1+v2
add.result

v1 <- c(3,8 ,4,5,0,11)
v2 <- c(4,11,1,3) # Only warning, Noooo Error , it will be repeated c(4,11,1,3,4,11,1,3)

add.result=v1+v2
add.result
#---------------------------------
# Vector Element Sorting:
v<- c(3,8,4,5,0,11, -9, 304)
sort(v)

sort(v,decreasing = T)

v= c('Rohan','aditya','shivam','neha','umar')
sort(v)
sort(v,decreasing = T)
#--------------------------------------
#Repeating vecotrs:
rep(3,6)

rep(c(0,1,7),times=3)

rep(c(0,1,7),times=c(2,3,4))

rep(c(0,1,7),length.out=5)

rep(c(0,1,7),each=5)


rep(1:5, each=2)

rep(1:5, 1:5)
#-------------------------------------
#-----------List---------------------
# Lists are the R objects which contain elements of different types like − 
# numbers, strings, vectors and another list inside it. 
# A list can also contain a matrix or a function as its elements. 

l= list(10,'aditya',TRUE,c(23,45,88))
class(l)
typeof(l)

l= list(10,'aditya',TRUE,c(23,45,88), list(15,21L,'s',1:4))

l[4]
l[[4]]
l[[4]][2]

l=list(1:5)

l= list(c('jan','feb','march'))
l[1]

names(l)='1st quarter'

l= list(c('jan','feb','march'),12)
names(l)=c('1st quarter','profit')

names(l)

l[1]
l['1st quarter'] #or l$`1st quarter`
l['profit']

l[3] = 'new element'
#---------------------------------------
# Merging List:
list1 <- list(1,2,3)
list2 <- list("Sun","Mon","Tue")

merged.list = c(list1,list2)
#-------------------------------------
#Converting List to Vector:
l =list(1:5)
v =unlist(l)
v

l= list(10,'aditya',TRUE,c(23,45,88))
v =unlist(l)
v

l1 =list(1:5)
l2 =list(6:10)
#l1+l2 #Error
v1=unlist(l1)
v2=unlist(l2)
v1+v2
#----------------------------
#Matrices :
# Matrices are the R objects in which the elements are arranged in a 
# two-dimensional rectangular layout.
matrix(1:10)
matrix(1:10,nrow = 2)
matrix(1:10,nrow = 2,ncol = 5)

matrix(1:10,nrow = 3,ncol = 5) #extra elements are repeated
matrix(1:10,nrow = 3,ncol = 2) #extra elements are dropped
matrix(1:10,nrow = 3)

matrix(1:10,nrow = 2) #byrow= False
matrix(1:10,nrow = 2, byrow= T)

matrix(1:10,nrow = 2, dimnames =list(c('r1','r2'),c('c1','c2','c3','c4','c5')))
#----------------------

M =matrix(3:14,nrow = 3)
M
M[]
M[,]

M[1,]
M[,1]

M[1]
M[1,1]
#------------
nrow(M)
ncol(M)
#------------
#Matrices Computrations:
M1 =matrix(3:14,nrow = 3)
M2 =matrix(1:12,nrow = 3)
M1
M2
class(M1)
typeof(M1)

M1+M2
M1-M2
M1*M2
M1/M2

M1+2

M1 =matrix(3:8,nrow = 3,ncol = 2)
M2 =matrix(3:12,nrow = 2,ncol = 5)
M1 %*% M2 #Matrices Multiplication
#---------------------------------------

v1=c(12,34,56)
v2=c(1 ,4 ,6)
M= cbind(v1,v2)
class(M)

rbind(v1,v2)

v1=c(12,34,56)
v2=c(1,4)
rbind(v1,v2)
cbind(v1,v2)

v1=c(12,34,56)
v2=c('a','b','c')
M=rbind(v1,v2)
class(M)
typeof(M)
#--------------------------------------------
# Array:
# Arrays are the R data objects which can store data in 
# more than two dimensions.

A=array(1:15,dim = c(2,3,4))
A[]
A[,,]

A[1,,]

array(c('green', 'yellow'),dim = c(4,3,2))

vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)
result <- array(c(vector1,vector2),dim = c(3,3,2))
result

result <- array(5:13,dim = c(3,3,2),
                dimnames = list(c("ROW1","ROW2","ROW3"),
                                c("COL1","COL2","COL3"),
                                c("Matrix1","Matrix2")))
print(result)
#---------------------------------------------------------
# factor:
v =c('green', 'yellow','green', 'red','green', 'yellow','green','green')
f =factor(v)
f
nlevels(f)

v= c(6,2,2,2,5,2,2,6,6,2,2,6)
f = factor(v,levels = c(2,6))
f
nlevels(f)
#----------------------------------------------------------
#Data Frame:

df =data.frame(height = c(132,151,162,139,166,147,122),
           weight = c(48,49,66,53,67,52,40),
           gender = c("male","male","female","female","male","female","male"))

#------------
height = c(132,151,162,139,166,147,122)
weight = c(48,49,66,53,67,52,40)
gender = c("male","male","female","female","male","female","male")

df =data.frame(height,weight,gender)
df
#------------------
df =data.frame(height,weight,gender,stringsAsFactors = T)
df
#---------
df$height
#----------
df$Age=c(33,32,34,33,35,23,35)
#---------
str(df) #Structure
#---------
summary(df)
#----------------------------------
df2= data.frame(  emp_id = c (1:5),
             emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
             salary = c(623.3,515.2,611.0,729.0,843.25),
             start_date =as.Date(c("2012-01-01","2013-09-23","2014-11-15","2014-05-11",
                                   "2015-03-27")))
str(df2)
summary(df2)

df2$dept = c('HR','IT','IT','IT','HR')
df2$dept = factor(df2$dept)

#Or # df2$dept=factor(c('HR','IT','IT','IT','HR'))
#------------------------------------------------------
df[]
df[,]
df[2:4,]
df[2:4,2:3]
df[c(2,6,3),]
df[c(2,6,3),c(2,1)]
df[c(2,6,3),c('weight','Age')]
df[df$gender=='male',]
df[df$gender%in%'male',]
#-------------------------------------------------------

df1 =data.frame(height=c(132, 151, 162, 139, 166, 147, 122)
                ,gender=c("male" ,  "male",   "female", "female", "male" ,  "female", "male"  ))
df1

df2 =data.frame(weight=c(48, 49, 66 ,53, 67, 52, 40)
                ,Age=c(33,32,34,33,35,23,35))
df2

#rbind(df1,df2)# Error
df3 =cbind(df1,df2)

df1 =data.frame(height=c(132, 151, 162, 139, 166, 147, 122)
                ,gender=c("male" ,  "male",   "female", "female", "male" ,  "female", "male"  ))
df1

df2 =data.frame(height=c(48, 49, 66 ,53, 67, 52, 40)
                ,gender=c("male" ,  "male",   "female", "female", "male" ,  "female", "male"  ))
df2
rbind(df1,df2)
#----------------------------------------------------------
#apply() function:We use apply() over a matrice.
M= matrix(1:10,5,6)
a1= apply(M, 2, sum) #2:column wise
a2= apply(M, 1, sum) #2:row wise

#----------------
#lapply():The output of lapply() is a list.
movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
movies_lower <-lapply(movies, tolower)
str(movies_lower)

#convert the list into a vector
unlist(lapply(movies, tolower))
#-----------------
#sapply() :returns a vector.
l = list(a=1:10,b=11:20)
result <- sapply(l, mean)
result
#-----------------
# tapply():lets you break a vector into pieces and then apply some function to each of the pieces or groups
Orange
tapply(Orange$circumference,Orange$Tree,mean)

tapply(Orange$age,Orange$Tree,mean)

tapply(Orange$age,Orange$Tree,mean,simplify = F)#returns list
#--------------------------------------------------------------