setwd("/Users/udumami/coursera/exdata/")
data = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data[, 1] = as.Date(data[, 1], format="%d/%m/%Y")

s = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
s_dates = paste(s[,1], s[, 2])
dates = as.POSIXct(s_dates)

png("plot2.png", width=480, height=480)

s[, 3] = as.double(s[, 3])
plot(dates, s[, 3], type="l", ylab="Global Active Power (kilowatts)")

dev.off()