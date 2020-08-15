#reading the datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#deriving emission data that is related to coal combustion source
coal_class_code <- SCC[grepl("Coal", SCC$Short.Name), ]
coal_class_code<-coal_class_code[,1]
data<-NEI[NEI$SCC %in% coal_class_code1,]

#caliculating sum of emmisions in each year by coal rlated sources
years_sum<-tapply(data$Emissions,data$year,sum)
years_sum

#plotting PM2.5 emissions related to coal
png(filename = "plot4.png")
plot(unique(data$year),years_sum,type = "l",ylab = "PM2.5 emissions related to coal",xlab = "Year",
     main = "PM2.5 emissions related to Coal-Combustion source across USA",lwd="3",col="3")
dev.off()