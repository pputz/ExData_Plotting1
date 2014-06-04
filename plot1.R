## delete all objects; clear plots
rm(list=ls()); dev.off()


## Read data for 1/2/2007 and 2/2/2007 only;
## create new DateTime variable with class "Date"

header <- read.table("data/household_power_consumption.txt", 
                     sep=";", nrows=1, stringsAsFactors=F)

PowerConsum <- read.table(pipe('grep \'^[12]/2/2007\' data/*'), 
                          sep=";", na.strings="?", col.names=header)

# PowerConsum$DateTime <- as.Date(strptime(
#     paste(PowerConsum$Date, PowerConsum$Time, sep = " "),
#     format = "%d/%m/%Y %H:%M:%S"))


## Histogram "Global Active Power"

par(cex = 0.9)
hist(PowerConsum$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")


## Write png file 480 x 480 pixels
dev.copy(png, filename="plot1.png", width = 480, height = 480, units = "px")
dev.off()
