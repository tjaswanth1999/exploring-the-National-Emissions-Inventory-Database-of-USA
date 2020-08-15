#reading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting the data of baltimore city where the emission is from motor vehicles(i.e ON-ROAD type)
baltimore_data<-NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
baltimore_data
#caliculating sum of emmisions in each year by motor vehicle rlated sources
years_sum<-tapply(baltimore_data$Emissions,baltimore_data$year,sum)
years_sum
data_1<-data.frame(year=unique(baltimore_data$year),emissions=years_sum)

#plotting PM2.5 emission from motor vehicles in baltimore city
library(ggplot2)
png(filename = "plot5.png")
ggplot(data_1,aes(x=year,y=emissions))+geom_bar(stat = "identity")+
  labs(x="year",y="PM2.5 emission")+   ggtitle("PM2.5 emission from motor vehicles in baltimore city")
dev.off()
