# read data from txt file
originalDataset <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?")

# convert Date to Date type
originalDataset$Date <- as.Date(originalDataset$Date, format="%d/%m/%Y")

# subset data
croppedData <- subset(originalDataset,Date >= "2007-02-01" & Date <= "2007-02-02")

# convert Time to Date class
dateAndTime <- paste(as.Date(croppedData$Date), croppedData$Time)
croppedData$Time <- as.POSIXct(dateAndTime)

# plot and make png
plot(croppedData$Global_active_power~croppedData$Time, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()