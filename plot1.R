#First we read the data from the computer. I assumed that the file "household_power_consumption.txt" is in the working directory
main=read.table("household_power_consumption.txt",sep=";",header = T)

#Now we subset the file to have entries related to "1/2/2007" or "2/2/2007"
main=main[as.character(as.vector(main$Date))=="1/2/2007"|as.character(as.vector(main$Date))=="2/2/2007",]

#We convert the Date column to the date format
main$Date=as.Date(as.character(as.vector(main$Date)),"%d/%m/%Y")

#We convert Time column to the "POSIXt" format
main$Time=paste(as.character(main$Date),as.character(as.vector(main$Time)))
main$Time=strptime(main$Time,"%Y-%m-%d %H:%M:%S")

#Now we are ready to plot the diagram
png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.vector(main$Global_active_power)),col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
