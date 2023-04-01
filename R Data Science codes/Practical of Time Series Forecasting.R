#consider the inbuilt data set Air Passengers
data("AirPassengers")
#to know the format of data set here ts will tell that the
#data set belongs to time series format
class(AirPassengers)
#to know the start of time series
start(AirPassengers)
#to know the end of time series
end(AirPassengers)
#to know the frequency of the data set here 12 means that 
#the time series is on monthly basis
frequency(AirPassengers)
#to know the mean, median etc of the dataset
summary(AirPassengers)
#to plot the time series model
plot(AirPassengers)
#to plot the best fit line which can be used for regression
abline(reg=lm(AirPassengers~time(AirPassengers)))
#to plot the cycle across years 
cycle(AirPassengers)
#to aggregate the cycle and display its trend per year
plot(aggregate(AirPassengers,FUN=mean))
#to get the box plot 
boxplot(AirPassengers~cycle(AirPassengers))
