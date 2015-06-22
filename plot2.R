##Import Source Classification Code File
SCCode<-readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

##Import PM25 File

pm25<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

##load the needed package
library(dplyr)

##create subset using dyplr package
balt<-filter(pm25, fips == "24510", year == 1998 | year == 1999 | 
                     year == 2000 | year == 2001 | year == 2002 | 
                     year == 2003 | year == 2004 | year == 2005 | 
                     year == 2006 | year == 2007 | year == 2008)

##use tapply function to get emissions by year for baltimore
s_balt<-tapply(balt$Emissions, balt$year, sum)

##start png function
png("plot2.png")

##plot graph
plot(names(s_balt), s_balt, type = "l", xlab = "Year", 
     ylab = "Total PM2.5 Emissions", main = "Total Baltimore PM2.5 Emissions by Year")

## end png function
dev.off()