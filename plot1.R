getwd()
list.files()
#system.time(df <-  read.table("./household_power_consumption.txt", header = TRUE, sep = ";", nrows=10))
df <-  read.table("./household_power_consumption.txt", header = TRUE, sep = ";", nrows=10)
col_classes <- sapply(df, class)

N <- 2075259
df <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", nrows=N, colClasses = col_classes, na.strings ="?",comment.char = "")
df$Date <- as.Date(df$Date)

#subset data from the dates 2007-02-01 and 2007-02-0
df <-  subset(df, Date >= "01/02/2007" & Date <= "02/02/2007" )

# converting date and time
DateTime <-paste(df$Date,df$Time)
df$DateTime <-strptime(DateTime, "%d/%m/%Y %H:%M:%S")

#hist(df$Global_active_power)
hist(df$Global_active_power, xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red",)
