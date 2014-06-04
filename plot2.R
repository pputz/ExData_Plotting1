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



## Line chart "Global Active Power over Time"
par(cex = 0.9)
with(PowerConsum, plot(datetime, Global_active_power,
                       type = "l",
                       ylab = "Global Active Power (kilowatts)",
                       xlab = ""))



## Write out png file 480 x 480 pixels
dev.copy(png, filename="plot2.png", width = 480, height = 480, units = "px")
dev.off()