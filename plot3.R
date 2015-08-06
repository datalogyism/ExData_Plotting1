#Read in datafile
dataset<-read.csv("household_power_consumption.txt", header=TRUE, na.strings="?",sep=";")
#Subset to just 2007-02-01 and -02
dataset <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
#Add datetime
dataset$datetime <- with(dataset, strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))
#Save off to .png
png(filename="plot3.png",width=480,height=480)
#Create histogram
with(dataset,
     {
         plot(datetime,
              Sub_metering_1,
              type="n",
              ylab="Energy sub metering",
              xlab="",
              main=""
         )
         legend("topright",
                col=c("black","red","blue"),
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                lty=c(1,1,1)
         )
         lines(datetime,Sub_metering_1,col="black")
         lines(datetime,Sub_metering_2,col="red")
         lines(datetime,Sub_metering_3,col="blue")
     }
)
#Write .png
dev.off()