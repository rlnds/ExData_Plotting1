## Read all data
ddf <- read.table("household_power_consumption.txt", sep=";")
## Take a subset
df <- ddf[ddf$V1=="1/2/2007" | ddf$V1=="2/2/2007", ]
names(df) <- ddf[1, ]

## Construct the plot and save it to a PNG file
png(filename="plot2.png", width = 480, height = 480, units = "px")
plot(as.numeric(df$Global_active_power),
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     xaxt="n")
axis(1, at = seq(0, length(df$Global_active_power), length.out = 3),
     labels = c("Thu", "Fri", "Sat"))
dev.off()