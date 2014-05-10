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
png(file = "plot3.png")
# Set global graphical parameters
par(mfrow = c(1,1), mar = c(5.1, 4.1, 2.1, 2.1))
# Plot three line graphics
with(data, {
    plot(datetime, data$Sub_metering_1, type = "l", 
         xlab = "", ylab = "Energy sub metering")
    lines(datetime, data$Sub_metering_2, col = "red")
    lines(datetime, data$Sub_metering_3, col = "blue")
})
# Add legend to plot
legend(x = "topright", names(data)[c(6,7,8)], lty = 1, 
       col = c("black", "red", "blue"), cex = 0.8)
# Close .png file
dev.off()