#Read the dataset
MyData <- read.delim("../household_power_consumption.txt", header = TRUE, sep = ";")

#Filter by date as we need data for only 2 dates
MyData_filtered_by_date<-MyData[MyData$Date=="2/2/2007" |MyData$Date=="1/2/2007" ,]

#Open the png file to which we will save the plot
png("plot3.png", width = 480, height = 480)

#Converte Date and Time variables to Date/Time classes
MyData_filtered_by_date$Date<-strptime(paste(MyData_filtered_by_date$Date, MyData_filtered_by_date$Time, sep =" "), format="%d/%m/%Y %H:%M:%S")

#Create the plot
plot(MyData_filtered_by_date$Date,as.numeric(as.character(MyData_filtered_by_date$Sub_metering_1)),type="l",xlab="",ylab="Energy Sub metering")
lines(MyData_filtered_by_date$Date,as.numeric(as.character(MyData_filtered_by_date$Sub_metering_2)), col="red")
lines(MyData_filtered_by_date$Date,as.numeric(as.character(MyData_filtered_by_date$Sub_metering_3)), col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=2)

#Close the png file
dev.off()
