library(dplyr) ## loading the library to read the data

## reading the data
powerdata <- tbl_df(read.table ("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?","")))

## Coverting the date column
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")

## converting the time to POSIXIlt
powerdata$temptime <- paste(powerdata$Date, powerdata$Time) ## Combining two columns together

powerdata$Time <- strptime(powerdata$temptime, format = "%Y-%m-%d %H:%M:%S") ## the time is being converted to POSIXIlt

## subsetting the data
data <- subset(powerdata, Date>="2007-02-01" & Date<="2007-02-02")

## saving the png file
png("Plot4.png", width = 480, height = 480, units = "px")

## creating the multiple plots for plot4
par(mfcol= c(2,2))

with(data, {
        plot(Time,Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", pch ="", type = "l")
        
        plot(Time, Sub_metering_1, xlab = "", ylab = "Energy Sub Metering", pch ="", type = "l", col = "black")
        points(Time, Sub_metering_2, pch ="", type = "l", col = "red")
        points(Time, Sub_metering_3,pch ="", type = "l", col = "blue")
        legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        plot(Time,Voltage, xlab = "datetime", ylab = "Voltage", pch ="", type = "l")
        
        plot(Time,Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", pch ="", type = "l")
        
})

dev.off()