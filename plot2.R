## Get and clean the data
data <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
## add a new variable
data$dateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
head(data)
tail(data)


## Plot the data to a file here we keep the default file size of 480px by 480px
## as per requirement 
png(file="plot2.png")
plot(data$dateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

