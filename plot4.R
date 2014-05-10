# Read data
data <- read.csv2("household_power_consumption.txt", dec = ".", 
                  colClasses = c(rep("character", times = 2), rep("numeric", times = 7)), 
                  na.strings = "?")
# Select indicated rows
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
# Convert Date and Time variables to Date/Time classes
data <- cbind("datetime" = strptime(paste(data$Date, data$Time), 
        format = "%d/%m/%Y %H:%M:%S"), data[,-c(1,2)])

# Open .png file
png(file = "plot4.png")
# Set global graphical parameters
par(mfrow = c(2,2), mar = c(5.1, 4.1, 4.1, 2.1))
with(data, {
    # Plot top left graphic
    plot(datetime, Global_active_power, type = "l", xlab = "", 
         ylab = "Global Active Power")
    # Plot top right graphic
    plot(datetime, Voltage, type = "l")
    # Plot bottom left graphic
    plot(datetime, Sub_metering_1, type = "l", xlab = "", 
         ylab = "Energy sub metering")
    lines(datetime, Sub_metering_2, col = "red")
    lines(datetime, Sub_metering_3, col = "blue")
    legend(x = "topright", names(data)[c(6,7,8)], lty = 1, 
           col = c("black", "red", "blue"), bty = "n", cex = 0.9)
    # Plot bottom right graphic
    plot(datetime, Global_reactive_power, type = "l")
    
})
# Close .png file
dev.off()