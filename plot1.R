##Import Source Classification Code File
SCCode<-readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

##Import PM25 File

pm25<-readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

## create subset of the sum of all emissions by each year
t_emissions<-tapply(pm25$Emissions,pm25$year,sum)

## start the png function
png("plot1.png")

## Plot the graph
plot(names(t_emissions), t_emissions, 
     xlab = "Year", ylab = "Total PM2.5 Emissions", 
     main = "Total U.S. PM2.5 Emissions by Year", type= "l")

##end the png function
dev.off()
