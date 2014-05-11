setwd("/Users/udumami/coursera/exdata/")
data = read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data[, 1] = as.Date(data[, 1], format="%d/%m/%Y")

png("plot1.png", width=480, height=480)

s = subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
s[, 3] = as.double(s[, 3])
hist(s[, 3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()