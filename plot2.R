##Set Directory
setwd("C:/Users/Lil Ryan/datasciencecoursera")

##Read full data set
household_power_consumption <- read.csv("C:/Users/Lil Ryan/datasciencecoursera/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

##Subset data set
data <- subset(household_power_consumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(household_power_consumption)

##Date conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##Plot 2
hist(data$Global_active_power, main="Global Active Power", 
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Saving to PNG File
plot(data$Global_active_power~data$Datetime, type="l",
ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

