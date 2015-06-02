#This R script makes plot #2 from Course Project 2

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


s <- seq(length(data$Time)-1)  #vector used to biuld the segments

#integration of date and time in a single variable
d=as.POSIXct(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

#required plot
#empty plot
plot(d,data$Global_active_power,type="n",xlab="",ylab="Global Active power (kilowatts)")
#drawing segments
segments(d[s],data$Global_active_power[s],d[s+1],data$Global_active_power[s+1])


#storage in png file and closing the device
#as I wanted to check the plot was OK in the screen, I worked with the window device and copied
#the plot to the png file at the end
dev.copy(png, file = "plot2.png") 
dev.off() 
