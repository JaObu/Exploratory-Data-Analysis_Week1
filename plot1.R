# COURSERA _ Exploratory Data Analysis _ Week 1 _ Course Project 1

#Our overall goal here is simply to examine how household energy 
#usage varies over a 2-day period in February, 2007. Your task is 
#to reconstruct the following plots below, all of which were 
#constructed using the base plotting system.

#fork and clone the following GitHub repository: 
#https://github.com/rdpeng/ExData_Plotting1

#Data source: http://archive.ics.uci.edu/ml/index.php

#Dataset: Electric power consumption [20Mb]

#Description: Measurements of electric power consumption in one 
#household with a one-minute sampling rate over a period of 
#almost 4 years. Different electrical quantities and some 
#sub-metering values are available.

#The following descriptions of the 9 variables in the dataset 
#are taken from the UCI web site:
  #Date: Date in format dd/mm/yyyy
  #Time: time in format hh:mm:ss
  #Global_active_power: household global minute-averaged active 
    #power (in kilowatt)
  #Global_reactive_power: household global minute-averaged 
    #reactive power (in kilowatt)
  #Voltage: minute-averaged voltage (in volt)
  #Global_intensity: household global minute-averaged current 
    #intensity (in ampere)
  #Sub_metering_1: energy sub-metering No. 1 (in watt-hour of 
    #active energy). It corresponds to the kitchen, containing 
    #mainly a dishwasher, an oven and a microwave (hot plates are 
    #not electric but gas powered).
  #Sub_metering_2: energy sub-metering No. 2 (in watt-hour of 
    #active energy). It corresponds to the laundry room, containing
    #a washing-machine, a tumble-drier, a refrigerator and a light.
  #Sub_metering_3: energy sub-metering No. 3 (in watt-hour of 
    #active energy). It corresponds to an electric water-heater 
    #and an air-conditioner.

# ============================================================

# 1. Getting Data
hpc <- read.table(file = "household_power_consumption.txt",
                  sep = ";", header = TRUE)

sub_hpc <- subset(hpc, 
                  hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")


#Open dev for saving
png(file = "plot1.png", width = 480, height = 480)

# 2. Plot: Global Active Power (unnamed-chunk-2.png)
num_GAP <- as.numeric(as.character(sub_hpc$Global_active_power))

hist(num_GAP, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")

dev.off()

