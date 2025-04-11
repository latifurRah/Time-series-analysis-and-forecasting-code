#-------------Analyzing and forecasting monthly rainfall of Bangladesh----
df=read.csv(file.choose(),header = T,sep = ",")
df
head(df)
View(df)
#Packages
library(ggplot2)
library(dplyr)
library(lubridate)
library(forecast)

#Preparing data for analysis
df1<-filter(df,df$Year>="2007")
df1=filter(df1,Station=="Rajshahi")
View(df1)

df2=select(df1,Rainfall)
df2
#Convert the value in continuous formate

df2$Rainfall=as.numeric(df2$Rainfall)
#Convert into a time series data

RD=ts(df2$Rainfall,start = 2007,frequency = 12)
RD

#Time series Plot
plot(RD,lwd=1.2,col="green",main="Rainfall in Rajshahi
     ")

#Decompose
RDR=decompose(RD)
plot(RDR)

#Fitting an arima model
fit_model=auto.arima(RD)
fit_model

#Forecast
pred=forecast(fit_model,4*12)
autoplot(pred,PI=T)+
  ylim(0,550)

