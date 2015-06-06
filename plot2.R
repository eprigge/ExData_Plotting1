## This function creates plot2 for course project 1 in Exploritory data course

plot2 <- function(){
      
      ## read in the needed data; skipping the rows that do not contain the desired dates
      ## and relabeling the columns
      data <-read.csv("household_power_consumption.txt",sep = ";", nrows = (69516-66637), 
                      skip =66637, col.names = c("Date", "Time", "Global_active_power", 
                                                 "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1",
                                                 "Sub_metering_2", "SUb_metering_3") )
      
      ##change Date and Time into a date time object
      
      timestamp <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S" )
     
      ##Read plot2 into a png file
      png("plot2.png", height = 480, width = 480)
      plot(timestamp, data$Global_active_power, type = "l", 
           ylab = "Global Active Power (kilowatts)", xlab = " ")
      dev.off()
}