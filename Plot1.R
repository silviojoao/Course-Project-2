
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

## 1ª 
plt1 <- tapply(rdata$Emissions, rdata$year, sum)

plot(names(plt1), plt1, type='o',col='blue', xlab='Years', ylab= expression('Total '~PM[2.5]~'Emission'))
title(expression('Total emissions from ' ~ PM[2.5]~'1999-2008'))

dev.copy(png, file='plot1.png')
dev.off()
