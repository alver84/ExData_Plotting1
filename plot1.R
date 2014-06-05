## setwd("/Users/alver/Coursera/Subject4/ex1")
## define a data frame
d = read.table("household_power_consumption.txt", sep=";",
               col.names = c("date", "time", "GAP",
                             "GRP", "Volt", "Intnst", 
                             "SM1", "SM2", "SM3"))
## select a subset
mydates <- as.Date(c("2007-02-01", "2007-02-02"))
d$date <- as.Date(as.character(d$date), format = "%d/%m/%Y")
dset <- subset(d, d$date %in% mydates)

## convert a GAP variable
v <- as.numeric(as.character(dset$GAP))

## remove a NA values
v[!is.na(v)]

## plotting
png(file = "plot1.png", width = 480, height = 480, units = "px") 
hist(v, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", ylim = c(0, 1200))
dev.off()
