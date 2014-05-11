mydates <- as.Date(c("2007-02-01", "2007-02-02"))
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)[as.Date(read.table("household_power_consumption.txt", sep=";", header=TRUE)$Date,  "%d/%m/%Y") %in% mydates,]
hist(as.numeric(power$Global_active_power[power$Global_active_power!="?"]), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

