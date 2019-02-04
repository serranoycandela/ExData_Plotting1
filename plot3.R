download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata_data_household_power_consumption.zip", "curl")

unzip("exdata_data_household_power_consumption.zip")

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

household_power_consumption$Date <- as.Date(as.character(household_power_consumption$Date), format="%d/%m/%Y")

data <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )

png(filename = "plot3.png", width = 480, height = 480)


data$Time <- strptime(paste(as.character(data$Date),as.character(data$Time)),"%Y-%m-%d %H:%M:%S")

plot(data$Time, data$Sub_metering_1, type="n", main="",xlab="",
     ylab="Energy sub metering") 
lines(data$Time, data$Sub_metering_1) 
lines(data$Time, data$Sub_metering_2, col="red") 
lines(data$Time, data$Sub_metering_3, col="blue") 
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
