epc <- read.table("C://Work/household_power_consumption.txt", sep=';', header=T, na.strings=c("?"))
str(epc)
a <- subset(epc, epc$Date == "1/2/2007")
b <- subset(epc, epc$Date == "2/2/2007")

epc <- rbind (a,b)

epc$Date <- as.character(epc$Date)
epc$Time <- as.character(epc$Time)

Sys.setlocale("LC_TIME","C")
epc$DT <- as.POSIXct(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")
epc$DAY <- as.factor(weekdays(epc$DT))

str(epc)

plot(epc$DT, epc$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()
