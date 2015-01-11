data=read.table("household_power_consumption.txt",sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"),header=TRUE,na.strings="?")
data = subset(data, Date=="1/2/2007"|Date=="2/2/2007")
data$DateTime = strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
png(filename="plot3.png",width=480,height=480)
with(data, {
plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(DateTime,Sub_metering_2,type="l",col="red")
lines(DateTime,Sub_metering_3,type="l",col="purple")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2,2,2),col=c("black","red","purple"))
}
)
dev.off()
