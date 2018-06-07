#Store the data file full path in the variable "file"
file <- "C:/Coursera/ExploratoryDataAnalysis/ExData_Plotting1/household_power_consumption_dataset/household_power_consumption.txt"

#Load data into variable data
#Contains header in the data file
#; is the field separateer character
#Don't convert vectors to factors
#. is the character used in the file for decimal point
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting data to 2007-02-01 and 2007-02-01
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

#Convert columns to numeric data type
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)
globalActivePower <- as.numeric(subsetData$Global_active_power)
voltage <- as.numeric(subsetData$Voltage)
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)

#Concate date and time together
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2))
#Plot Global ACtive Power graph
plot(datetime, globalActivePower, type="l", xlab = "", ylab = "Global Active Power")
#Plot Voltage graph
plot(datetime, voltage, type="l", ylab = "Voltage")
#Plot Energy Sub Metering graph
plot(datetime, subMetering1, type="l", xlab = "", ylab = "Energy sub metering")
lines(datetime, subMetering2, type="l", col= "red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")
#Plot Global Reactive Power graph
plot(datetime, globalReactivePower, type="l", ylab = "Global_reactive_power")

dev.off()