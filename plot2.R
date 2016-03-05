
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

png("plot2.png", width = 480, height = 480)

## In order to make the graph we use plot
#########################################
plot(datafilter$DateTime, datafilter$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

