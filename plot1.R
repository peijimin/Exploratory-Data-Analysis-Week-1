library(dplyr)
filename <- "exdata_data_household_power_consumption.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
}

# Checking if folder exists
if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}
Data <- read.table("household_power_consumption.txt",header=T, sep=';', na.strings="?")
plot1data <- subset(Data, Date %in% c("1/2/2007","2/2/2007"))
plot1data$Date <- as.Date(plot1data$Date, format="%d/%m/%Y")
hist(plot1data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
