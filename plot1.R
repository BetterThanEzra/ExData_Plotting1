
##-------- LOAD DATA -------- 


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

 
        
             
        
      
        
        
##-------- END
                