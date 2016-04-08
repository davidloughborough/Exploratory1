##Read in Data and Make with Only Selected Days
householdData <- read.table("~/Desktop/household_power_consumption.txt", header = T, sep=";")
householdData <- householdData[householdData$Date %in% c("1/2/2007","2/2/2007"),]

##Making Time Variables and Merging with Household Data
SetTime <-strptime(paste(householdData$Date, householdData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
householdData <- cbind(SetTime, householdData)

##Making the Plots
png(filename='Plot4.png',width=480,height=480,units='px')
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(householdData$SetTime, householdData$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(householdData$SetTime, householdData$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(householdData$SetTime, householdData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(householdlData$SetTime, householdData$Sub_metering_2, type="l", col="red")
lines(householdData$SetTime, householdData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(householdData$SetTime, householdData$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
