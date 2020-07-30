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

## 2ª
sub2 <- subset(rdata, fips == '24510' )
plt2 <- tapply(sub2$Emissions, sub2$year , sum)

plot(names(plt2), plt2, type='o',col='blue', xlab='Years', ylab= expression('Total '~PM[2.5]~'Emission (tons)'))
title(expression('Total emissions from ' ~ PM[2.5]~' in Baltimore City, 1999-2008'))
dev.copy(png, 'Plot2.png')
dev.off()

