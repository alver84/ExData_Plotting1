    ##setwd("/Users/alver/Coursera/Subject4/ex1")
    ## define a data frame
    d = read.table("household_power_consumption.txt", sep=";",
                   col.names = c("date", "time", "GAP",
                                 "GRP", "Volt", "Intnst", 
                                 "SM1", "SM2", "SM3"))
    ## select a subset
    mydates <- as.Date(c("2007-02-01", "2007-02-02"))
    d$date <- as.Date(as.character(d$date), format = "%d/%m/%Y")
    dset <- subset(d, d$date %in% mydates)
    dset <- na.omit(dset)

    x <- as.numeric(as.character(dset$GAP))
    
    ## combine a date and time variables
    y <- paste(as.character(dset$date), as.character(dset$time))
    y <- strptime(as.character(y), "%Y-%m-%d %H:%M:%S")
    ## plotting
    png(file = "plot2.png", width = 480, height = 480, units = "px") 
    plot(y,x, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    dev.off()
