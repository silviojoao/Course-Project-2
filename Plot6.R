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

## 6º
subBa <- subset(rdata, fips == '24510' & type=='ON-ROAD' )
subLa <- subset(rdata, fips == '06037' & type=='ON-ROAD' )
pltBa <- tapply(subBa$Emissions, subBa$year, sum)
pltLa <- tapply(subLa$Emissions, subLa$year, sum)

plot(names(pltLa), pltLa, type='o', col='blue', ylab= expression(~PM[2.5]~ 'Motor Vehicle Emissions'),
     xlab = 'years', ylim = c(0,5000))
lines(names(pltBa), pltBa, col = 'red', type='o')
title(expression('Baltimore and Los Angeles ' ~ PM[2.5] ~ 'Motor Vehicle Emissions by Year'))
legend(2006,2500, legend=c('Los Angeles', "Baltimore"), cex=0.75, col=c('blue','red'), pch=1)
dev.copy(png, 'Plot6.png')
dev.off()
