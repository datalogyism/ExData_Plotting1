#Read in datafile
dataset<-read.csv("household_power_consumption.txt", header=TRUE, na.strings="?",sep=";")
#Subset to just 2007-02-01 and -02
dataset <- subset(dataset, Date %in% c("1/2/2007","2/2/2007"))
#Add datetime
dataset$datetime <- with(dataset, strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S"))
#Save off to .png
png(filename="plot1.png",width=480,height=480)
#Create histogram
with(dataset,
     {
         hist(Global_active_power,
              xlab="Global Active Power (kilowatts)",
              col="red",
              main="Global Active Power"
         )
     }
)
#write .png
dev.off()