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
SCC_with_coal <- filter(SCC, grepl("Coal", EI.Sector, ignore.case = TRUE))
SCC_with_comb <- filter(SCC, grepl("Comb", EI.Sector, ignore.case = TRUE))
SCC_comb_coal <- intersect(SCC_with_coal, SCC_with_comb)
NEI$year <- as.factor(NEI$year)
merged_dataset <- merge(NEI, SCC_comb_coal, by = "SCC")


# setting the output png file dimensions:
png(filename = "plot4.png", width=480, height= 480)
# creating the barplot
ggplot(merged_dataset, aes(year, Emissions/10^5)) +
  labs(title = "Coal Combustion Source Emissions Across US") +
  xlab( "Years") + ylab("PM2.5 emitted (tons)") +
  geom_bar(stat = "identity")
dev.off()


