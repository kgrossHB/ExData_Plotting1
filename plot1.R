### PLOT 1

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
png(filename = "plot1.png",
    width = 480, height = 480)

# generate plot
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     cex.main = 0.9,
     cex.lab = 0.9,
     cex.axis = 0.9)

# close png-device
dev.off()
