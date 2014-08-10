#read and load data
Data = read.table("household_power_consumption.txt", sep = ";", header = T)
SubData = subset(Data, as.Date(Data[, 1], format = "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(Data[, 1], format = "%d/%m/%Y") == as.Date("2007-02-02"))

#convert date and time to ptime
NewDate = strptime(paste(SubData$Date,SubData$Time), "%d/%m/%Y %H:%M:%S")

#plot3
png(filename = "plot3.png")
plot(NewDate, as.numeric(as.character(SubData$Sub_metering_1)), type = "l", xlab = "", ylab = "Energy sub metering")
lines(NewDate, as.numeric(as.character(SubData$Sub_metering_2)), col = "red")
lines(NewDate, as.numeric(as.character(SubData$Sub_metering_3)), col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()