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
png("plot2.png", width = 480, height = 480)
plot(main$Time-173300,main$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",yaxt="n",xlab="")
#We need to relabel the y-axis
axis(2,at=c(0,1000,2000,3000),labels=c(0,2,4,6))
dev.off()
