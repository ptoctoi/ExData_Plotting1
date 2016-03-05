
## Reading the library (sqldf) in order to read a subset of the file
#####################################################################

library(sqldf)

datafilter <- read.csv.sql(file = "C:\\household_power_consumption.txt", sql = "select * from file where Date='1/2/2007' or Date='2/2/2007' ",header = TRUE,sep = ";")

png("plot1.png", width = 480, height = 480)

## In order to make the graph we use hist
#########################################
hist(datafilter$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

