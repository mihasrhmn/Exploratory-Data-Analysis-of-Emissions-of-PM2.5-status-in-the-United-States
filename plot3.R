# loading the required libraries
library("ggplot2")

# downloading the dataset & unziping it into the current folder
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "dataFiles.zip", method = "curl")
unzip(zipfile = "dataFiles.zip")

# reading the dataset
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

# tidying the dataset for the barplot
NEI$year <- as.factor(NEI$year)
baltimore_city <- subset(NEI, fips == "24510")


# setting the output png file dimensions:
png(filename = "plot3.png", width=480, height= 480)
# creating the barplot
ggplot(baltimore_city, aes(year, Emissions, fill = type)) +
  geom_bar(stat = "identity") +
  theme_bw() + guides(fill = FALSE) +
  facet_grid(.~type) + 
  labs(x = "year", y = "Total PM2.5 Emission (Tons)", title = "PM2.5 Emissions in Baltimore City 1999-2008 by Source Type")
dev.off()
