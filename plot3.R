##import needed libraries

library(dplyr)
library(ggplot2)

##Import Source Classification Code File
SCCode<-readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

##Import PM25 File

pm25<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

##create subset using dplyr function
balt<-filter(pm25, fips == "24510", year == 1998 | year == 1999 | 
                     year == 2000 | year == 2001 | year == 2002 | 
                     year == 2003 | year == 2004 | year == 2005 | 
                     year == 2006 | year == 2007 | year == 2008)

##create a subet of the original balt to remove outliers
balt1<-filter(balt, Emissions<="500")

## store the ggplot function
b<-ggplot(balt1, aes(year, Emissions))+facet_grid(. ~ type)+geom_point()+
        labs(x = "Year")+labs(y = "PM2.5 Emissions")+
        labs(title = "Baltimore PM2.5 Emissions by Type")+geom_smooth(method = "lm")

## start the png function
png("plot3.png", width = 700, height = 700)

##call the b variable 
b

## end the png function
dev.off()