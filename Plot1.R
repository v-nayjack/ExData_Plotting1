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
png("Plot1.png", width = 480, height = 480, units = "px")
## creating the histogram for plot1
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()