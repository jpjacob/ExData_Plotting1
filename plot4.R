#read data and subset

flnm <- "household_power_consumption.txt"
set1 <- read.table(flnm, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")
set2 <- set1[set1$Date %in% c("1/2/2007","2/2/2007") ,]
rm(set1)

#process data

set2$Date <- as.Date(set2$Date, format="%d/%m/%Y")
dayseq <- paste(set2$Date, set2$Time)
dsq <- as.POSIXct(dayseq)

g_a_pwr <- as.numeric(set2$Global_active_power)
g_ra_pwr <- as.numeric(set2$Global_reactive_power)

voltage <- as.numeric(set2$Voltage)

Sub_metering_1 <- as.numeric(set2$Sub_metering_1)
Sub_metering_2 <- as.numeric(set2$Sub_metering_2)
Sub_metering_3 <- as.numeric(set2$Sub_metering_3)

#generate plots and set using par and save

par(mfrow = c(2,2), mar= c(4,4,2,2))

plot(dsq, g_a_pwr, type="l", xlab="", ylab="Global Active Power")

plot(dsq, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dsq, Sub_metering_1, type="l", ylab="Energy Submetering",xlab="")
lines(dsq, Sub_metering_2, type="l", col="red")
lines(dsq, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3"), col=c("black", "red", "blue"),lty=1,bty="n",cex=0.7)

plot(dsq, g_ra_pwr, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
