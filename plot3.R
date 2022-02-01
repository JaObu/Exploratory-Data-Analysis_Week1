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
png(file = "plot3.png", width = 480, height = 480)

# 3. Plot 3: sub-metering (unnamed-chunk-4.png)

plot(sub_hpc$Time, sub_hpc$Sub_metering_1, type = "n",
     xlab = " ", ylab = "Energy sub metering")
with(sub_hpc, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(sub_hpc, lines(Time, as.numeric(as.character(Sub_metering_2)),
                    col = "red"))
with(sub_hpc, lines(Time, as.numeric(as.character(Sub_metering_3)),
                    col = "blue"))
legend("topright", lty=1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

