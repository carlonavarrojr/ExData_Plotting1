#GetRelevantData.sh filtered needed data into household_subset.txt 

library(lubridate)
library(dplyr)

house2 <- read.csv2("household_subset.txt")
house2 <- mutate(house2, DateTime = dmy_hms(paste(house2$Date, house2$Time)))

# read data as time / numeric                                                                                                                                                                                                                                                        
house2$Time <- hms(house2$Time)
house2$Global_active_power <- as.numeric(as.character(house2$Global_active_power))
house2$Global_reactive_power <- as.numeric(as.character(house2$Global_reactive_power))
house2$Voltage <- as.numeric(as.character(house2$Voltage))
house2$Global_intensity <- as.numeric(as.character(house2$Global_intensity))
house2$Sub_metering_1 <- as.numeric(as.character(house2$Sub_metering_1))
house2$Sub_metering_2 <- as.numeric(as.character(house2$Sub_metering_2))
house2$Sub_metering_3 <- as.numeric(as.character(house2$Sub_metering_3))

#Plot 4
par(mfrow = c(2,2))

plot(house2$DateTime,house2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(house2$DateTime,house2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(house2$DateTime, house2$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub Metering")
lines(house2$DateTime, house2$Sub_metering_1, col = "black", type = "l")
lines(house2$DateTime, house2$Sub_metering_2, col = "red", type = "l")
lines(house2$DateTime, house2$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = c(1,1,1), cex = 0.3)

plot(house2$DateTime,house2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png,file = "plot4.png")
dev.off()