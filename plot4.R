## Download Electric Power Consumption Dataset using link on Couursera project page to the working directory 
## and unzip (extract) the data file
## Source of dataset file is http://archive.ics.uci.edu/ml/
## Dataset file is located at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## 1 - Download the zipped file and put it in the "ProjectData4" folder using download.file function - creat destination
  ## directory if it doesn't already exist

  if(!file.exists("./ProjectData4")){
  dir.create("./ProjectData4")
  }
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## download.file(fileUrl,destfile="./ProjectData4/Dataset.zip",method="curl") ===>>> don't need method="curl" on Windows Platform

  download.file(fileUrl,destfile="./ProjectData4/Dataset.zip")

## 2 - Unzip the file using unzip function

  unzip("./ProjectData4/Dataset.zip", exdir="./ProjectData4")
  list.files("./ProjectData4")

## Shows unzipped dataset file is in the ProjectData folder

## 3 - Get the data for the days of interest using read.table function and then subsetting out the required days

  datafile <- "./ProjectData4/household_power_consumption.txt"
  Alldata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  str(Alldata)

## Shows all of the data has been captured - 2,075,259 observations and 9 variables

  subsetAlldata <- Alldata[Alldata$Date %in% c("1/2/2007","2/2/2007") ,]
  str(subsetAlldata)

## Shows only the data for the applicable days has been captured - 2,880 observations and 9 variables

## 4 - Get the data ( date, time, global active power, voltage, sub metering 1, sub metering 2, 
  ## submetering 3, global reactive power) to be used for plot 4 by further subsetting the data from the days of interest

  datetime <- strptime(paste(subsetAlldata$Date, subsetAlldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  globalActivePower <- as.numeric(subsetAlldata$Global_active_power)
  voltage <- as.numeric(subsetAlldata$Voltage)
  subMetering1 <- as.numeric(subsetAlldata$Sub_metering_1)
  subMetering2 <- as.numeric(subsetAlldata$Sub_metering_2)
  subMetering3 <- as.numeric(subsetAlldata$Sub_metering_3)
  globalReactivePower <- as.numeric(subsetAlldata$Global_reactive_power)
  str(datetime)
  str(globalActivePower)
  str(voltage)
  str(subMetering1)
  str(subMetering2)
  str(subMetering3)
  str(globalReactivePower)

## Shows only the data for the applicable variables have been captured

## 5 - direct the graphical output such that the output is not to the terminal but rather the working directory 
  ## using png() and then creating the specified plot 4 using plot() to match the required plot
  ## there will be 4 plots arranged in a 2 x 2 array using par()
  ## designate the x-axis and y-axis labels to match the required plots
  ## overlay sub metering 2 and 3 onto submeterin 1 plot and create legend

  png("plot4.png", width=480, height=480)
  par(mfrow = c(2, 2)) 
  plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(datetime, subMetering2, type="l", col="red")
  lines(datetime, subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

## 6 - Return the output to the terminal using dev.off()

dev.off()

# 7 - This last step simply lets you see plot 3 displayed on the terminal

  par(mfrow = c(2, 2)) 
  plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(datetime, subMetering2, type="l", col="red")
  lines(datetime, subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")