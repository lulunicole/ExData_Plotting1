## JHU DS Coursera Course 4 Project 1
## Plot 1


#Importing data
power <- read.table("C:\\Users\\jingting.lu\\Desktop\\JHU_Data science\\4_Explorational data analysis\\household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#Subsetting data
power$Date<-as.Date(power$Date,"%d/%m/%Y")
subpower <- rbind(power[power$Date == "2007-02-01",],power[power$Date == "2007-02-02",])

#Converting dates and times
subpower$datetime<-paste(subpower$Date,subpower$Time)
subpower$datetime <- strptime(subpower$datetime, "%Y-%m-%d %H:%M:%S")


#Make png
png(file = "plot4.png", width = 480, height = 480)

#Plot
par(mfrow = c(2,2))

plot(subpower$datetime,subpower$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)",xlab="")

plot(subpower$datetime,subpower$Voltage, type = "l",ylab = "Voltage",xlab="datetime")

plot(subpower$datetime,subpower$Sub_metering_1, type = "l",ylab = "Energy sub metering",xlab="")
with(subpower, lines(datetime, Sub_metering_2, col = "red"))
with(subpower, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright",lty = c(1,1),col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(subpower$datetime,subpower$Global_reactive_power, type = "l",ylab = "Global_reactive_power",xlab="datetime")

#Save plot
dev.off()