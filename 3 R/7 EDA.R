library(tidyverse)
diamonds
View(diamonds)
str(diamonds)
summary(diamonds)
#--------------------

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))


diamonds %>% 
  count(cut)

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(x = carat))


diamonds %>% 
  count(cut_width(carat, 0.5))

smaller <- diamonds %>% 
  filter(carat < 3)
ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram()


ggplot(data = smaller, mapping = aes(x = carat,colour = cut)) +
  geom_freqpoly()


ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

faithful

ggplot(data = faithful, mapping = aes(x = eruptions)) + 
  geom_histogram(binwidth = 0.25)
#---------------------------------------------------------

ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)
  
ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)+
  coord_cartesian(ylim = c(0, 50))

unusual <- diamonds %>% 
  filter(y < 3 | y > 20) %>%
  select(price,x,y,z) %>%
  arrange(y)

View(diamonds)
#--------------------------------------------------------------
# Explore the distribution of each of the x, y, and z variables in diamonds. 
# What do you learn? 
# Think about a diamond and how you might decide which dimension is the 
# length, width, and depth.

summary(select(diamonds, x,y,z))


ggplot(diamonds) +
  geom_histogram(mapping = aes(x = x), binwidth = 0.01)

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.01)

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = z), binwidth = 0.01)


filter(diamonds, x==0|y==0|z==0)


head(arrange(diamonds, desc(y)),4)
#or
diamonds%>%
  arrange(desc(y))%>%
  head(4)


head(arrange(diamonds, desc(z)),4)


ggplot(diamonds)+
  geom_point(aes(x=x,y=y))

ggplot(diamonds)+
  geom_point(aes(x=x,y=z))

ggplot(diamonds)+
  geom_point(aes(x=y,y=z))



filter(diamonds,x>0,x<10)%>%
  ggplot() +
  geom_histogram(mapping = aes(x = x), binwidth = 0.01)

filter(diamonds,y>0,y<10)%>%
  ggplot() +
  geom_histogram(mapping = aes(x = y), binwidth = 0.01)

filter(diamonds,z>0,z<10)%>%
  ggplot() +
  geom_histogram(mapping = aes(x = z), binwidth = 0.01)
#----------------------------------------------------------
# Explore the distribution of price. 
# Do you discover anything unusual or surprising? 
# (Hint: Carefully think about the binwidth and 
# make sure you try a wide range of values.)


ggplot(filter(diamonds),aes(x=price))+
  geom_histogram(binwidth = 100)

ggplot(filter(diamonds),aes(x=price))+
  geom_histogram(binwidth = 10)+
  coord_cartesian(xlim = c(0,5000))
#-------------------------------------------------------------------
# How many diamonds are 0.99 carat? 
# How many are 1 carat? 
# What do you think is the cause of the difference?

filter(diamonds,carat==0.99)

filter(diamonds,carat==1)%>%
  count(carat)

filter(diamonds,carat==0.99|carat==1)%>%
  count(carat)

#-------------------------  
filter(diamonds,carat==0.99)%>%
  summarise(avg_price=mean(price))

filter(diamonds,carat==1)%>%
  summarise(avg_price=mean(price))
#------------
filter(diamonds,carat>=.9,carat<=1.1)%>%
  count(carat)%>%
  print(n=Inf)
#-----------------------------------------------------

diamonds2 <- diamonds %>% 
  mutate(y = ifelse(y<3 | y>20, NA, y))

ggplot(data = diamonds2, mapping = aes(x = x, y = y)) + 
  geom_point()

ggplot(data = diamonds2, mapping = aes(x = x, y = y)) + 
  geom_point(na.rm = T)
#--------------------------------------------------------
#Covariation:
#A categorical and continuous variable

ggplot(data = diamonds, mapping = aes(x = price)) + 
  geom_freqpoly(mapping = aes(colour = cut))

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()

ggplot(data = mpg) +
  geom_boxplot( mapping = aes(x = class, y = hwy))


ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median)
                             , y = hwy))

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median)
                             , y = hwy))+
  coord_flip()
#or
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(y = reorder(class, hwy, FUN = median)
                             , x = hwy))

#------------------------------------
#Two categorical variables

ggplot(diamonds)+
  geom_count(aes(x=cut,y=color))


diamonds%>%
  count(color, cut)%>%
  print(n=Inf)

diamonds%>%
  count(color, cut)%>%
  ggplot(aes(x=color,y=cut))+
  geom_tile(aes(fill=n))
#----------------------------------------
#Two continuous variables

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price),alpha=.01)



ggplot(data = diamonds) +
  geom_bin2d(mapping = aes(x = carat, y = price))

ggplot(data = diamonds) +
  geom_hex(mapping = aes(x = carat, y = price))

ggplot(data =  smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_width(carat, .2)))

