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

#Convert Global_active_power column to numeric data type
globalActivePower <- as.numeric(subsetData$Global_active_power)

#Concate date and time together
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480, units = "px")

#Plot graph
plot(datetime, globalActivePower, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()