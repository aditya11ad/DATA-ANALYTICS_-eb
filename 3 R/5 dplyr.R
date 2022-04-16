# install.packages('tidyverse')
library(tidyverse)

# install.packages(nycflights13)
library(nycflights13)
flights
typeof(flights)
class(flights)
View(flights)
#---------------dplyr-------------
#---------------------------------
#dplyr:
#filters:

filter(flights,month ==1 )

jan1 = filter(flights,month ==1 ,day==1)

april22 = filter(flights,month ==4 ,day==22)


sqrt(2)^2 == 2    #False, buz of finite precision srithmetic
near(sqrt(2)^2 , 2) #True, so use this

filter(flights, month==11 | month==12)
#or
filter(flights, month %in% c(11,12))
View(flights)

#flights that were delayed (on departure) by more than two hours
filter(flights,dep_delay>120)

#flights that were delayed (on arrival or departure) by more than two hours
filter(flights,dep_delay>120 |arr_delay>120)
#or
filter(flights,!(dep_delay<120 & arr_delay<120))

#flights that were delayed (on arrival and departure) by more than two hours
filter(flights,dep_delay>120 , arr_delay>120)
#or
filter(flights,dep_delay>120 & arr_delay>120)
#or
filter(flights,!(dep_delay<120 | arr_delay<120))

#flights that were not delayed (on arrival and departure) by more than two hours
filter(flights,!(dep_delay>120| arr_delay>120))
#or
filter(flights,dep_delay<120 , arr_delay<120)
#-----------------------

NA +10

NA == NA

# Let x be Mary's age. We don't know how old she is.
x <- NA

# Let y be John's age. We don't know how old he is.
y <- NA

# Are John and Mary the same age?
x == y

dplyr::tibble()
df=tibble(x = c(1, NA, 3))
df
filter(df, x>1)

is.na(x)

filter(df, is.na(x)|x>1)

#--------------------------
summary(flights)
summary(flights$dep_time)

# Finding flights that departed between midnight and 6 a.m. :
filter(flights, dep_time==2400|dep_time<=600)

#----------------------------------------------------------
#----------------------------------------------------------
#dplyr:
#arrange():

View(arrange(flights,dep_time))

View(arrange(flights,year,month,day,dep_time))

arrange(flights,dep_time)
arrange(flights,desc(dep_time))


df
arrange(df,x)
arrange(df,desc(x))

tail(arrange(flights,dep_time))

arrange(flights,desc(is.na(dep_time)))

# shortest flight:
View(head(arrange(flights, air_time)))

#longest flight:
View(head(arrange(flights, desc(air_time))))
#-------------------------------------------------
# dplyr:
#select:
select(flights, dep_time)

select(flights, dep_time, dep_delay, arr_time, arr_delay)

select(flights, 'dep_time', 'dep_delay', 'arr_time', 'arr_delay')

select(flights, 4, 6, 7, 9)

v =c('dep_time', 'dep_delay', 'arr_time', 'arr_delay')

select(flights, v)

v =c('dep_time', 'dep_delay', 'arr_time', 'arr_delay','dep_time2')
select(flights, v)
select(flights, all_of(v))
select(flights, any_of(v))

#----------------------
select(flights, year:day)

select(flights, -year)

select(flights, -(year:day))


select(flights, time_hour, air_time)
select(flights, time_hour, air_time, everything())
#-------------------

select(flights, tailnum)
select(flights, tail_num = tailnum)
newFlight_df= rename(flights, tail_num = tailnum)
View(newFlight_df)
#-------------------

View(flights)




select(flights, ends_with('time'))

select(flights,starts_with('dep'))



select(flights,starts_with('dep'),starts_with('arr'))

select(flights,starts_with('dep'),starts_with('arr'), ends_with('time'))

select(flights, ends_with('time'), starts_with('time'))
#or
select(flights, contains('time'))

View(select(flights, contains('time'),contains('delay')))
#------------------------------------------------------------------------
#dplyr:
# mutate():
flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time
)

mutate(flights_sml,
       gain =dep_delay-arr_delay)

mutate(flights_sml,
       gain =dep_delay-arr_delay,
       speed= distance/air_time*60)

mutate(flights_sml,
       gain =dep_delay-arr_delay,
       hours= air_time/60
)

mutate(flights_sml,
       gain =dep_delay-arr_delay,
       hours= air_time/60,
       gain_per_hr= gain/ hours
)
transmute(flights_sml,
          gain =dep_delay-arr_delay,
          hours= air_time/60,
          gain_per_hr= gain/ hours
)

View(transmute(flights,
               dep_time,
               hour= dep_time%/%100,
               minute=dep_time%%100
)
)
#----------------------------------
#dplyr:
# summarise():

summarise(flights, delay= mean(dep_delay,na.rm=T))
View(flights)

by_day = group_by(flights, year, month, day)
summarise(by_day, delay= mean(dep_delay,na.rm=T))

by_month = group_by(flights, year, month)
summarise(by_month, delay= mean(dep_delay,na.rm=T))

by_dest = group_by(flights, dest)
summarise(by_dest, delay= mean(arr_delay,na.rm=T))
#-----------------
by_dest = group_by(flights, dest)
summarise(by_dest, delay= mean(arr_delay,na.rm=T), 
          distance=mean(distance,na.rm=T))

delay = summarise(by_dest, count= n(),
                  delay= mean(arr_delay,na.rm=T), 
                  distance=mean(distance,na.rm=T))

delay = filter(delay, count>30, dest!='HNL')
delay
#-----
#pipe:       %>%

" x %>% f(y)          turns into f(x, y),       and 
  x %>% f(y) %>% g(z) turns into g(f(x, y), z)  and so on. "

delay=flights %>%
  group_by(dest)%>%
  summarise(count= n(),
            delay= mean(arr_delay,na.rm=T), 
            distance=mean(distance,na.rm=T))%>%
  filter(count>30, dest!='HNL')

delay
#----------------------------------------
ggplot(data = delay, aes(x=distance, y=delay))+
  geom_point(aes(size=count),alpha=.5)+
  geom_smooth()

#Or-----------------------------------------------
flights %>%
  group_by(dest)%>%
  summarise(count= n(),
            delay= mean(arr_delay,na.rm=T), 
            distance=mean(distance,na.rm=T))%>%
  filter(count>30, dest!='HNL')%>%
  ggplot(aes(x=distance, y=delay))+
  geom_point(aes(size=count),alpha=.5)+
  geom_smooth()
#Or-----------------------------------------------
delay= flights %>%
  group_by(dest)%>%
  summarise(count= n(),
            delay= mean(arr_delay,na.rm=T), 
            distance=mean(distance,na.rm=T))%>%
  filter(count>30, dest!='HNL')

delay%>%
  ggplot(aes(x=distance, y=delay))+
  geom_point(aes(size=count),alpha=.5)+
  geom_smooth()
#---------------------------------------------------------
not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay)
  )

ggplot(data = delays, mapping = aes(x = delay)) + 
  geom_freqpoly(binwidth = 10)

#----------------------------------

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay),
    count=n()
  )

ggplot(data = delays, mapping = aes(x = delay, y =count)) + 
  geom_point(aes(size=count),alpha=.1)
#-------------------------------------------


delays %>% 
  filter(count > 25) %>% 
  ggplot(mapping = aes(x = count, y = delay)) + 
  geom_point(alpha = 1/10)
#-----------------------------------------------

daily <- group_by(flights, year, month, day)

(per_day   <- summarise(daily, flights = n()))
(per_month <- summarise(per_day, flights = sum(flights)))
(per_year  <- summarise(per_month, flights = sum(flights)))
#-----------------------------------------------
