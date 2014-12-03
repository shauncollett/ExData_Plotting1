if (!require("lubridate")) install.packages("lubridate")
library(lubridate)

#setwd("~/Temp/DataScienceDatasets")

# Load data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
                 na.strings="?", stringsAsFactors=FALSE)

# Filter to 2007-02-01 through 2007-02-02 as that's what we're interested in
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$DateTime <- dmy_hms(paste(data$Date, data$Time, sep=" "), tz="America/Los_Angeles")

# Create plot and save to png file.  width = 480; height = 480
png(file = "plot3.png", bg = "white", width = 480, height = 480)
plot(range(data$DateTime), range(data$Sub_metering_1), type="n", xlab="",
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()