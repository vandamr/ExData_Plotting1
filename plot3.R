
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

##plot3
png("plot3.png", width=480, height=480)
plot(data$datetime,data$Sub_metering_1,xlab=NA,type="n", ylab="Energy sub metering")
lines(data$datetime,data$Sub_metering_1)
lines(data$datetime,data$Sub_metering_2, col="red")
lines(data$datetime,data$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1)
dev.off()
