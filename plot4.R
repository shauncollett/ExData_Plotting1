if (!require("lubridate")) install.packages("lubridate")
library(lubridate)

#setwd("~/Temp/DataScienceDatasets")

# Load data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
                 na.strings="?", stringsAsFactors=FALSE)

# Filter to 2007-02-01 through 2007-02-02 as that's what we're interested in
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$DateTime <- dmy_hms(paste(data$Date, data$Time, sep=" "), tz="America/Los_Angeles")

# Adjust plot region to be 2 rows x 2 columns
plot.new()
par(mfcol = c(2,2))
par(mar = c(4,4,2,1))
# Plot 1 Upper Left
plot(range(data$DateTime), range(data$Global_active_power), type="n", xlab="",
     ylab="Global Active Power", cex.lab=.75, cex.axis=.75)
lines(data$DateTime, data$Global_active_power, type="l")

# Plot 2 Lower Left
plot(range(data$DateTime), range(data$Sub_metering_1), type="n", xlab="",
     ylab="Energy sub metering", cex.lab=.75, cex.axis=.75)
lines(data$DateTime, data$Sub_metering_1, type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), box.lty=0,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=.75,
       inset=c(0.2,0))

#Plot 3 Upper Right
plot(range(data$DateTime), range(data$Voltage), type="n", xlab="datetime",
     ylab="Voltage", cex.lab=.75, cex.axis=.75)
lines(data$DateTime, data$Voltage, type="l", col="black")

#Plot 4 Lower Right
plot(range(data$DateTime), range(data$Global_reactive_power), type="n", 
     xlab="datetime", ylab="Global_reactive_power", cex.lab=.75, cex.axis=.75)
lines(data$DateTime, data$Global_reactive_power, type="l", col="black")

# Copy plot to PNG file to keep structure.
dev.copy(png, file="plot4.png")
dev.off()