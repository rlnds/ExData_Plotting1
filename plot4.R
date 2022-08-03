## Read all data
ddf <- read.table("household_power_consumption.txt", sep=";")
## Take a subset
df <- ddf[ddf$V1=="1/2/2007" | ddf$V1=="2/2/2007", ]
names(df) <- ddf[1, ]

## Construct the plot and save it to a PNG file
png(filename="plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2, 2))

plot(as.numeric(df$Global_active_power),
     type="l",
     xlab="",
     ylab="Global Active Power",
     xaxt="n")
axis(1, at = seq(0, length(df$Global_active_power), length.out = 3),
     labels = c("Thu", "Fri", "Sat"))

plot(as.numeric(df$Sub_metering_1), type="l", col="black",
     xlab="",
     ylab="Energy sub metering",
     xaxt="n")
lines(as.numeric(df$Sub_metering_2), type="l", col="red")
lines(as.numeric(df$Sub_metering_3), type="l", col="blue")
axis(1, at = seq(0, length(df$Global_active_power), length.out = 3),
     labels = c("Thu", "Fri", "Sat"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n")

plot(as.numeric(df$Voltage),
     type="l",
     xlab="datetime",
     ylab="Voltage",
     xaxt="n")
axis(1, at = seq(0, length(df$Voltage), length.out = 3),
     labels = c("Thu", "Fri", "Sat"))

plot(as.numeric(df$Global_reactive_power),
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power",
     xaxt="n")
axis(1, at = seq(0, length(df$Global_reactive_power), length.out = 3),
     labels = c("Thu", "Fri", "Sat"))
dev.off()