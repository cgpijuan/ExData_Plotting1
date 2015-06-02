#This R script makes plot #4 from Course Project 1

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

s <- seq(length(data$Time)-1) #vector used to biuld the segments
#integration of date and time in a single variable
d=as.POSIXct(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

#creating a 2x2 plots structure

par(mfrow=c(2,2),mar=c(4,4,2,2))

with(data, {
        #1st plot
        plot(d,data$Global_active_power,type="n",xlab="",ylab="Global Active power")
        segments(d[s],data$Global_active_power[s],d[s+1],data$Global_active_power[s+1])
        
        #2nd plot
        plot(d,data$Voltage,ylab="Voltage",type="n",xlab="datetime")
        segments(d[s],data$Voltage[s],d[s+1],data$Voltage[s+1])
        
        #3rd plot
        plot(d,data$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="") 
        segments(d[s],data$Sub_metering_1[s],d[s+1],data$Sub_metering_1[s+1],col="black")
        segments(d[s],data$Sub_metering_2[s],d[s+1],data$Sub_metering_2[s+1],col="red")
        segments(d[s],data$Sub_metering_3[s],d[s+1],data$Sub_metering_3[s+1],col="blue")
        legend("topright",col=c("black","red","blue"),lwd=1,bty="n",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),x.intersp=0.25,y.intersp=0.5)
        
        #4th plot
        plot(d,data$Global_reactive_power,xlab="datetime",type="n",ylab="Global Reactive power")
        segments(d[s],data$Global_reactive_power[s],d[s+1],data$Global_reactive_power[s+1])
})

#storage in png file and closing the device
#as I wanted to check the plot was OK in the screen, I worked with the window device and copied
#the plot to the png file at the end
dev.copy(png, file = "plot4.png") 
dev.off() 