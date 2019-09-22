#Read the dataset
MyData <- read.delim("../household_power_consumption.txt", header = TRUE, sep = ";")

#Filter by date as we need data for only 2 dates
MyData_filtered_by_date<-MyData[MyData$Date=="2/2/2007" |MyData$Date=="1/2/2007" ,]

#Open the png file to which we will save the plot
png("plot1.png", width = 480, height = 480)

#Create the plot
hist(as.numeric(as.character(MyData_filtered_by_date$Global_active_power)),col = "red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")

#Close the png file
dev.off()