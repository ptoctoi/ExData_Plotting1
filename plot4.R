
## Reading the library (sqldf) in order to read a subset of the file
#####################################################################

library(sqldf)

datafilter <- read.csv.sql(file = "C:\\household_power_consumption.txt", sql = "select * from file where Date='1/2/2007' or Date='2/2/2007' ",header = TRUE,sep = ";")

## Create timestamp variable DateTime
#####################################
DateTime <-strptime(paste(datafilter$Date, datafilter$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

## Add this variable to the date
################################
datafilter <- data.frame(datafilter,DateTime)

png("plot4.png", width = 480, height = 480)

## In order to make the graph we use plot
#########################################
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(datafilter$DateTime, datafilter$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(datafilter$DateTime, datafilter$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(datafilter$DateTime, datafilter$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datafilter$DateTime, datafilter$Sub_metering_2, type="l", col="red")
lines(datafilter$DateTime, datafilter$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(datafilter$DateTime, datafilter$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

dev.off()