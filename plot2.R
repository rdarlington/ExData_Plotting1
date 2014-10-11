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

#Create plot
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#copy plot to a png file
dev.copy(png, file="./ExData_Plotting1/plot2.png")

#turn off device
dev.off()
