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
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2),mar = c(4, 4, 1, 1), oma = c(0, 0, 2, 0))
plot(main$Time-173300,main$Global_active_power,type = "l",ylab = "Global Active Power",yaxt="n",xlab="")
axis(2,at=c(0,1000,2000,3000),labels=c(0,2,4,6))
plot(main$Time-173300,as.numeric(as.vector(main$Voltage)),type = "l",ylab = "Voltage",xlab="datetime")
plot(main$Time-173300,as.numeric(as.vector(main$Sub_metering_1)),type = "l",ylab = "Energy sub metering",xlab="")
lines(main$Time-173300,as.numeric(as.vector(main$Sub_metering_2)),type = "l",col="red",xlab="")
lines(main$Time-173300,as.numeric(as.vector(main$Sub_metering_3)),type = "l",col="blue",xlab="")
par(xpd=T)
legend("topright", pch = "____", col = c("black","red","blue"),bty="n", text.font = 2,cex=.7, legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(main$Time-173300,as.numeric(as.vector(main$Global_reactive_power)),type = "l",ylab = "Global_reactive_power",xlab="datetime")
dev.off()



