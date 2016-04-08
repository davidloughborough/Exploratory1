##Read in Data and Make with Only Selected Days
householdData <- read.table("~/Desktop/household_power_consumption.txt", header = T, sep=";")
householdData <- householdData[householdData$Date %in% c("1/2/2007","2/2/2007"),]

##Making Time Variables and Merging with Household Data
SetTime <-strptime(paste(householdData$Date, householdData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
householdData <- cbind(SetTime, householdData)

##Making the First Plot
png(filename='Plot1.png',width=480,height=480,units='px')
hist(householdData$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
