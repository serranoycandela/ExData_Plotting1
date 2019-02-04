household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

household_power_consumption$Date <- as.Date(as.character(household_power_consumption$Date), format="%d/%m/%Y")

data <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )

data$datetime <- strptime(paste(as.character(data$Date),as.character(data$Time)),"%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
with(data, {
  plot(datetime, Global_active_power, type="n", main="",xlab="",
       ylab="Global Active Power") 
  lines(datetime, Global_active_power) 
  plot(datetime, Voltage, type="n", main="")
  lines(datetime, Voltage)
  plot(datetime, Sub_metering_1, type="n", main="",xlab="",
       ylab="Energy sub metering") 
  lines(datetime, Sub_metering_1) 
  lines(datetime, Sub_metering_2, col="red") 
  lines(datetime, Sub_metering_3, col="blue") 
  legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
  plot(datetime, Global_reactive_power, type="n", main="")
  lines(datetime, Global_reactive_power)
})

dev.off()
