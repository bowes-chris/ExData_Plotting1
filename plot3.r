hpc <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
z <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",]
z$DateTime <- paste(z$Date, z$Time, sep = " ")
z$DateTime <- as.POSIXct(z$DateTime)

png(filename = "plot3.png", height = 480, width = 480, units = "px")
plot(z$DateTime, z$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(z$DateTime, z$Sub_metering_2, col= "Red")
lines(z$DateTime, z$Sub_metering_3, col= "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"), lty = 1)
dev.off()
