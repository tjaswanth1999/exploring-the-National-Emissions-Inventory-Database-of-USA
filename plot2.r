#reading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting the data of baltimore city
baltimore_data<-NEI[NEI$fips=="24510",]
head(baltimore_data)

#Caliculating the sum of emmisions in each year
years_sum<-tapply(baltimore_data$Emissions,baltimore_data$year,sum)
years_sum

#plot showing hor PM2.5 emission have decreased over the years
png(filename = "plot2.png")
par(mar=c(5,5,2,1))
plot(unique(baltimore_data$year),years_sum,type="l",main = "Total emission of PM2.5 in Baltimore city",xlab = "YEAR",ylab = "Total emission of PM2.5 in Baltimore city",lwd=3)
dev.off()