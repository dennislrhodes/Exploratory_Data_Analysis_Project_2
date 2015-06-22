library(ggplot2)

##Import Source Classification Code File
SCCode<-readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

##Import PM25 File

pm25<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

##merge the data
m4<-merge(SCCode,pm25, by = "SCC")

##create a variable with desired terms
Comb<-c("Fuel Comb - Electric Generation - Coal", "Fuel Comb - Industrial Boilers, ICEs, Coal",
        "Fuel Comb - Comm/Institutional - Coal")

##subset SCCode based on desired terms
Sub<-m4[m4$EI.Sector == Comb,]

##use averages and tapply to slim down data points
t_m<- tapply(Sub$Emissions, Sub$year, mean)

##start png function
png("plot4.png", width = 700, height = 700)

##plot data
plot(names(t_m), t_m, 
     xlab = "Year", ylab = "Average PM2.5 Emissions", 
     main = "PM2.5 Emissions from Coal Combustion", type = "b")

##end png
dev.off()
