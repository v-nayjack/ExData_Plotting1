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
png("Plot3.png", width = 480, height = 480, units = "px")

## creating the plot with multiple data for plot3
with(data, plot(Time, Sub_metering_1, xlab = "", ylab = "Energy Sub Metering", pch ="", type = "l", col = "black"))
with(data, points(Time, Sub_metering_2, pch ="", type = "l", col = "red"))
with(data, points(Time, Sub_metering_3,pch ="", type = "l", col = "blue"))
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

