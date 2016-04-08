##Read in Data and Make with Only Selected Days
householdData <- read.table("~/Desktop/household_power_consumption.txt", header = T, sep=";")
householdData <- householdData[householdData$Date %in% c("1/2/2007","2/2/2007"),]

##Making Time Variables and Merging with Household Data
SetTime <-strptime(paste(householdData$Date, householdData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
householdData <- cbind(SetTime, householdData)

##Energy Submetering Plot
png(filename='Plot3.png',width=480,height=480,units='px')
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(householdData$SetTime, householdData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(householdData$SetTime, householdData$Sub_metering_2, col=columnlines[2])
lines(householdData$SetTime, householdData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
