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

#Plot 2
plot(house2$DateTime,house2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()