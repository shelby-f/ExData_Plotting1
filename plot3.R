download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "powerdata.zip")
unzip("powerdata.zip")
power <- read.csv2(file = "household_power_consumption.txt", header = TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")

#date is in format year-month-day
power2 <- power[(power$Date >= "2007-02-01" & power$Date <= "2007-02-02"),]

library(lubridate)
power2$DT <- with(power2, ymd(Date) + hms(Time))

#Plot 3
png(file = "plot3.png")
plot(power2$DT, power2$Sub_metering_1, type = "l", ylab = "Energy submetering")
lines(power2$DT, power2$Sub_metering_2, col = "red")
lines(power2$DT, power2$Sub_metering_3, col = "blue")
legend(x = "topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lwd = 2)
dev.off()
