#read data and subset

flnm <- "household_power_consumption.txt"
set1 <- read.table(flnm, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")
set2 <- set1[set1$Date %in% c("1/2/2007","2/2/2007") ,]
rm(set1)

#process data

set2$Date <- as.Date(set2$Date, format="%d/%m/%Y")

g_a_pwr <- as.numeric(set2$Global_active_power)

#generate and save plot

hist(g_a_pwr, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
