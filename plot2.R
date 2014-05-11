##  plot2.R
##  Create a graph of global active power in kilowatts over the course of specified days

##  load libraries
library(lubridate)

##  set up data
mydates <- as.Date(c("2007-02-01", "2007-02-02"))  # define dates for which to graph measurements
power <- read.table("../household_power_consumption.txt", sep=";", header=TRUE)[as.Date(read.table("../household_power_consumption.txt", sep=";", header=TRUE)$Date,  "%d/%m/%Y") %in% mydates,]

##  draw graph and save to png

par(bg=NA)  # set background to transparent
graph_dates <- with(power[power$Date !="?" & power$Time !="?" & power$Global_active_power !="?",], dmy_hms(paste(Date, Time, sep=" ")))
with(power[power$Global_active_power!="?",], plot(graph_dates, as.numeric(as.character(Global_active_power)), type="l", main=NA, xlab=NA, ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png", width=480, height=480)  # save to file 
dev.off()  # and close device