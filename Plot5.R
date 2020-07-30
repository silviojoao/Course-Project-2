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

## 5º
sub5 <- subset(rdata, fips == '24510' & type=='ON-ROAD' )
plt5 <- tapply(sub5$Emissions, sub5$year, sum)
plot(names(plt5), plt5, type='o', col='blue', ylab= expression(~PM[2.5]~ 'Motor Vehicle Emissions'),
     xlab = 'years')
title(expression('Baltimore ' ~ PM[2.5] ~ 'Motor Vehicle Emissions by Year'))
dev.copy(png, 'Plot5.png')
dev.off()
