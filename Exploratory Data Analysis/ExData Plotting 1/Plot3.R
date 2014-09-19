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

plot(epc$DT, epc$Sub_metering_1, type='l', xlab="", ylab="Energy sub metering")
lines(epc$DT, epc$Sub_metering_2, type='l', xlab="", ylab="Energy sub metering", col="red")
lines(epc$DT, epc$Sub_metering_3, type='l', xlab="", ylab="Energy sub metering", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7, xjust=0, lty=1, col=c("black","red","blue"))
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()
