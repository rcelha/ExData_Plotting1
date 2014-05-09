source("getdata.R")

data <- getdata()

png(filename = "plot2.png",
    height = 480,
    width = 480,
    bg = "transparent")

data$DateAndTime <- strptime(paste(data$Date, data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

plot(data$DateAndTime, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()