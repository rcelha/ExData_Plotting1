source("getdata.R")

data <- getdata()

png(filename = "plot3.png",
    height = 480,
    width = 480,
    units = "px",
    bg = "transparent")

data$DateAndTime <- strptime(paste(data$Date, data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")


with(data, {
  plot(data$DateAndTime, data$Sub_metering_1,
       type = "l",
       col = "black",
       xlab = "",
       ylab = "Energy sub metering")
  lines(data$DateAndTime, data$Sub_metering_2, col = "red")
  lines(data$DateAndTime, data$Sub_metering_3, col = "blue")
  legend("topright",  lwd = 3, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})



dev.off()