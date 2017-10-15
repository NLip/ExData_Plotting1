# read data from txt file
originalDataset <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?")

# convert Date to Date type
originalDataset$Date <- as.Date(originalDataset$Date, format="%d/%m/%Y")

# subset data
croppedData <- subset(originalDataset,Date >= "2007-02-01" & Date <= "2007-02-02")

# convert Time to Date class
dateAndTime <- paste(as.Date(croppedData$Date), croppedData$Time)
croppedData$Time <- as.POSIXct(dateAndTime)

# plot no.1
par(mfrow = c(2,2),mar = c(4,4,2,1),oma=c(0,0,2,0))
plot(croppedData$Global_active_power~croppedData$Time, type="l",ylab="Global Active Power", xlab="")

# plot no.2
plot(croppedData$Voltage~croppedData$Time, type="l",ylab="Voltage", xlab="datetime")

#plot no.3
plot(croppedData$Sub_metering_1~croppedData$Time, type="l",col="black",ylab="Energy sub metering", xlab="")
lines(croppedData$Sub_metering_2~croppedData$Time, col="red")
lines(croppedData$Sub_metering_3~croppedData$Time, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n", cex = 0.75, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot no. 4
plot(croppedData$Global_reactive_power~croppedData$Time, type="l", ylab="Global Rective Power",xlab="datetime")

#make png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()