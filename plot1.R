## Download Electric Power Consumption Dataset using link on Couursera project page to the working directory 
 ## and unzip (extract) the data file
## Source of dataset file is http://archive.ics.uci.edu/ml/
## Dataset file is located at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## 1 - Download the zipped file and put it in the "ProjectData1" folder using download.file function - creat destination
  ## directory if it doesn't already exist

if(!file.exists("./ProjectData1")){
  dir.create("./ProjectData1")
}
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## download.file(fileUrl,destfile="./ProjectData1/Dataset.zip",method="curl") ===>>> don't need method="curl" on Windows Platform

    download.file(fileUrl,destfile="./ProjectData1/Dataset.zip")

## 2 - Unzip the file using unzip function

    unzip("./ProjectData1/Dataset.zip", exdir="./ProjectData1")
    list.files("./ProjectData1")

## Shows unzipped dataset file is in the ProjectData folder

## 3 - Get the data for the days of interest using read.table function and then subsetting out the required days

  datafile <- "./ProjectData1/household_power_consumption.txt"
  Alldata <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  str(Alldata)

## Shows all of the data has been captured - 2,075,259 observations and 9 variables

  subsetAlldata <- Alldata[Alldata$Date %in% c("1/2/2007","2/2/2007") ,]
  str(subsetAlldata)

## Shows only the data for the applicable days has been captured - 2,880 observations and 9 variables

## 4 - Get the data ( global active power) to be used for plot 1 by further subsetting the data from the days of interest

  globalActivePower <- as.numeric(subsetAlldata$Global_active_power)
  str(globalActivePower)

## Shows only the data for the applicable variable has been captured

## 5 - direct the graphical output such that the output is not to the terminal but rather the working directory 
## using png() and then creating the specified plot 1 - to match the required plot, designate the graph color to be
## red, title the graph "Global Active Power" and specify the x-axis label as "Global Active Power (kilowatts)"

  png("plot1.png", width=480, height=480)
  hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## 6 - Return the output to the terminal using dev.off()

  dev.off()

# 7 - This last step simply lets you see plot 1 displayed on the terminal

  hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")