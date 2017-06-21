hpc <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
z <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",]
z$DateTime <- paste(z$Date, z$Time, sep = " ")
z$DateTime <- as.POSIXct(z$DateTime)

png(filename = "plot2.png", height = 480, width = 480, units = "px")
plot(z$DateTime, z$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
