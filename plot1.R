#This R script makes plot #1 from Course Project 1

# read data from the downloaded file, previously stored in the working directory
data=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings= "?")


#change date format
data$Date=as.Date(data$Date,"%d/%m/%Y")


#select data for the assignment
#We will only be using data from the dates 2007-02-01 and 2007-02-02. 
idx=data$Date>="2007-02-01"
idx2=data$Date<="2007-02-02"
idxs=idx&idx2
data=data[idxs,]


#required plot
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#storage in png file and closing the device
#as I wanted to check the plot was OK in the screen, I worked with the window device and copied
#the plot to the png file at the end
dev.copy(png, file = "plot1.png") 
dev.off() 