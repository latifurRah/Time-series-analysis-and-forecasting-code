
#---------------lecture-5.3--------------------------
#Decomposition and modeling 
#Data Air Passengers
data("AirPassengers")
View(AirPassengers)
AirPassengers

#Preparing the time series data
AP=ts(AirPassengers,frequency = 12,start = c(1949,1))

#Understanding data
# Trend(T)
#Seasonal(S)
#Cyclical(C)
#Irregular(I)
plot(AP,col="green",lwd=1.4,main="Air Passengers",ylab="Numberof Passengers")

#Log-transform to fix-up variation
AP2=log(AP)
plot(AP2,lwd=1.2,col="Yellow",
     main="Air Passengers ",ylab="Number of Passengers") #here we see the variance are same 

#Decompose
DAP=decompose((AP2))
DAP$figure
plot(DAP$figure,
     type='b',
     xlab = 'Month',
     ylab = 'Seasonality Index',
     col="blue",
     las=2,
     main = "AirPassengers",
     lwd=1.3)
#Decompose plot 
plot(DAP)

#ARIMA(p,d,q) model
library(forecast)
model_fit=auto.arima(AP2)
model_fit

#Residual plot
hist(model_fit$residuals,
     col='red',
     main = 'Residual plot',
     xlab = 'Error',
     freq=F)
lines(density(model_fit$residuals),
                col='blue',lw=3)
#Forecast for the next 4 years
pred=forecast(model_fit,4*12)
library(ggplot2)
autoplot(pred) #deep blue 80% CI and light blue 95% CI

#Checking accuracy
accuracy(pred)

 