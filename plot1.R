
## read dataset into a data.table
fname <- "household_power_consumption.txt"
data <- read.csv(fname, sep = ";", na.strings="?")

## subset data for date range 01-02-2007 to 02-02-2007
data <- rbind(data[data$Date=="1/2/2007",], data[data$Date=="2/2/2007",])

## convert date and time
date <- as.character(data$Date)
time <- as.character(data$Time)
datetime <- paste(date, time)
datetime <- strptime(datetime, format="%d/%m/%Y %H:%M:%S")
data <- cbind(datetime,data)

par(mfrow=c(1,1))

## plot1
png("plot1.png", width=480, height=480)
hist(data$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
