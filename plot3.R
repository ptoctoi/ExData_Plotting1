
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

png("plot3.png", width = 480, height = 480)

## In order to make the graph we use plot
#########################################
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(datafilter$DateTime, datafilter$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(datafilter$DateTime, datafilter$Sub_metering_2, col=columnlines[2])
lines(datafilter$DateTime, datafilter$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

dev.off()