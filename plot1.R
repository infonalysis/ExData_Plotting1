##  plot1.R
##  Create a frequency histogram of the global active power in kilowatts

##  set up data
mydates <- as.Date(c("2007-02-01", "2007-02-02"))  # define dates for which to graph measurements
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)[as.Date(read.table("household_power_consumption.txt", sep=";", header=TRUE)$Date,  "%d/%m/%Y") %in% mydates,]

##  draw graph and save to png

par(bg=NA)  # set background to transparent
hist(as.numeric(as.character(power$Global_active_power[power$Global_active_power!="?"])), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")  # draw graph
dev.copy(png, file="plot1.png", width=480, height=480)  # save to file 
dev.off()  # and close device