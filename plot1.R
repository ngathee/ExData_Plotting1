## Get and clean the data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
data$Global_active_power <- as.numeric(data$Global_active_power)

## Plot the data to a file here we keep the default file size of 480px by 480px
## as per requirement 
png(file="plot1.png")
par(mar = c(2, 2, 1, 1), mai = c(1,1,1,1))
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")
dev.off()


