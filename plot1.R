source("getdata.R")

data <- getdata()

png(filename = "plot1.png",
    height = 480,
    width = 480,
    units = "px",
    bg = "transparent")

hist(data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequence")

dev.off()