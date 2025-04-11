#Analyzing data from Wikipedia using Prophet library 
#Prophet is a procedure for forecasting time series data
# based on an additive model where non_linear trends are fit 
# with yearly,weekly and daily seasonality,plus holiday effects.
#Using in faecebook forecasting 

#Mathematical form of prophet 
# y(t)=g(t)+s(t)+h(t)+E(t)
# Where,
#g(t)refers to trend 
#s(t) refers to seasonality 
#h(t) refers to effect of holidays to the forecast
#E(t) is the error term.

#Getting Wikipedia tend data
install.packages("wikipediatrens")
library(wikipediatrend)





