download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./Data/ExData/exdata%2Fdata%2Fhousehold_power_consumption.zip", method ="curl")
data<-read.csv("./Data/ExData/household_power_consumption.txt", sep=";")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_intensity <-as.numeric(data$Global_intensity)
data$Sub_metering_1 <-as.numeric(data$Sub_metering_1 )
data$Sub_metering_2 <-as.numeric(data$Sub_metering_2 )
data$Sub_metering_3 <-as.numeric(data$Sub_metering_3 )
data2days <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"), ]

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data2days$Global_active_power,
     type="l",
     xlab="",
     xaxt="n",
     ylab="Global Active Power")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

plot(data2days$Voltage, type="l", xlab="datetime", xaxt="n", ylab="Voltage")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

plot(data2days$Sub_metering_1, type="l", xlab="", xaxt="n", ylab="Energy sub metering")
lines(data2days$Sub_metering_2, col="red")
lines(data2days$Sub_metering_3, col="blue")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
legend("topright",
       bty="n",
       lty=1,
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data2days$Global_reactive_power,
     type="l",
     xlab="datetime",
     xaxt="n",
     ylab="Global_reactive_power")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

dev.off()