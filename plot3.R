################################################################################
# Coursera Data Science: Exploratory Data Analysis
# Course Project 1     : Plot 3
# Author               : Thomas Nüßlein
################################################################################

rm(list = ls())
Sys.setenv(LANG = "en")
Sys.setlocale("LC_ALL","English")

#reading power consumption data (source file: household_power_consumption.txt)
sourceFile <- "household_power_consumption.txt"
powerConsumptionFull <- read.table(sourceFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# convert the date variable to Date class
powerConsumptionFull$Date <- as.Date(powerConsumptionFull$Date, format = "%d/%m/%Y")

# Subset the data
powerConsumption <- subset(powerConsumptionFull, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
powerConsumption$datetime <- strptime(paste(powerConsumption$Date, powerConsumption$Time), "%Y-%m-%d %H:%M:%S")
powerConsumption$datetime <- as.POSIXct(powerConsumption$datetime)

globalActivePower <- as.numeric(powerConsumption$Global_active_power)

# open graphics device png
attach(powerConsumption)
png("plot3.png", width=480, height=480)

plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")

lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
detach(powerConsumption)
