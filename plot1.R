download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata_data_household_power_consumption.zip", "curl")

unzip("exdata_data_household_power_consumption.zip")

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

household_power_consumption$Date <- as.Date(as.character(household_power_consumption$Date), format="%d/%m/%Y")

data <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )

png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.off()
