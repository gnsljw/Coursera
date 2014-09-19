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

par(mfrow=c(1,1), mar=c(4,4,1,1), oma = c(0,0,2,0))
hist(epc$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()
