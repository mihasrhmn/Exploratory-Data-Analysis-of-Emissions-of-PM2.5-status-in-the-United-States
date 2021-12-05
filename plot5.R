# loading the required libraries
library("dplyr")
library("ggplot2")

# downloading the dataset & unziping it into the current folder
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "dataFiles.zip", method = "curl")
unzip(zipfile = "dataFiles.zip")

# reading the dataset
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

# tidying the dataset for the barplot
SCC_with_vehicle <- filter(SCC, grepl("vehicle", SCC.Level.Two, ignore.case = TRUE))
NEI$year <- as.factor(NEI$year)
baltimore_city <- subset(NEI, fips == "24510")
merged_dataset <- merge(baltimore_city, SCC_with_vehicle, by = "SCC")


# setting the output png file dimensions:
png(filename = "plot5.png", width=480, height= 480)
# creating the barplot
ggplot(merged_dataset, aes(year, Emissions)) +
  labs(title = "Motor Vehicle Source Emissions in Baltimore City") +
  xlab( "Years") + ylab("PM2.5 emitted (tons)") +
  geom_bar(stat = "identity")
dev.off()