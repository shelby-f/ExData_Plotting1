download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "powerdata.zip")
unzip("powerdata.zip")
power <- read.csv2(file = "household_power_consumption.txt", header = TRUE)
power$Date <- as.Date(power$Date, "%d/%m/%Y")

#date is in format year-month-day
power2 <- power[(power$Date >= "2007-02-01" & power$Date <= "2007-02-02"),]

library(lubridate)
power2$DT <- with(power2, ymd(Date) + hms(Time))


#Plot 4
png(file = "plot4.png")
par(mfrow = c(2, 2))
plot(power2$DT, power2$Global_active_power, type = "l",
     ylab = "Global Active Power")
plot(power2$DT, power2$Voltage, type = "l",
     ylab = "Voltage", xlab = "datetime")
plot(power2$DT, power2$Sub_metering_1, type = "l", ylab = "Energy submetering")
lines(power2$DT, power2$Sub_metering_2, col = "red")
lines(power2$DT, power2$Sub_metering_3, col = "blue")
legend(x = "topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lwd = 2)
plot(power2$DT, power2$Global_reactive_power, type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")
dev.off()