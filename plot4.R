### PLOT 4

# set working directory
setwd("C:/Users/Katharina/Dropbox/Coursera/4-Exploratory-Data-Analysis/Project1")


# load dataset and extract relevant information
data <- read.csv2("C:/Users/Katharina/Desktop/household_power_consumption.txt",
                  header = TRUE)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",
             c(1:5, 7:9)]


# preparing data
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime,
                          format = "%d/%m/%Y %H:%M:%S")

data$Date[data$Date == "?"] <- NA
table(is.na(data$Date))

data$Time[data$Time == "?"] <- NA
table(is.na(data$Time))

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

data$Global_active_power[data$Global_active_power == "?"] <- NA
table(is.na(data$Global_active_power))

data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

data$Global_reactive_power[data$Global_reactive_power == "?"] <- NA
table(is.na(data$Global_reactive_power))

data$Voltage <- as.numeric(as.character(data$Voltage))

data$Voltage[data$Voltage == "?"] <- NA
table(is.na(data$Voltage))

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))

data$Sub_metering_1[data$Sub_metering_1 == "?"] <- NA
table(is.na(data$Sub_metering_1))

data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))

data$Sub_metering_2[data$Sub_metering_2 == "?"] <- NA
table(is.na(data$Sub_metering_2))

data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

data$Sub_metering_3[data$Sub_metering_3 == "?"] <- NA
table(is.na(data$Sub_metering_3))


# open png-device
png(filename = "plot4.png",
    width = 480, height = 480)

# generate plots

par(mfrow = c(2, 2), cex = 0.8)

# 1
Sys.setlocale("LC_TIME", "English")
plot(data$datetime, data$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = "")

# 2
Sys.setlocale("LC_TIME", "English")
plot(data$datetime, data$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

# 3
Sys.setlocale("LC_TIME", "English")
plot(data$datetime, data$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(data$datetime, data$Sub_metering_2,
      col = "red")
lines(data$datetime, data$Sub_metering_3,
      col = "blue")
legend("topright", lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

# 4
Sys.setlocale("LC_TIME", "English")
plot(data$datetime, data$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

# close png-device
dev.off()