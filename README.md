## Introduction

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the <a href="http://www.epa.gov/ttn/chief/eiinformation.html">EPA National Emissions Inventory web site</a>

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that I will use for this assignment are for 1999, 2002, 2005, and 2008.

Data
---------

The data for this assignment are available from the course web site as a single zip file:

* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip">Emissions of PM2.5 status</a> [29Mb]

The zip file contains two files:

PM2.5 Emissions Data (``summarySCC_PM25.rds``): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of **tons** of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.


```
##     fips      SCC Pollutant Emissions  type year
## 4  09001 10100401  PM25-PRI    15.714 POINT 1999
## 8  09001 10100404  PM25-PRI   234.178 POINT 1999
## 12 09001 10100501  PM25-PRI     0.128 POINT 1999
## 16 09001 10200401  PM25-PRI     2.036 POINT 1999
## 20 09001 10200504  PM25-PRI     0.388 POINT 1999
## 24 09001 10200602  PM25-PRI     1.490 POINT 1999
```

Below are the descriptions of the 6 variables in the dataset:

* ``fips``: A five-digit number (represented as a string) indicating the U.S. county
* ``SCC``: The name of the source as indicated by a digit string (see source code classification table)
* ``Pollutant``: A string indicating the pollutant
* ``Emissions``: Amount of PM2.5 emitted, in tons
* ``type``: The type of source (point, non-point, on-road, or non-road)
* ``year``: The year of emissions recorded

Source Classification Code Table (``Source_Classification_Code.rds``): This table provides a mapping from the ``SCC`` digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and one may choose to explore whatever categories he/she thinks are most useful. For example, source "10100101" is known as "Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal".

One can read each of the two files using the ``readRDS()`` function in R. For example, reading in each file can be done with the following code:


```r
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
```

as long as each of those files are in the current working directory (check by calling ``dir()`` and see if those files are in the listing).


Assignment
---------------
The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999-2008. You may use any R package you want to support your analysis.

### Questions

One must address the following questions and tasks in their exploratory analysis.

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
2. Have total emissions from PM2.5 decreased in the **Baltimore City**, Maryland (``fips == "24510"``) from 1999 to 2008? 
3. Of the four types of sources indicated by the ``type`` (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for **Baltimore City**? Which have seen increases in emissions from 1999-2008?
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
5. How have emissions from motor vehicle sources changed from 1999-2008 in **Baltimore City**?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in **Los Angeles County**, California (``fips == "06037"``). Which city has seen greater changes over time in motor vehicle emissions?


### Results

### Answer 1
Total emissions from PM2.5 decreased in the United States from 1999 to 2008.

![plot of chunk unnamed-chunk-2](plot1.png) 

### Answer 2
Total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008.

![plot of chunk unnamed-chunk-2](plot2.png) 


### Answer 3
Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, all of them decreased to an extent from the year 1999. But the ``Non-Road`` type have decreased more in emissions from 1999-2008 in Baltimore City than other three types. On the otherhand, the ``Point`` type have seen increases in emissions from 1999.

![plot of chunk unnamed-chunk-2](plot3.png) 


### Answer 4
Across the United States, the emissions of PM2.5 have decreased from coal combustion-related sources from 1999-2008.

![plot of chunk unnamed-chunk-2](plot4.png) 


### Answer 5
In Baltimore City, the emissions of PM2.5 have decreased from motor vehicle sources from 1999-2008.

![plot of chunk unnamed-chunk-2](plot5.png) 


### Answer 6
Compared to Los Angeles county, Baltimore City had less PM2.5 emissions from motor vehicle sources. But in recent years, Los Angeles county has seen greater changes in emission compare to the Baltimore City.
![plot of chunk unnamed-chunk-2](plot6.png) 
