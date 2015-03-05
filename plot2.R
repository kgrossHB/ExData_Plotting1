### PLOT 2

# set working directory
setwd("C:/Users/Katharina/Dropbox/Coursera/4-Exploratory-Data-Analysis/Project1")


# load dataset and extract relevant information
data <- read.csv2("C:/Users/Katharina/Desktop/household_power_consumption.txt",
                  header = TRUE)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",
             c(1:3)]


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


# open png-device
dev.copy(png, file = "plot2.png",
         width = 480, height = 480)

# generate plot
Sys.setlocale("LC_TIME", "English")
plot(data$datetime, data$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     cex.main = 0.7,
     cex.lab = 0.7,
     cex.axis = 0.7)

# close png-device
dev.off()