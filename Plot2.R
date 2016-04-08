##Read in Data and Make with Only Selected Days
householdData <- read.table("~/Desktop/household_power_consumption.txt", header = T, sep=";")
householdData <- householdData[householdData$Date %in% c("1/2/2007","2/2/2007"),]

##Making Time Variables and Merging with Household Data
SetTime <-strptime(paste(householdData$Date, householdData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
householdData <- cbind(SetTime, householdData)

##Making Plot 2
png(filename='Plot2.png',width=480,height=480,units='px')
plot(householdData$SetTime, householdData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

