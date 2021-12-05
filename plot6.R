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
baltimore_city <- merge(baltimore_city, SCC_with_vehicle, by = "SCC")
baltimore_city$city <- "Baltimore City"
los_angeles <- subset(NEI, fips == "06037")
los_angeles <- merge(los_angeles, SCC_with_vehicle, by = "SCC")
los_angeles$city <- "Los Angeles"
merged_dataset <- rbind(baltimore_city, los_angeles)


# setting the output png file dimensions:
png(filename = "plot6.png", width=480, height= 480)
# creating the barplot
ggplot(merged_dataset, aes(x = year, y = Emissions, fill = city)) +
  geom_bar(aes(fill = year), stat = "identity") +
  guides(fill = FALSE) +
  facet_grid(.~city) + 
  labs(x = "Years", y = "Total PM2.5 Emission (Tons)", title = "Motor Vehicle Source PM2.5 Emissions in Baltimore City and Los Angeles")
dev.off()

