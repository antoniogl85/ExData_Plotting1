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
png(file = "plot1.png")
# Set global graphical parameters
par(mfrow = c(1,1), mar = c(5.1, 4.1, 2.1, 2.1))
# Plot histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
# Close .png file
dev.off()
