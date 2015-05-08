flnm <- "household_power_consumption.txt"
set1 <- read.table(flnm, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")
set2 <- set1[set1$Date %in% c("1/2/2007","2/2/2007") ,]
rm(set1)

set2$Date <- as.Date(set2$Date, format="%d/%m/%Y")
dayseq <- paste(set2$Date, set2$Time)
dsq <- as.POSIXct(dayseq)

g_a_pwr <- as.numeric(set2$Global_active_power)
Sub_metering_1 <- as.numeric(set2$Sub_metering_1)
Sub_metering_2 <- as.numeric(set2$Sub_metering_2)
Sub_metering_3 <- as.numeric(set2$Sub_metering_3)

plot(dsq, Sub_metering_1, type="l", ylab="Energy Sub metering")
lines(dsq, Sub_metering_2, type="l", col="red")
lines(dsq, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3"), col=c("black", "red", "blue"),lty=1)

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()