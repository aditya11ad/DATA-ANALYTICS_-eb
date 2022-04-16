library(tidyverse)

df =data.frame(x=c(1,2,3),y=c('a','b','c'))
df

df2 =tibble(x=c(1,2,3),y=c('a','b','c'))
df2

tb <- tibble(
  `:)` = "smile", 
  ` ` = "space",
  `2000` = "number"
)

tb

df <- data.frame(
  `:)` = "smile", 
  ` ` = "space",
  `2000` = "number"
)

df

tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5,
  'c', 2, 3.3)

data.frame(a = lubridate::now() + runif(1e3) * 86400,
           b = lubridate::today() + runif(1e3) * 30,
           c = 1:1e3,
           d = runif(1e3),
           e = sample(letters, 1e3, replace = TRUE))

tibble(a = lubridate::now() + runif(1e3) * 86400,
       b = lubridate::today() + runif(1e3) * 30,
       c = 1:1e3,
       d = runif(1e3),
       e = sample(letters, 1e3, replace = TRUE))

tibble(iris)
as_tibble(iris)
#-------------------------------------------------
# Tidy Data
# tidyr

table1

table2

table3

table4a
table4b

table5

# There are three interrelated rules which make a dataset tidy:
# 1. Each variable must have its own column.
# 2. Each observation must have its own row.
# 3. Each value must have its own cell.

# So only table 1 is tidy.

#compute the cases per 10,000 people:
table1 %>% 
  mutate(rate = cases / population *10000)

#compute the cases per year:
table1 %>% 
  count(year, wt=cases)


table4a

table4a = table4a%>%
  pivot_longer(c('1999', '2000'),names_to ='year', values_to = 'cases')

table4b

table4b = table4b%>%
  pivot_longer(c("1999","2000"),names_to='year',values_to='population')

left_join(table4a,table4b) #now this is tidy.

#----------

table2

table2%>%
  pivot_wider(names_from = type, values_from = count)
#----------

table3

table3%>%
  separate(col=rate, into = c('cases','population'))
  
table3%>%
  separate(col=rate, into = c('cases','population'),convert = T)
#---------------

table5

table5%>%
  unite(newyear, century,year)

table5%>%
  unite(newyear, century,year,sep = '')
#---------------