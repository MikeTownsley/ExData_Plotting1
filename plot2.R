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
# plot 2

png(file = "plot2.png", width = 480, height = 480)

plot(x = df$date_time, y = df$Global_active_power,
     type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()
