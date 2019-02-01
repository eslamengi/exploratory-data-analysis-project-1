# load lubridate package

library(lubridate)

# read the text file
data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

# subsetting 2007-02-01 and 2007-02-02 days only
subData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007" )

# Data and Time columns processing using lubridate package

dateTime <- dmy_hms(paste(subData$Date, subData$Time, sep=" "))

# launch png graphic device

png(filename = "plot2.png", width = 480, height = 480 )

# plotting

plot(dateTime, as.numeric(as.character(subData$Global_active_power)), type = "l", xlab = "" , ylab = "Global Active Power (kilowatts)")

#close png graphic device

dev.off()