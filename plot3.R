#First we read the data from the computer. I assumed that the file "household_power_consumption.txt" is in the working directory
main=read.table("household_power_consumption.txt",sep=";",header = T)

#Now we subset the file to have entries related to "1/2/2007" or "2/2/2007"
main=main[as.character(as.vector(main$Date))=="1/2/2007"|as.character(as.vector(main$Date))=="2/2/2007",]

#We convert the Date column to the date format
main$Date=as.Date(as.character(as.vector(main$Date)),"%d/%m/%Y")

#We convert Time column to the "POSIXt" format
main$Time=paste(as.character(main$Date),as.character(as.vector(main$Time)))
main$Time=strptime(main$Time,"%Y-%m-%d %H:%M:%S")

#Now we are ready to plot the diagram. We substract 173300 sconds from w$Time to obtain the x-axis the we are asked to draw.
png("plot3.png", width = 480, height = 480)
plot(main$Time-173300,as.numeric(as.vector(main$Sub_metering_1)),type = "l",ylab = "Energy sub metering",xlab="")
lines(main$Time-173300,as.numeric(as.vector(main$Sub_metering_2)),type = "l",col="red",xlab="")
lines(main$Time-173300,as.numeric(as.vector(main$Sub_metering_3)),type = "l",col="blue",xlab="")
par(xpd=T)
legend("topright", pch = "____", col = c("black","red","blue"), text.font = 2,cex=.8, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
