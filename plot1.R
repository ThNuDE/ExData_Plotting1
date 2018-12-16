################################################################################
# Coursera Data Science: Exploratory Data Analysis
# Course Project 1     : Plot 1
# Author               : Thomas Nüßlein
################################################################################

#reading power consumption data (source file: household_power_consumption.txt)
sourceFile <- "household_power_consumption.txt"
powerConsumptionFull <- read.table(sourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# convert the date variable to Date class
powerConsumptionFull$Date <- as.Date(powerConsumptionFull$Date, format = "%d/%m/%Y")

# Subset the data
powerConsumption <- subset(powerConsumptionFull, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
powerConsumption$datetime <- strptime(paste(powerConsumption$Date, powerConsumption$Time), "%Y-%m-%d %H:%M:%S")

globalActivePower <- as.numeric(powerConsumption$Global_active_power)

# open graphics device png
png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

