##  plot4.R
##  Create a graph of energy sub metering over the course of specified days

##  load libraries
library(lubridate)

##  set up data
mydates <- as.Date(c("2007-02-01", "2007-02-02"))  # define dates for which to graph measurements
power <- read.table("../household_power_consumption.txt", sep=";", header=TRUE)[as.Date(read.table("../household_power_consumption.txt", sep=";", header=TRUE)$Date,  "%d/%m/%Y") %in% mydates,]


##  set up graph
graph_dates <- with(power[power$Date !="?" & power$Time !="?" & power$Global_active_power !="?" & power$Global_reactive_power !="?" & power$Voltage !="?" & power$Sub_metering_1 !="?" & power$Sub_metering_2 !="?" & power$Sub_metering_3 !="?",], dmy_hms(paste(Date, Time, sep=" ")))

png(file="plot4.png", width=480, height=480, bg="transparent")
par(bg=NA)  # set background to transparent
par(mfrow=c(2,2))
with(power, {

##  draw global active power graph
with(power[power$Global_active_power!="?",], plot(graph_dates, as.numeric(as.character(Global_active_power)), type="l", main=NA, xlab=NA, ylab="Global Active Power"))

##  draw voltage graph
with(power[power$Voltage!="?",], plot(graph_dates, as.numeric(as.character(Voltage)), type="l", main=NA, xlab="datetime", ylab="Voltage"))


##  draw submetering graph 
with(power[power$Date !="?" & power$Time !="?" & power$Sub_metering_1 !="?" & power$Sub_metering_2 !="?" & power$Sub_metering_3 !="?",], plot(graph_dates, as.numeric(as.character(Sub_metering_1)), type="l", col="black", main=NA, xlab=NA, ylab="Energy sub metering"))
with(power[power$Date !="?" & power$Time !="?" & power$Sub_metering_1 !="?" & power$Sub_metering_2 !="?" & power$Sub_metering_3 !="?",], lines(graph_dates, as.numeric(as.character(Sub_metering_2)), col="red"))
with(power[power$Date !="?" & power$Time !="?" & power$Sub_metering_1 !="?" & power$Sub_metering_2 !="?" & power$Sub_metering_3 !="?",], lines(graph_dates, as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", lty=c(1,1), bty="n", xjust=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##  draw global reactive power graph
with(power[power$Global_reactive_power!="?",], plot(graph_dates, as.numeric(as.character(Global_reactive_power)), type="l", main=NA, xlab="datetime", ylab="Global_reactive_power"))


})


##  save to png

## dev.copy(png, file="plot4.png", width=480, height=480)  # save to file 
dev.off()  # and close device