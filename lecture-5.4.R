# the a10 dataset, which is supposed to represent monthly
#anti-diabetic drug subsidy in Australia from 1991 to 2008
#Visualization of data by ggplot2
library(fpp)
library(fpp2)
library(forecast)
library(ggplot2)
# help("autoplot")
data(a10)
a10
#------------------Plotting the dataset--------------------#
autoplot(a10)+
  ggtitle("Antidiabetic drug sales")+
  ylab("$ Million")+
  xlab("Year")

#Seasonal plot
ggseasonplot(a10,year.labels = T,year.labels.left = T)+
    ggtitle("Seasonal Plot: Antidiabetic drug sales")+
    ylab("$ Million ")+
    xlab("Year")
#Polar seasonal plot
ggseasonplot(a10,polar =T)+
  ggtitle("Polar Plot: Antidiabetic drug sales")+
  ylab("$ Million ")+
  xlab("Year")

#seasonal sub-series plot 

ggsubseriesplot(a10)+
    ggtitle("Sub-Series plot:Antidiabetic drug sales")+
    ylab('$ Million')

#Visualizing ausbeer data
#Total quarterly beer production in Australia (in megalitres) from 1956:Q1 to 2010:Q2.
data("ausbeer")
ausbeer

beer2=window(ausbeer,start=1993,end=c(2006,4))
autoplot(beer2)

#--Simple forecasting methods
# Average 
# Naive(work with most recent values)
# Seasonal Naive
# Drift

beerfit1=meanf(beer2,h=12)
beerfit2=rwf(beer2,h=12)
beerfit3=snaive(beer2,h=12)

#We plot full data set
autoplot(window(ausbeer,start=1993))+
    autolayer(beerfit1,series="Mean",PI=F)+
    autolayer(beerfit2,series="Naive",PI=F)+
    autolayer(beerfit3,series="Seasonal Naive",PI=F)+
    xlab("Year")+ylab("Megalitres")+
    ggtitle("Forecasted quaterly beer production ")+
    guides(colour=guide_legend(title = "Forecast"))
#Accuracy 
beer3=window(ausbeer,start=2008)
accuracy(beerfit1,beer3)
accuracy(beerfit2,beer3)
accuracy(beerfit3,beer3)


#Another data
# Closing stock prices of GOOG from the NASDAQ exchange, for 1000 consecutive trading days
# between 25 February 2013 and 13 February 2017. Adjusted for splits. goog200 contains the first
# 200 observations from goog
goog200
autoplot(goog200)

#Forecast for next 40 
googf1=meanf(goog200,h=40)
googf2=rwf(goog200,h=40)
googf3=rwf(goog200,drift=T,h=40)

autoplot(subset(goog200,end = 240))+
  autolayer(googf1,series="Mean",PI=F)+
  autolayer(googf2,series="Naive",PI=F)+
  autolayer(googf3,series="Drift",PI=F)+
  xlab("Day")+ylab("Closing price(us$")+
  ggtitle("Google Stock Price")+
  guides(colour=guide_legend(title = "Forecast"))
autoplot(googf3)
  





