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

## 4ª
library(ggplot2)
library(lubridate)
Scoal <- hearclass[(grepl('coal', hearclass$Short.Name, ignore.case = T)),]
plt4 <- rdata[rdata$SCC %in% Scoal$SCC,]
plt4sum <- aggregate(Emissions ~ year + type, plt4, sum)
qplot(year, Emissions, data=plt4sum, geom='line', col=type) + labs(y=expression("" ~ PM[2.5] ~ "Coal Emission (tons)"),
                                                                   title = expression("Coal" ~ PM[2.5] ~ 
                                                                                            "Emissions by Source Type and Year"))
dev.copy(png, 'Plot4.png')
dev.off()

