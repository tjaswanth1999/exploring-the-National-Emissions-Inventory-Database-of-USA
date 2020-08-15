#reading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#getting data of Baltimore and Los Angles PM2.5 emission from Motor vehicles
data_2<-NEI[NEI$fips=="06037"|NEI$fips=="24510",]
data_2<-data_2[data_2$type=="ON-ROAD",]
data_2

#caliculating yearly emission of PM2.5 in both Baltimore and Los Angles
years_sum<-aggregate(data_2$Emissions,by=list(data_2$fips, data_2$year),FUN=sum)
years_sum
colnames(years_sum)<-c("county","year","emission")
years_sum

#replacing county fips with city names
years_sum$county[years_sum$county=="24510"]="Baltimore"
years_sum$county[years_sum$county=="06037"]="Los Angles"
years_sum

#plotting PM2.5 emission in Baltimore city and Los Angles
library(ggplot2)
png(filename = "plot6.png")
ggplot(years_sum,aes(x=year,y=emission))+geom_bar(stat = "identity",aes(fill=county),position = "dodge")+
  labs(x="year",y="PM 2.5 emission")+ggtitle("PM2.5 emission in Baltimore city and Los Angles")
dev.off()