#Read in datafile
dataset<-read.csv("household_power_consumption.txt", header=TRUE, na.strings="?",sep=";")
#Subset to just 2007-02-01 and -02
dataset <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
#Add datetime
dataset$datetime <- with(dataset, strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))
#Save off to .png
png(filename="plot2.png",width=480,height=480)
#Create histogram
with(dataset,
     {
         plot(datetime,
              Global_active_power,
              type="l",
              ylab="Global Active Power (kilowatts)",
              xlab="",
              main=""
         )
     }
)
#Write .png
dev.off()