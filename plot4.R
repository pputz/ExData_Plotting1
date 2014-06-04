## delete all objects; clear plots
rm(list=ls()); dev.off()


## Read data for 1/2/2007 and 2/2/2007 only;
## create new datetime variable with class "POSIXlt"

header <- read.table("data/household_power_consumption.txt", 
                     sep=";", nrows=1, stringsAsFactors=F)

PowerConsum <- read.table(pipe('grep \'^[12]/2/2007\' data/*'), 
                          sep=";", na.strings="?", col.names=header)

PowerConsum$datetime <- strptime(
    paste(PowerConsum$Date, PowerConsum$Time, sep = " "),
    format = "%d/%m/%Y %H:%M:%S")



## 2 x 2 Plot

par(mfcol=c(2, 2), cex=0.7)

with(PowerConsum, plot(datetime, Global_active_power,
                       type = "l",
                       ylab = "Global Active Power (kilowatts)",
                       xlab = ""))

with(PowerConsum, plot(datetime, Sub_metering_1,
                       type = "l",
                       ylab = "Energy sub metering",
                       xlab = ""))
with(PowerConsum, lines(datetime, Sub_metering_2, type = "l", col = "red"))
with(PowerConsum, lines(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", box.lwd = 0, lty=c(rep('solid',3)),
       col=c("black", "red", "blue"), legend=names(PowerConsum[7:9]))

with(PowerConsum, plot(datetime, Voltage, type = "l", ylab = "Voltage"))

with(PowerConsum, plot(datetime, Global_reactive_power, type = "l"))


## Write out png file 480 x 480 pixels
dev.copy(png, filename="plot4.png", width = 480, height = 480, units = "px")
dev.off()
