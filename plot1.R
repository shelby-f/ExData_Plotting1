download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "powerdata.zip")
unzip("powerdata.zip")
power <- read.csv2(file = "household_power_consumption.txt", header = TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")

#date is in format year-month-day
power2 <- power[(power$Date >= "2007-02-01" & power$Date <= "2007-02-02"),]

library(lubridate)
power2$DT <- with(power2, ymd(Date) + hms(Time))

#Plot 1: Global Active Power 
png(file = "plot1.png")
power2$Global_active_power <- as.numeric(power2$Global_active_power)
hist(power2$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")
dev.off()
