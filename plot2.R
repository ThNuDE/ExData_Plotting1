################################################################################
# Coursera Data Science: Exploratory Data Analysis
# Course Project 1     : Plot 2
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
png("plot2.png", width=480, height=480)

plot(Global_active_power ~ datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
detach(powerConsumption)
