
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

## Plot 2
plot(df$Datetime,df$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
