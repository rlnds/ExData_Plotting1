## Read all data
ddf <- read.table("household_power_consumption.txt", sep=";")
## Take a subset
df <- ddf[ddf$V1=="1/2/2007" | ddf$V1=="2/2/2007", ]
names(df) <- ddf[1, ]

## Construct the plot and save it to a PNG file
png(filename="plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(df$Global_active_power),
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()