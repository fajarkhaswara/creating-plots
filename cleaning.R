# import data to the environment
df <- read.table("~/Projects/coursera_assignments/creating_plots/household_power_consumption.txt",
                 header = T, sep = ";", na.strings = "?")

# format the date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# filter data only 1-2-2007 to 2-2-2007

df <- subset(df, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# remove incomplete observation
df <- df[complete.cases(df),]

## Combine Date and Time column
datetime <- paste(df$Date, df$Time)

## Name the vector
datetime <- setNames(datetime, "DateTime")

## Remove Date and Time column
df <- df[ ,!(names(df) %in% c("Date","Time"))]

## Add DateTime column
df <- cbind(datetime, df)

## Format dateTime Column
df$datetime <- as.POSIXct(datetime)
