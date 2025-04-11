#------------------Time series analysis------------------##
# ---------Generating random number from normal dist---------------
x=rnorm(100,0,1)
View(x)

help(ts)

#Creating a time series 
quater_ts=ts(data = x,start = 1995,frequency = 4)

#---Creating time series plot for quaterly  data---#
plot(quater_ts,col=4,ylab="Frequency",
     xlab="Year",main="Quaterly Time series Plot")

#Creating time series plot for monthly data
monthly_ts=ts(data = x,start = 1995,frequency = 12)

#--------------Plot--------------------
plot(monthly_ts,col="red",main="Monthly Time series data")

#-Detection of tend and get a stationary time series 
# install.packages("fpp")
library(fpp)
library(forecast)
data(ausbeer)
View(ausbeer)
ausbeer

beer.ts=window(ausbeer,start=1956,end=1975)
plot(as.ts(beer.ts),col=5,lwd=2)

# Upper tend data
#Creating a moving average that will be close to trend

beer.trend=ma(beer.ts,order = 4,centre = T)

#Plot trend a MA together
plot(as.ts(beer.ts),col="red",ylab="Value of Beer",main="Beer sells")
lines(beer.trend,col=6,lwd=1.5)

#Removing the trend from the time series
beer.detrend=beer.ts-beer.trend

#Plot the detrend data

plot(as.ts(beer.detrend),col=7,
     main="Australia Beer Production",ylab="Values",lwd=2)



# Those the quarterly and monthly data are the stationary 
# cause data form normal distribution ,Have equal mean and
# variance.

#But in real life problem all data sets are not stationary
#In this situation we have to convert data into a stationary
#data


#-Detection of tend and get a stationary time series 
# install.packages("fpp")
library(fpp)
data(ausbeer)
View(ausbeer)
ausbeer

library(readxl)
df<- read_excel("GDP of bangladesh.xlsx")
View(df)
# gdp.ts=window(df,start = 1980,end = 2020)
gdp=ts(df)
plot((gdp))





