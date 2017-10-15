# read data from txt file
originalDataset <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?")

# convert Date to Date type
originalDataset$Date <- as.Date(originalDataset$Date, format="%d/%m/%Y")

# subset data
croppedData <- subset(originalDataset,Date >= "2007-02-01" & Date <= "2007-02-02")

# convert Time to Date class
dateAndTime <- paste(as.Date(croppedData$Date), croppedData$Time)
croppedData$Time <- as.POSIXct(dateAndTime)

# plot
plot(croppedData$Sub_metering_1~croppedData$Time, type="l",col="black",ylab="Energy sub metering", xlab="")
lines(croppedData$Sub_metering_2~croppedData$Time, col="red")
lines(croppedData$Sub_metering_3~croppedData$Time, col="blue")

#add legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#make png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()