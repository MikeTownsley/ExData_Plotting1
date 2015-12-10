##############################################################
# this is for the first class project in the EDA coursera course
##############################################################

#read in data
#
names <- as.character(read.table("household_power_consumption.txt", nrows = 1, sep = ";"))
df <- read.table("household_power_consumption.txt", skip = 66637, 
                 nrows = 69517-66637, sep = ";")

names(df) <- names

# convert date and time variables
# 

df$date_time <- strptime(paste(df$Date, df$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

# detect and convert missing values
#

which(rowSums(df[,3:9] == "?") > 0) # indicates no missing values


# create plots
# 


# 
# plot 4

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(x = df$date_time, y = df$Global_active_power,
     type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "")

plot(x = df$date_time, y = df$Voltage,
     type = "l", ylab = "Voltage",
     xlab = "datetime")

plot(x = df$date_time, y = df$Sub_metering_1,
     type = "l", ylab = "Energy sub metering",
     xlab = "")
lines(x = df$date_time, y = df$Sub_metering_2, col = "red")
lines(x = df$date_time, y = df$Sub_metering_3, col = "blue")
legend(x = "topright", legend = names(df)[7:9], lty = 1, col = c("black","red","blue"))

plot(x = df$date_time, y = df$Global_reactive_power,
     type = "l", xlab = "datetime")

dev.off()


