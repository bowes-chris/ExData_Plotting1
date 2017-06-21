hpc <- read.delim("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
z <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",]

z$Global_active_power <- as.numeric(z$Global_active_power)
png(filename = "plot1.png", height = 480, width = 480, units = "px")
hist(z$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
