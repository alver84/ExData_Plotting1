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

## combine a date and time variables
y <- paste(as.character(dset$date), as.character(dset$time))
y <- strptime(as.character(y), "%Y-%m-%d %H:%M:%S")

## plot1
x11 <- as.numeric(as.character(dset$GAP))

## plot2
x21 <- as.numeric(as.character(dset$Volt))

## plot3
x31 <- as.numeric(as.character(dset$SM1))
x32 <- as.numeric(as.character(dset$SM2))
x33 <- as.numeric(as.character(dset$SM3))

## plot4
x41 <- as.numeric(as.character(dset$GRP))

## plotting
png(file = "plot4.png", width = 480, height = 480, units = "px") 

##  Set up plotting in two rows and two columns, plotting along rows first.
par(mfrow = c(2, 2))
plot(y,x11, type = "l", ylab = "Global Active Power", xlab = "")

plot(y,x21, type = "l", ylab = "Voltage", xlab = "datetime")

plot(y,x31, type = "l", ylab = "Energy sub metering", xlab = "")
lines(y,x32, type = "l", col = "red")
lines(y,x33, type = "l", col = "blue")
legend("topright", lwd=1, col = c("black", "red", "blue"), bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(y,x41, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
