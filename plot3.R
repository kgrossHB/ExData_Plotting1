### PLOT 3

# set working directory
setwd("C:/Users/Katharina/Dropbox/Coursera/4-Exploratory-Data-Analysis/Project1")


# load dataset and extract relevant information
data <- read.csv2("C:/Users/Katharina/Desktop/household_power_consumption.txt",
                  header = TRUE)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",
             c(1:2, 7:9)]


# preparing data
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime,
                          format = "%d/%m/%Y %H:%M:%S")

data$Date[data$Date == "?"] <- NA
table(is.na(data$Date))

data$Time[data$Time == "?"] <- NA
table(is.na(data$Time))

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
png(filename = "plot3.png",
    width = 480, height = 480)

# generate plot
Sys.setlocale("LC_TIME", "English")
plot(data$datetime, data$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "",
     cex.main = 0.9,
     cex.lab = 0.9,
     cex.axis = 0.9)
lines(data$datetime, data$Sub_metering_2,
      col = "red")
lines(data$datetime, data$Sub_metering_3,
      col = "blue")
legend("topright", lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.9)

# close png-device
dev.off()
