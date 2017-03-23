
##-------- LOAD DATA -------- 
        

        #fileUrl1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        #download.file(url=fileUrl1, destfile="elec.zip", method="curl")
        #unzip("elec.zip")



        #confirm file existence in working directory
        grep("household_power_consumption.txt", dir())

        #create datatable
        data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", dec = ".")
        
        #subset data as "We will only be using data from the dates 2007-02-01 and 2007-02-02."
        rel_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007" )   
        
        
        #so lets convert those factors to functioning POSIXct.
        rel_data <- cbind( 
                                date_time = strptime( 
                                                paste(rel_data$Date, rel_data$Time, sep= " " ), 
                                                "%d/%m/%Y %H:%M:%S"
                                        ),
                                rel_data[3:9]
                        )
        

##--------- END LOAD DATA

        
        

## ------- DRAW PLOT 1 AS PNG---------------------

        
        
        png("plot1.png", 480, 480)
        
        hist(
                rel_data$Global_active_power, 
                col = "red", 
                main = "Global Active Power", 
                xlab = "Global Active Power (kilowatts)"
        )
        
        dev.off()

 
        
             
        
        
## ------- DRAW PLOT 2 AS PNG ---------------------       
        
        
        
        png("plot2.png", 480, 480)
        
        plot(
                rel_data$date_time,
                rel_data$Global_active_power, 
                xlab = "", 
                ylab = "Global Active Power (kilowatts)", 
                type = "l"
        )
        
        dev.off()
        
 
        
        
               
        
## ------- DRAW PLOT 3 AS PNG ---------------------  

        

        png("plot3.png", 480, 480)
        
        plot(rel_data$date_time,rel_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
        points(rel_data$date_time,rel_data$Sub_metering_1, type = "l", col="black")
        points(rel_data$date_time,rel_data$Sub_metering_2, type = "l", col="red")
        points(rel_data$date_time,rel_data$Sub_metering_3, type = "l", col="blue")
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1)
        
        dev.off()
        
   
        
        
## ------- DRAW PLOT 4 AS PNG ---------------------  
        
        
        png("plot4.png", 480, 480)
        
        par(mfcol = c(2,2))

        #top left plot
        plot( rel_data$date_time , rel_data$Global_active_power , xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
        
        #bottom left plot
        plot(rel_data$date_time,rel_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
        points(rel_data$date_time,rel_data$Sub_metering_1, type = "l", col="black")
        points(rel_data$date_time,rel_data$Sub_metering_2, type = "l", col="red")
        points(rel_data$date_time,rel_data$Sub_metering_3, type = "l", col="blue")
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1, bty="n")
        
        #top right plot
        with(rel_data, plot(date_time, Voltage, type="l", xlab = "datetime"))
        
        #bottom right plot
        with(rel_data, plot(date_time, Global_reactive_power, type="l", xlab = "datetime"))
        
        dev.off()
        
        
        
        
##-------- END
                