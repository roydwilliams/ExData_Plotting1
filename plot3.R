## Download Electric Power Consumption Dataset using link on Couursera project page to the working directory 
## and unzip (extract) the data file
## Source of dataset file is http://archive.ics.uci.edu/ml/
## Dataset file is located at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## 1 - Download the zipped file and put it in the "ProjectData3" folder using download.file function - creat destination
  ## directory if it doesn't already exist

  if(!file.exists("./ProjectData3")){
  dir.create("./ProjectData3")
  }
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## download.file(fileUrl,destfile="./ProjectData3/Dataset.zip",method="curl") ===>>> don't need method="curl" on Windows Platform

  download.file(fileUrl,destfile="./ProjectData3/Dataset.zip")

## 2 - Unzip the file using unzip function

  unzip("./ProjectData3/Dataset.zip", exdir="./ProjectData3")
  list.files("./ProjectData3")

## Shows unzipped dataset file is in the ProjectData folder

## 3 - Get the data for the days of interest using read.table function and then subsetting out the required days

  datafile <- "./ProjectData3/household_power_consumption.txt"
  Alldata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  str(Alldata)

## Shows all of the data has been captured - 2,075,259 observations and 9 variables

  subsetAlldata <- Alldata[Alldata$Date %in% c("1/2/2007","2/2/2007") ,]
  str(subsetAlldata)

## Shows only the data for the applicable days has been captured - 2,880 observations and 9 variables

## 4 - Get the data ( date, time, global active power, sub metering 1, sub metering 2, submetering 3) to be used 
  ## for plot 3 by further subsetting the data from the days of interest

  datetime <- strptime(paste(subsetAlldata$Date, subsetAlldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  globalActivePower <- as.numeric(subsetAlldata$Global_active_power)
  subMetering1 <- as.numeric(subsetAlldata$Sub_metering_1)
  subMetering2 <- as.numeric(subsetAlldata$Sub_metering_2)
  subMetering3 <- as.numeric(subsetAlldata$Sub_metering_3)
  str(datetime)
  str(globalActivePower)
  str(subMetering1)
  str(subMetering2)
  str(subMetering3)

## Shows only the data for the applicable variables have been captured

## 5 - direct the graphical output such that the output is not to the terminal but rather the working directory 
  ## using png() and then creating the specified plot 3 using plot() to match the required plot - designate the y-axis 
  ## label as "Energy sub metering" - overlay sub metering 2 and 3 onto sub metering 1 using lines() and set color equal
  ## to red for #2 and blue for #3 - also create a legend at the top right of the plot using legend()

  png("plot3.png", width=480, height=480)
  plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(datetime, subMetering2, type="l", col="red")
  lines(datetime, subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## 6 - Return the output to the terminal using dev.off()

  dev.off()

# 7 - This last step simply lets you see plot 3 displayed on the terminal

  plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(datetime, subMetering2, type="l", col="red")
  lines(datetime, subMetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))