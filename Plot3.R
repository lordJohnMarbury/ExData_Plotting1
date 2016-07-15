#Read file

data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)

#Convert date to dateTime

data$Date <- paste(data$Date , data$Time)
data$Date <- strptime(data$Date, format = "%d/%m/%Y %H:%M:%S")

# Read only Data that we are interested in

dData <- subset(data, Date > "2007-02-01" & Date < "2007-02-03") 

#set up to write to
png("Plot3.png")


#Create plot

plot(dData$Date,dData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dData$Date, dData$Sub_metering_2, col="red")
lines(dData$Date, dData$Sub_metering_3, col="blue")

legend("topright",
      col=c("black", "red", "blue"), 
      c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
      lty=1)

dev.off()