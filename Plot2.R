#Read file

data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)

#Convert date to dateTime

data$Date <- paste(data$Date , data$Time)
data$Date <- strptime(data$Date, format = "%d/%m/%Y %H:%M:%S")

# Read only Data that we are interested in

dData <- subset(data, Date > "2007-02-01" & Date < "2007-02-03") 


#set up to write to
png("Plot2.png")

#Create plot

plot(dData$Date,dData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(Kilowats)")

dev.off()