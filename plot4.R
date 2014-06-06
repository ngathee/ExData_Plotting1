## Get and clean the data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
## add a new variable
data$dateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)


## Plot the data to a file here we keep the default file size of 480px by 480px
## as per requirement 
png(file = "plot4.png")
par(mfcol = c(2, 2))
with(data, {
        plot(data$dateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "") 
        
        plot(data$dateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering" )
        lines(data$dateTime, data$Sub_metering_1, col = "black")
        lines(data$dateTime, data$Sub_metering_2, col = "red")
        lines(data$dateTime, data$Sub_metering_3, col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Submetering_1", "Submetering_2", "Submetering_3"), bty = "n")
        
        plot(data$dateTime, data$Voltage, type="l", ylab="Voltate", xlab = "datetime")
        
        plot(data$dateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
        
})
dev.off()