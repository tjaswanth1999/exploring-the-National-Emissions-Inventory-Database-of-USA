#reading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting the data of baltimore city
baltimore_data<-NEI[NEI$fips=="24510",]

#Caliculating the sum of emmisions in each year
years_sum<-aggregate(baltimore_data$Emissions,by=list(baltimore_data$type, baltimore_data$year),FUN=sum)
colnames(years_sum)<-c("type","year","emissions")
years_sum

#making a plot to compare emission of PM2.5 by different sources from 1999 to 2008
library(ggplot2)
png(filename = "plot3.png")
qplot(year,emissions,data = years_sum,col=type,geom = "line")+
  ggtitle("PM2.5 emitted by different type of sorces in Baltimore city")+
  ylab("PM2.5 emission")
dev.off()
