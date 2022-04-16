df = read.csv('Demographic-Data.csv',stringsAsFactors = T)

nrow(df)
ncol(df)

head(df,2)
tail(df,n=7)

str(df)

summary(df)

#-------------------------

df[2:3,2:3]

df[1,]

df[,1]
typeof(df[,1])
df[,'Birth.rate']

df[,1,drop=F]
typeof(df[,1,drop=F])


df[2:4,'Country.Name']
df[2:4,c('Country.Name','Birth.rate')]
df[2:4,2:3]

df[c(4,8,2),]

df[c(4,8,2),c(3,1)]

levels(df$Income.Group)
#-----------------------------
head(df)
df$Birth.rate + df$Internet.users
df$Birth.rate * df$Internet.users

df$MyColumn = df$Birth.rate * df$Internet.users

df$newColumn= df$Birth.rate *2

df$anotherColumn= 1:5
#--------------------------------
df$newColumn=NULL
df$anotherColumn=NULL
df$MyColumn=NULL
#----------------------------
df[df$Internet.users<5,]
df[df$Internet.users<5 & df$Birth.rate>40,]
df[df$Income.Group=='High income',]
df[df$Country.Name=='Japan',]
df[df$Country.Name=='Japan'|df$Country.Name=='India',]
#------------------------

      #ggplot()
library(ggplot2)

qplot(x=df$Internet.users)
qplot(data = df, x=Internet.users)
qplot(data = df, x=Internet.users, bins=40)
qplot(data = df, x=Internet.users, binwidth=5)

qplot(data = df, x=Birth.rate, size=I(4))


qplot(data = df, x=Internet.users,  geom = 'boxplot')
qplot(data = df, y=Internet.users,  geom = 'boxplot')

qplot(data = df, x=Income.Group,  y=Internet.users, geom = 'boxplot')


qplot(data = df, x=Internet.users, y=Birth.rate)
qplot(data = df, x=Internet.users, y=Birth.rate, size=I(4))
qplot(data = df, x=Internet.users, y=Birth.rate, size=I(4), color=I('red'))

qplot(data = df, x=Internet.users, y=Birth.rate, size=I(4), color=Income.Group)

#-----------------------------------------------

#Execute below code to generate three new vectors
Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")

# df2 = data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
# colnames(df2)=c('Country', 'Code','Region')

#or
df2 = data.frame('Country'= Countries_2012_Dataset,
                 'Code'= Codes_2012_Dataset,
                 'Region'= Regions_2012_Dataset,stringsAsFactors = T)
str(df2)
summary(df2)


m_df= merge(x=df,y=df2,by.x='Country.Code',by.y = 'Code')
m_df$Country=NULL

qplot(data = m_df, x=Internet.users, y=Birth.rate)
qplot(data = m_df, x=Internet.users, y=Birth.rate,color=Region)

qplot(data = m_df, x=Internet.users, y=Birth.rate,color=Region,
      shape=I(17), size=I(3))

qplot(data = m_df, x=Internet.users, y=Birth.rate,color=Region,
      shape=I(17), size=I(3), alpha=I(.5))

qplot(data = m_df, x=Internet.users, y=Birth.rate,color=Region,
      shape=I(17), size=I(3), alpha=I(.5),
      main="Internet Vs Birth")

qplot(data = m_df, x=Internet.users, y=Birth.rate,
      shape=Region, size=I(3),
      main="Internet Vs Birth")

qplot(data = m_df, x=Internet.users, y=Birth.rate,color=Region,
      shape=Region, size=I(3),
      main="Internet Vs Birth")
#------------------------------------------------------------------

        # Task

# produce a scatterplot depicting Life Expectancy (y-axis) and Fertility Rate (x-axis) statistics by Country.
# The scatterplot needs to also be categorised by Countries’ Regions

# You have been supplied with data for 2 years: 1960 and 2013 and you are required to produce a visualisation for each of these years.
# Some data has been provided in a csv file, some - in R vectors. The csv file contains combined data for both years. 
# All data manipulations have to be performed in R (not in excel) because this project may be audited at a later stage.
# You have also been requested to provide insights into how the two periods compare.

#--------
# Hint:
# After you import the csv file into R the first step is to split the data frame into two: data1960 and data2013
# In order to achieve this use data frame filtering we discussed in this section
#--------------------------------------------------------------------------------
# Task Solution:

t_df =read.csv('Task-Data.csv')

l_1960_df = data.frame(Country = Country_Code, Life.Exp= Life_Expectancy_At_Birth_1960)
l_2013_df =data.frame(Country = Country_Code, Life.Exp= Life_Expectancy_At_Birth_2013)

t_df_1960 = t_df[t_df$Year==1960,] 
t_df_2013 = t_df[t_df$Year==2013,] 

m_df_1960 = merge(x=t_df_1960,y=l_1960_df,by.x = 'Country.Code', by.y = 'Country')
m_df_2013 = merge(x=t_df_2013, y=l_2013_df,by.x = 'Country.Code', by.y = 'Country')


m_df_1960$Year=NULL
m_df_2013$Year=NULL

library(ggplot2)
qplot(data = m_df_1960,x=Life.Exp,y=Fertility.Rate,
      color=Region,main='1960- Life Exp Vs Fertility in Regions',
      size=I(3),alpha=I(.6), shape=Region)

qplot(data = m_df_2013,x=Life.Exp,y=Fertility.Rate,
      color=Region,main='2013- Life Exp Vs Fertility in Regions',
      size=I(3),alpha=I(.6), shape=Region)
#---------------------------------------------------

