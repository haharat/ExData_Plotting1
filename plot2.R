#read and load data
Data = read.table("household_power_consumption.txt", sep = ";", header = T)
SubData = subset(Data, as.Date(Data[, 1], format = "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(Data[, 1], format = "%d/%m/%Y") == as.Date("2007-02-02"))

#convert date and time to ptime
NewDate = strptime(paste(SubData$Date,SubData$Time), "%d/%m/%Y %H:%M:%S")

#plot2
png(filename = "plot2.png")
plot(NewDate, as.numeric(as.character(SubData$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()