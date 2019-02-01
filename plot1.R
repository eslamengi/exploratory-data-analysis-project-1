# read the text file
data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

# subsetting 2007-02-01 and 2007-02-02 days only
subData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007" )

# launch png graphic device

png(filename = "plot1.png", width = 480, height = 480 )

# plotting the histogram

hist(as.numeric(as.character(subData$Global_active_power)), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#close png graphic device

dev.off()

