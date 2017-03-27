
#system.time(df <-  read.table("./household_power_consumption.txt", header = TRUE, sep = ";", nrows=10))
df <-  read.table("./household_power_consumption.txt", header = TRUE, sep = ";", nrows=10)
col_classes <- sapply(df, class)

N <- 2075259
df <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
                 nrows=N, check.names = F, colClasses = col_classes,stringsAsFactors = F, na.strings ="?",comment.char = "")

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

## Converting date and time
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

## Plot 4

par(mfrow = c(2,2), mar = c(4,4,2,1))
with(df, {
        plot(Global_active_power ~ Datetime, type = "l", 
             ylab = "Global Active Power", xlab = "")
        plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
             xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
        legend("topright", lty = 2, bty = "n",  cex=0.2, pt.cex=1,col = c("grey", "red", "blue"), 
               legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ Datetime, type = "l", 
             ylab = "Global_rective_power", xlab = "datetime")
})
