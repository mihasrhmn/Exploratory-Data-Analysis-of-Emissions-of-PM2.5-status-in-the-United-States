# downloading the dataset & unziping it into the current folder
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, destfile = "dataFiles.zip", method = "curl")
unzip(zipfile = "dataFiles.zip")

# reading the dataset
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

# tidying the dataset for the barplot
NEI$year <- as.factor(NEI$year)
total_emission <- tapply(NEI$Emissions, NEI$year, sum)


# setting the output png file dimensions:
png(filename = "plot1.png", width=480, height= 480)
# creating the barplot
barplot(total_emission, 
        main="Total PM2.5 Emissions \n  all over United States\n",
        xlab="Years",ylab="PM2.5 emitted (tons)")
dev.off()
