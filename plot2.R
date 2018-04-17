
## Reading the data (data file is in current working directory)

data_full <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", stringsAsFactors = F)
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

## Subsetting the data

data <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating Plot2

plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()