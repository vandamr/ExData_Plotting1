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

## plot4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
## plot4.1
plot(data$datetime,data$Global_active_power,xlab=NA,type="n", ylab="Global Active Power")
lines(data$datetime,data$Global_active_power)
##plot 4.2
plot(data$datetime,data$Voltage,xlab="datetime",type="n", ylab="Voltage")
lines(data$datetime,data$Voltage)
##plot4.3
plot(data$datetime,data$Sub_metering_1,xlab=NA,type="n", ylab="Energy sub metering")
lines(data$datetime,data$Sub_metering_1)
lines(data$datetime,data$Sub_metering_2, col="red")
lines(data$datetime,data$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, bty="n")
##plot4.4
plot(data$datetime,data$Global_reactive_power,xlab="datetime", ylab="Global_reactive_power", type="n")
lines(data$datetime,data$Global_reactive_power)
dev.off()

