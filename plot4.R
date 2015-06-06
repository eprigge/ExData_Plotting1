## This function creates plot4 for course project 1 in Exploritory data course

plot4 <- function(){
      
      ## read in the needed data; skipping the rows that do not contain the desired dates
      ## and relabeling the columns
      data <-read.csv("household_power_consumption.txt",sep = ";", nrows = (69516-66637), 
                      skip =66637, col.names = c("Date", "Time", "Global_active_power", 
                                                 "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1",
                                                 "Sub_metering_2", "Sub_metering_3") )
      
      ##change Date and Time into a date time object
      
      timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S" )
      
      ##Read plot4 into a png file
      png("plot4.png", height = 480, width = 480)
      
      par(mfrow=c(2,2))
      ## plot top left graph
      plot(timestamp, data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = " ")
     
      ##plot top right graph 
      plot(timestamp, data$Voltage, type = "l", 
     ylab = "Voltage", xlab = "datetime")
      
      ##plot bottom left graph
      plot(timestamp, data$Sub_metering_1, type = "l", 
           ylab = "Energy sub metering", xlab = " ", ylim = c(0, 40))
      par(new = T)
      plot(timestamp, data$Sub_metering_2, type = "l", 
           ylab = "Energy sub metering", xlab = " ", ylim = c(0, 40), col = "red")
      
      lines(timestamp, data$Sub_metering_3, col = "blue")
      
      legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),
             col=c("black","blue","red"))  

      ## plot bottom right graph
      plot(timestamp, data$Global_reactive_power, type = "l", 
     ylab = "Global reactive power", xlab = "datetime")
      
      dev.off()
}