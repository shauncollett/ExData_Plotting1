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
png(file = "plot2.png", bg = "white", width = 480, height = 480)
plot(range(data$DateTime), range(data$Global_active_power), type="n", xlab="",
     ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power, type="l")
dev.off()