# This function read the data from the household power consumption 
# between 2007-02-01 and 2007-02-02 and return it
#
# If the "exdata-data-household_power_consumption.zip" file didn't exists, the
# function'll download from the course URL
getdata <- function () {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  fileName <- "exdata-data-household_power_consumption.zip"
  
  if (!file.exists(fileName)) {
    download.file(url, destfile=fileName, method="curl")
  }
  
  txtFile <- unz(fileName, "household_power_consumption.txt")
  
  raw <- grep("^[1-2]/2/2007", readLines(txtFile), value = T)
  raw <- read.csv(textConnection(raw), sep=";")
  names(raw) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  
  close(txtFile)
  
  raw
}