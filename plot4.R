# set working directory
setwd("C:/Users/rob/Desktop/Courses/01 - Data Science/04 - Exploratory Data Analysis") 

#read in data
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
               stringsAsFactors=FALSE, comment.char="", quote='\"')

#Convert data field
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

#subset data
df <- subset(df, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#create datetime field
Datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(Datetime)

#Open graphics window
windows(width=10,heigh=10)
#Create 2x2 plot for 4 charts
par(mfrow=c(2,2), mar=c(4,4,2,1))
#1 of 4
plot(df$Global_active_power ~ df$Datetime, type="l", xlab="", ylab="Global Active Power")

#plot 2 of 4
plot(df$Voltage ~ df$Datetime, type="l", xlab="datetime", ylab="Voltage")

#3 of 4
plot(df$Sub_metering_1 ~ df$Datetime, col="black", type="l", ylab="Energy sub metering", xlab="")
lines(df$Sub_metering_2 ~df$Datetime, col="red", type="l")
lines(df$Sub_metering_3 ~df$Datetime, col="blue", type="l")
legend("topright", col=c("black", "red", "blue"), 
       legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),,bty="n", lwd=1)

#plot4 of 4
plot(df$Global_reactive_power ~ df$Datetime, type="l", xlab="datetime", ylab="Global_recative_power")


#copy plot to a png file
dev.copy(png, file="./ExData_Plotting1/plot4.png", width=480, height=480, units="px")
#turn off device
dev.off()
graphics.off()
