#read and load data
Data = read.table("household_power_consumption.txt", sep = ";", header = T)
SubData = subset(Data, as.Date(Data[, 1], format = "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(Data[, 1], format = "%d/%m/%Y") == as.Date("2007-02-02"))

#plot1
png(filename = "plot1.png")
hist(as.numeric(as.character(SubData$Global_active_power)), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
