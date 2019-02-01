# load lubridate package

library(lubridate)

# read the text file
data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

# subsetting 2007-02-01 and 2007-02-02 days only
subData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007" )

# Data and Time columns processing using lubridate package

dateTime <- dmy_hms(paste(subData$Date, subData$Time, sep=" "))

# launch png graphic device

png(filename = "plot3.png", width = 480, height = 480 )

# plotting and annotating the plot noting Sub_metering_1 and Sub_metering_2 are factors
# so we converted them to numeric class before plotting

plot(dateTime, as.numeric(as.character(subData$Sub_metering_1)), col = "black", type = "l", xlab = "" , ylab = "Energy sub metering")
lines(dateTime, as.numeric(as.character(subData$Sub_metering_2)), col = "red")
lines(dateTime, subData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#close png graphic device

dev.off()