## Read all data
ddf <- read.table("household_power_consumption.txt", sep=";")
## Take a subset
df <- ddf[ddf$V1=="1/2/2007" | ddf$V1=="2/2/2007", ]
names(df) <- ddf[1, ]

## Construct the plot and save it to a PNG file
png(filename="plot3.png", width = 480, height = 480, units = "px")
plot(as.numeric(df$Sub_metering_1), type="l", col="black",
     xlab="",
     ylab="Energy sub metering",
     xaxt="n")
lines(as.numeric(df$Sub_metering_2), type="l", col="red")
lines(as.numeric(df$Sub_metering_3), type="l", col="blue")
axis(1, at = seq(0, length(df$Global_active_power), length.out = 3),
     labels = c("Thu", "Fri", "Sat"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()