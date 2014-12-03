#setwd("~/Temp/DataScienceDatasets")

# Load data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", 
                 na.strings="?", stringsAsFactors=FALSE)

# Filter to 2007-02-01 through 2007-02-02 as that's what we're interested in
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Create histogram and save to png file.  width = 480; height = 480
png(file = "plot1.png", bg = "white", width = 480, height = 480)
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()