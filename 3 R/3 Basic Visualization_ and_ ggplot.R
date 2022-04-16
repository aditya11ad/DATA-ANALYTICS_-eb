# Basic Visualization 

x <- c(21, 62, 10, 53)
labels <- c("London", "New York", "Singapore", "Mumbai")
pie(x,labels)


H <- c(7,12,28,3,41)
barplot(H)

H <- c(7,12,28,3,41)
M <- c("Mar","Apr","May","Jun","Jul")
barplot(H,names.arg=M, 
        xlab ='Month', ylab = 'avg Profit',
        main = 'Profit bar',
        col = 'red')


boxplot(mpg~cyl,data=mtcars)

v <-  c(9,13,21,8,36,22,12,41,31,33,19)
hist(v)

hist(v,col = 'red',border = 'green')


v <- c(7,12,28,3,41)
plot(v,type = 'o')

head(mtcars)
plot(x=mtcars$wt ,y=mtcars$mpg ,
     xlab = 'weight',ylab = 'mpg',
     xlim = c(0,10),ylim = c(0,50)
     )
#-------------------------------------------------------------------
#----------------------ggplot:
df =read.csv('Movie-Ratings.csv',stringsAsFactors = T)
colnames(df)=c('Film','Genre','CriticRating',
               'AudienceRating','BudgetMillion','Year')

summary(df)

df$Year = factor(df$Year)
#----------
# install.packages('ggplot2')
library(ggplot2)

ggplot(data=df, mapping = aes(x=CriticRating ,y=AudienceRating ))+
  geom_point()
#or
ggplot(df, aes(x=CriticRating ,y=AudienceRating ))+
  geom_point()

#-------------color:
ggplot(df, aes(x=CriticRating ,y=AudienceRating ,color=Genre))+
  geom_point()

ggplot(df, aes(x=CriticRating ,y=AudienceRating ,color=Genre , size=BudgetMillion))+
  geom_point()
#--------------
a= ggplot(df, aes(x=CriticRating ,y=AudienceRating ,
               color=Genre , size=BudgetMillion))
  
a+geom_point()

a+geom_line()

#multiple  plots or lyers of different plots:
a+geom_line()+geom_point()
#---------------------

b= ggplot(df)
b+geom_point(aes(x=CriticRating ,y=AudienceRating ,
                 color=Genre , size=BudgetMillion))

#---------------------
#overriding Aesthetics:
c= ggplot(df, aes(x=CriticRating ,y=AudienceRating ))
c+geom_point(aes(x=BudgetMillion))+xlab('Budget in Million $')

#---------------------
# Task:
View(mpg)

ggplot(mpg, aes(x=displ, y=hwy))+
  geom_point()

ggplot(mpg, aes(x=displ, y=hwy, color=class))+
  geom_point()
#-----------------------

#    Mapping Vs setting:
d= ggplot(df, aes(x=CriticRating ,y=AudienceRating ))
d+geom_point()

# Eg1:
#mapping:
d+geom_point(aes(color=Genre))

#setting:
d+geom_point(color='Red')

# Error in setting
#d+geom_point(color=Genere)

#Error in mapping:
d+geom_point(aes(color='Red'))

#----------------
# Eg2:
#mapping:
d+geom_point(aes(size=BudgetMillion))

#setting:
d+geom_point(size=10)

# Error in setting
#d+geom_point(size=BudgetMillion)

#Error in mapping:
d+geom_point(aes(size=10))
#-----------------------------------------------
# color as Continuous value:

ggplot(df)+
  geom_point(aes(x= CriticRating, y=AudienceRating,
                 color=BudgetMillion))

ggplot(df)+
  geom_point(aes(x= CriticRating, y=AudienceRating,
                 color=BudgetMillion, size= BudgetMillion))


ggplot(df)+
  geom_point(aes(x= CriticRating, y=AudienceRating,
                 color=BudgetMillion, size= BudgetMillion),alpha=.5)
#----------------------------------------------------
#histogram:
ggplot(df, aes(x =BudgetMillion))+
  geom_histogram()

#or

ggplot(df)+
  geom_histogram( aes(x =BudgetMillion))
#---------
ggplot(df)+
  geom_histogram( aes(x =BudgetMillion),bins = 20)

ggplot(df)+
  geom_histogram( aes(x =BudgetMillion),binwidth = 15)
#----------
#color:
ggplot(df,aes(x =BudgetMillion))+
  geom_histogram( aes(color= Genre)) #border

ggplot(df,aes(x =BudgetMillion))+
  geom_histogram( aes(fill= Genre), color ='Black')
#-------------
# Density 
ggplot(df,aes(x =BudgetMillion))+
  geom_density()
  
ggplot(df,aes(x =BudgetMillion))+
  geom_density(aes(fill=Genre))

ggplot(df,aes(x =BudgetMillion))+
  geom_density(aes(fill=Genre),alpha=.2)

ggplot(df,aes(x =BudgetMillion))+
  geom_density(aes(fill=Genre),position = 'stack')
#----------------------------------------------------

ggplot(df,aes(x=AudienceRating))+
  geom_histogram(bins = 10,color='Blue',fill='White')

ggplot(df,aes(x=CriticRating))+
  geom_histogram(bins = 10,color='Blue',fill='White')
#----------------------------------------------------
#---------------- BoxPlot:
ggplot(df,aes(x=AudienceRating))+
  geom_boxplot()
  

ggplot(df,aes(x=AudienceRating))+
  geom_boxplot(aes(color=Genre))

ggplot(df,aes(x= Genre, y =AudienceRating))+
  geom_boxplot(aes(color=Genre))

ggplot(df,aes(y= Genre, x =AudienceRating))+
  geom_boxplot(aes(color=Genre))
#----------------
ggplot(df,aes(x= Genre, y =AudienceRating))+
  geom_boxplot()+geom_point()


ggplot(df,aes(x= Genre, y =AudienceRating,color=Genre))+
  geom_boxplot()+geom_jitter()

ggplot(df,aes(x= Genre, y =AudienceRating,color=Genre))+
  geom_jitter()+geom_boxplot(alpha=.6)
#--------------------------------------------------------
#------ Facets:------

ggplot(df, aes(x=BudgetMillion))+
  geom_histogram()

ggplot(df, aes(x=BudgetMillion))+
  geom_histogram()+
  facet_grid(.~Genre)

ggplot(df, aes(x=BudgetMillion))+
  geom_histogram()+
  facet_grid(Genre~. )

ggplot(df, aes(x=BudgetMillion))+
  geom_histogram()+
  facet_grid(Genre~.,scales ='free' )

#---------
ggplot(df, aes(x=BudgetMillion))+
  geom_histogram()+
  facet_wrap(~Genre,scales ='free')
#------------
ggplot(df)+
  geom_point(aes(x= CriticRating, y=AudienceRating))+
  facet_grid(Genre~.)

ggplot(df)+
  geom_point(aes(x= CriticRating, y=AudienceRating))+
  facet_grid(.~Year)

ggplot(df)+
  geom_point(aes(x= CriticRating, y=AudienceRating))+
  facet_grid(Genre~Year)
#-----------------------------------------------------


#Task:
ggplot(mpg, aes(x=displ, y=hwy))+
  geom_point()+
  facet_wrap(~class)

ggplot(mpg, aes(x=displ, y=hwy))+
  geom_point()+
  facet_grid(drv~cyl)
#----------------------------------------------------------------
#------------smooth:
ggplot(df,aes(x= CriticRating, y=AudienceRating))+
  geom_point()+
  geom_smooth()
  

ggplot(df,aes(x= CriticRating, y=AudienceRating, size=BudgetMillion))+
  geom_point(color='Green')+
  facet_grid(Genre~Year)+
  geom_smooth()

#----------------------------------------------------------------
# Themes :
e =ggplot(df,aes(x=BudgetMillion))

f =e+geom_histogram(aes(fill=Genre), color='Black')

f+xlab('Money')+ylab('Number of movies')

f+xlab('Money')+ylab('Number of movies')+
  theme(axis.text.x = element_text(color='Red'),
        axis.text.y = element_text(color='Green'),
        
        axis.title.x = element_text(size=20),
        axis.title.y = element_text(size=20),
        
        legend.text = element_text(color='Red'),
        legend.title = element_text(size=20)
        
        )
?theme







