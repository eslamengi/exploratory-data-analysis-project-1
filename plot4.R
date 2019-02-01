# load lubridate package

library(lubridate)

# read the text file
data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

# subsetting 2007-02-01 and 2007-02-02 days only
subData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007" )

# Data and Time columns processing using lubridate package

dateTime <- dmy_hms(paste(subData$Date, subData$Time, sep=" "))

# launch png graphic device

png(filename = "plot4.png", width = 480, height = 480 )

# Use parameters in par function to adjust margins and plots distribution

par(mfrow = c(2, 2), mar = c(4,4,2,1)) 

# plotting and annotation

plot(dateTime, as.numeric(as.character(subData$Global_active_power)), type = "l", xlab = "" , ylab = "Global Active Power")

plot(dateTime, as.numeric(as.character(subData$Voltage)), type = "l", xlab = "datatime" , ylab = "Voltage")

plot(dateTime, as.numeric(as.character(subData$Sub_metering_1)), col = "black", type = "l", xlab = "" , ylab = "Energy sub metering")
lines(dateTime, as.numeric(as.character(subData$Sub_metering_2)), col = "red")
lines(dateTime, subData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(dateTime, as.numeric(as.character(subData$Global_reactive_power)), type = "l", xlab = "datatime" , ylab = "Global_reactive_power")

#close png graphic device

dev.off()