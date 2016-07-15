#Read file

data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)

#Convert date to dateTime

data$Date <- paste(data$Date , data$Time)
data$Date <- strptime(data$Date, format = "%d/%m/%Y %H:%M:%S")

# Read only Data that we are interested in
dData <- subset(data, Date > "2007-02-01" & Date < "2007-02-03") 

#set up to write to
png("Plot1.png")

#Create plot

hist(dData$Global_active_power, main="Global Active Power", xlab="Global Active Power(Kilowats)", col="Red")

dev.off()