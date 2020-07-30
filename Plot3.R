## Download the data
filename <- 'exdata_data_NEI_data.zip'
URL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'

if (!file.exists(filename)){
      download.file(URL, destfile = filename)
}

unzip(filename)

## Reads the file
rdata <- readRDS('summarySCC_PM25.rds')
hearclass <- readRDS('Source_Classification_Code.rds')

## 3ª
library(ggplot2)
library(lubridate)
sub3 <- subset(rdata, fips == '24510' )
sub3$year <- parse_date_time(sub3$year, 'Y(!)')
sub3$year <- as.Date(sub3$year)
qplot(year,Emissions, data=sub3, geom='line', facets = .~type, fill=type, col=type) +
      geom_bar(stat = 'identity') + labs(y=expression('Total' ~PM[2.5] ~ 'Emissions (tons)')) +
      labs(title='Total emissions from ' ~ PM[2.5]~' in Baltimore City, by Type')
dev.copy(png,'Plot3.png')
dev.off()

