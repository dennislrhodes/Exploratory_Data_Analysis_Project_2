library(ggplot2)

##Import Source Classification Code File
SCCode<-readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

##Import PM25 File

pm25<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

##merge the data
m_b_la<-merge(SCCode,pm25, by = "SCC")

##subset the pm25 data for baltimore
pm_balt_los <- m_b_la[m_b_la$fips == "24510" | m_b_la$fips == "06037",]

##assign the terms we are searching for to a variable
Cars<-c("Mobile - On-Road Gasoline Light Duty Vehicles", "Mobile - On-Road Gasoline Heavy Duty Vehicles",
        "Mobile - On-Road Diesel Light Duty Vehicles", "Mobile - On-Road Diesel Heavy Duty Vehicles")

##subset the data using the previous variable
Sub6<-pm_balt_los[pm_balt_los$EI.Sector == Cars,]

##store the ggplot to a vriable
e6<-ggplot(Sub6, aes(year, Emissions))+geom_point()+
        labs(x = "Year")+labs(y = "PM2.5 Emissions")+
        labs(title = "PM2.5 Emissions from Moter Vehicles for Baltimore(24510) and L.A.(06037)")+geom_smooth(method = "lm")+
        facet_grid(. ~ fips)

##start the png function
png("plot6.png", width = 700, height = 700)

##call the ggplot variable
e6

##end the png function
dev.off()
