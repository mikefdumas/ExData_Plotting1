setwd("/Users/udumami/coursera/exdata/")
data = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data[, 1] = as.Date(data[, 1], format="%d/%m/%Y")

s = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
s_dates = paste(s[,1], s[, 2])
dates = as.POSIXct(s_dates)

png("plot3.png", width=480, height=480)

plot(dates, s[, 7], type="l", ylab="Energy sub metering", xlab="", col=1)
lines(dates, s[, 8], col=2, type="l")
lines(dates, s[, 9], col=4, type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("1", "2" , "4"), lwd=c(2.5, 2.5)) 

dev.off()