
## load data into R and clean data limited to two days

setwd("C:/DataSci/Class4")
# read the raw table and limit to 2 days
variable.class<-c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('./household_power_consumption.txt',header=TRUE,sep=';',na.strings='?',colClasses=variable.class)
power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]

## create plot1 and write to plot1.png

hist(power.consumption$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()

