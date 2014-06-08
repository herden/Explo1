download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./data/ExData/exdata%2Fdata%2Fhousehold_power_consumption.zip", method ="curl")
data<-read.csv("./data/ExData/household_power_consumption.txt", sep=";")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
data$Global_intensity <-as.numeric(data$Global_intensity)
data$Sub_metering_1 <-as.numeric(data$Sub_metering_1 )
data$Sub_metering_2 <-as.numeric(data$Sub_metering_2 )
data$Sub_metering_3 <-as.numeric(data$Sub_metering_3 )
data2days <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"), ]

png(filename="plot2.png", width=480, height=480)
plot(d$Global_active_power,
     type="l",
     xlab="",
     xaxt="n",
     ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.off()