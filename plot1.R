
## This function creates plot1 for course project 1 in Exploritory data course

plot1 <- function(){
      
      ## read in the needed data; skipping the rows that do not contain the desired dates
      ## and relabeling the columns
      data <-read.csv("household_power_consumption.txt",sep = ";", nrows = (69516-66637), 
                        skip =66637, col.names = c("Date", "Time", "Global_active_power", 
                        "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1",
                        "Sub_metering_2", "SUb_metering_3") )
      
      ##Read plot1 into a png file
      png("plot1.png", height = 480, width = 480)
      hist((data$Global_active_power), main = "Global Active Power", 
           xlab = "Global Active Power (kilowatts)", col = "red")
      dev.off()
}

