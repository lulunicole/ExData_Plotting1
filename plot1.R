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

png(file = "plot1.png", width = 480, height = 480)

#Plot
hist(as.numeric(subpower$Global_active_power), xlab = "Global Active Power (kilowatts)", ylab ="Frequency", main = "Global Active Power", col="Red")

#Save plot
dev.off()