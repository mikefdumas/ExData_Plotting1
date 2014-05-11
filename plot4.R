setwd("/Users/udumami/coursera/exdata/")
data = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data[, 1] = as.Date(data[, 1], format="%d/%m/%Y")

s = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
s_dates = paste(s[,1], s[, 2])
dates = as.POSIXct(s_dates)

png("plot4.png", width=480, height=480)

par(mfrow=c(2, 2))

# Plot 1
s[, 3] = as.double(s[, 3])
plot(dates, s[, 3], type="l", ylab="Global Active Power", xlab="")

# Plot 2
plot(dates, s[, 5], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(dates, s[, 7], type="l", ylab="Energy sub metering", xlab="", col=1)
lines(dates, s[, 8], col=2, type="l")
lines(dates, s[, 9], col=4, type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("1", "2" , "4"), lwd=c(2.5, 2.5), bty="n") 

# Plot 4
plot(dates, s[, 4], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()