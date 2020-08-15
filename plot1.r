#reading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Caliculating the sum of emmisions in each year
years_sum<-tapply(NEI$Emissions, NEI$year,sum)

#plot showing hor PM2.5 emission have decreased over the years
png(filename = "plot1.png")
plot(unique(NEI$year),years_sum,type="l",main = "Total emission of PM2.5 in USA",xlab = "YEAR",ylab = "Total emission of PM2.5",lwd=3)
dev.off()
