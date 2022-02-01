# COURSERA _ Exploratory Data Analysis _ Week 1 _ Course Project 1

# 1. Getting Data
hpc <- read.table(file = "household_power_consumption.txt",
                  sep = ";", header = TRUE)

sub_hpc <- subset(hpc, 
                  hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")

# 2. Transforming the Data and Time
sub_hpc$Date <- as.Date(sub_hpc$Date, format = "%d/%m/%Y")
sub_hpc$Time <- strptime(sub_hpc$Time, format = "%H:%M:%S")


sub_hpc[1:1440, "Time"] <- format(sub_hpc[1:1440, "Time"], "2007-02-01 %H:%M:%S")
sub_hpc[1441:2880, "Time"] <- format(sub_hpc[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

#Open dev for saving
png(file = "plot2.png", width = 480, height = 480)


# Plot 2: Global Active Power (unamed-chunk-3.png)
num_GAP <- as.numeric(as.character(sub_hpc$Global_active_power))

plot(sub_hpc$Time, num_GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
