household_power_consumption <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
power <- household_power_consumption[grep("1/2/2007|2/2/2007", household_power_consumption$Date),]