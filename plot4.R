source("getdata.R")

data <- getdata()

png(filename = "plot4.png",
    height = 480,
    width = 480,
    units = "px",
    bg = "transparent")

data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

with(data, {
  # 1,1
  plot(datetime, Global_active_power,
       type = "l",
       xlab = "",
       ylab = "Global Active Power")
  
  # 1,2
  plot(datetime, Voltage,
       type = "l")
  
  # 2,1
  plot(data$datetime, data$Sub_metering_1,
       type = "l",
       col = "black",
       xlab = "",
       ylab = "Energy sub metering")
  lines(data$datetime, data$Sub_metering_2, col = "red")
  lines(data$datetime, data$Sub_metering_3, col = "blue")
  legend("topright",
         bty = 'n',
         lwd = 2,
         col = c("black", "red", "blue"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # 2,2
  plot(datetime, Global_reactive_power,
       type = "l")
})

dev.off()