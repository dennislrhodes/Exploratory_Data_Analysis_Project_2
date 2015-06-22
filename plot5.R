library(ggplot2)

##Import Source Classification Code File
SCCode<-readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

##Import PM25 File

pm25<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

##merge the data
m5<-merge(SCCode,pm25, by = "SCC")

##subset the pm25 data for baltimore
pm_balt <- m5[m5$fips == "24510",]

##assign the terms we are searching for to a variable
Cars<-c("Mobile - On-Road Gasoline Light Duty Vehicles", "Mobile - On-Road Gasoline Heavy Duty Vehicles",
        "Mobile - On-Road Diesel Light Duty Vehicles", "Mobile - On-Road Diesel Heavy Duty Vehicles")

##subset the data using the previous variable
Sub5<-pm_balt[pm_balt$EI.Sector == Cars,]

##store the ggplot to a vriable
e<-ggplot(Sub5, aes(year, Emissions))+geom_point()+
        labs(x = "Year")+labs(y = "PM2.5 Emissions")+
        labs(title = "PM2.5 Emissions from Motor Vehicles")+geom_smooth(method = "lm")

##start the png function
png("plot5.png", width = 700, height = 700)

##call the ggplot variable
e

##end the png function
dev.off()
