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

par(mfrow=c(2,2), mar=c(4,4,1,1), oma = c(0,0,0,0))
plot(epc$DT, epc$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")

plot(epc$DT, epc$Voltage, type='l', xlab="datetime", ylab="Voltage")

plot(epc$DT, epc$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
lines(epc$DT, epc$Sub_metering_2, type='l', xlab="", ylab="Energy sub metering", col="red")
lines(epc$DT, epc$Sub_metering_3, type='l', xlab="", ylab="Energy sub metering", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex=0.5, col=c("black","red","blue"), bty="n")

plot(epc$DT, epc$Global_reactive_power, type='l', xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="Plot4.png")
dev.off()
