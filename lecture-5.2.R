data("Airpassenger")
AirPassengers

#Understanding and Preparing data
boxplot(AirPassengers~cycle(AirPassengers))
plot(AirPassengers,main="AirPassengers",ylab="Number of Passengers",
       col="Blue",lwd=1.5)

# upward and seasonality  Trend data
abline(lm(AirPassengers~time(AirPassengers)),lwd=1.3,col="red")

#Make it stationary
# do variance constant 
plot(diff(log(AirPassengers)),col="red",lwd=2,ylab="Passengers",main="AirPassengers data")

#After stationary we can fit ARIMA model
# we need tseries
library(tseries)
# ARIMA(P=Order of AR,D=differencing order,
# order of MA)
#Selecting the value of p(AR)
acf(AirPassengers)
acf(diff(log(AirPassengers)))
#Here the number of line cross or touch the blue line is no.
# of AR .we avoid the for zero value and the data
# is sessional that's why q=1 

# Selecting the value of p
pacf(diff(log(AirPassengers)))

# Fitting an ARIMA(0,1,1)
# help(arima)

m_fit=arima(log(AirPassengers),order = c(0,1,1),seasonal =list(order=c(0,1,1),period=12))

m_fit

#Forecast for next 10 years

pred=predict(m_fit,n.ahead = 10*12)
pred

#final predicton
finalpred=exp(pred$pred)
ts.plot(AirPassengers,finalpred,log="y",lty=c(1:3),col=c(3,'red'),
        main="Passengers Predicton",ylab="Number of Passengers")
#Checking accuracy of the prediction
train_data=ts(AirPassengers,frequency = 12,start=c(1949,1),end = c(1959,12))

m_fit2=arima(log(train_data),order = c(0,1,1),seasonal =list(order=c(0,1,1),period=12))

m_fit2
#Predict for one year
pred2=predict(m_fit2,n.ahead = 1*12)
pred2
pred3=exp(pred2$pred)
pred3

pred_1960=round(pred3,0)
true_1960=tail(AirPassengers,12)
df=data.frame(pred_1960,true_1960)
df
# The difference between the true value and the predicted value is the smallest
# so the accuracy of the model is large.
