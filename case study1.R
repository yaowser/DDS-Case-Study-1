#directory set up

#setwd("C:\\Users\\Yao\\Dropbox\\dds w7 MSDS 6306 401")
getwd()
list.files()

#import libraries/packages, not sure if all was used ??
library(repmis)
library(RCurl)
install.packages('downloader')
library(downloader)
library(tidyr)
library(dplyr)
library(jsonlite)
library(WDI)
library(countrycode)
library(ggplot2)

#download files, read files into csv
download('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv', destfile='GDP.csv')
download('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv', destfile='educational.csv')

#make sure the files are there
list.files()

#import csv into raw GDP file and examine attributes
GDPraw <- read.csv('GDP.csv',stringsAsFactors = FALSE, header = TRUE)
str(GDPraw)

#eliminate header rows, rows without GDP, and unused columns, reset column count, examine data
GDPdata <- GDPraw[5:194,1:5]
rownames(GDPdata) <- seq(length=nrow(GDPdata))
head(GDPdata)
tail(GDPdata)

#retitle columns and remove unused column ** do I have to be more specific??
colnames(GDPdata) <- c("CountryCode","Ranking","x","Economy","US Dollars (millions)")
head(GDPdata)
GDPdata <- GDPdata[,c("CountryCode","Ranking","Economy","US Dollars (millions)")]
head(GDPdata)

#set the ranking as integer and GDP as numeric for later analysis, recheck attributes
GDPdata$Ranking <- as.integer(GDPdata$Ranking)
GDPdata$`US Dollars (millions)` <- as.numeric(gsub(",", "", GDPdata$`US Dollars (millions)`))
str(GDPdata)
dim(GDPdata)

#import raw education data from csv and examine attributes 
Educationraw <- read.csv('educational.csv',stringsAsFactors = FALSE, header = TRUE)
str(Educationraw)
dim(Educationraw)

#examine country code overlap and differences between data sets
table(GDPdata$CountryCode)
table(Educationraw$CountryCode)

#merge columns based on all rows, save into raw merge file, examine attributes
MergeData1 <- merge(x = GDPdata, y = Educationraw, by ='CountryCode', all=TRUE)
head(MergeData1)
dim(MergeData1)
tail(MergeData1)

#remove columns based on lack of value in GDP, country, or GDP ranking
#examine attributes and reset column count based on country code
MergeData2<-MergeData1[rowSums(is.na(MergeData1[,3:5]))==0,]
head(MergeData2)
dim(MergeData2)
tail(MergeData2)
rownames(MergeData2) <- seq(length=nrow(MergeData2))

#extract thee number of rows with NA GDPs and number of matched rows
NANumber<-rowSums(is.na(MergeData1[,3:4]))
NANumber2<-sum(NANumber/2)
NANumber2
Match<-(nrow(MergeData2))
Match
#1) 189 countries match, 45 countries have NA GDP values, eliminated

#technically, does not need to include, but need to see how the data is exported to csv file
write.csv(MergeData1, "MergeData1.csv")
write.csv(MergeData2, "MergeData2.csv")

#rank the merged data by ascending GDP, examine attributes
attach(MergeData2)
NegGDP <- MergeData2[order(-Ranking),] 
head(NegGDP)
str(NegGDP)

#find 13th country with the ascending GDP
country13NegGDP<-NegGDP[13,3]
country13NegGDP
#2) country #13

#Assign a subset of High Income OECD countries and find the mean of their GDP rank
HIOECD <- MergeData2[ which(MergeData2$Income.Group=='High income: OECD'), ]
head(HIOECD)
AvgGDPRank<- mean(HIOECD$Ranking)
AvgGDPRank

#Assign a subset of High Income NonOECD countries and find the mean of their GDP rank
HINonOECD <- MergeData2[ which(MergeData2$Income.Group=='High income: nonOECD'), ]
head(HINonOECD)
AvgGDPRank<- mean(HINonOECD$Ranking)
AvgGDPRank
#3) GDP rankings

#Plot country code and GDP in US dollars with income groupings as specific colors
color.codes<-as.character(c("#3399FF", "#FF0000","#0000FF", "#00FF00", "#D95F02"))
ggplot(data = NegGDP, aes(y = `US Dollars (millions)`, x =Income.Group, colour = Income.Group))+ 
   geom_boxplot() + scale_y_log10() +
  scale_colour_manual(breaks = NegGDP$Income.Group,values = unique(as.character(color.codes)))
#4) gg plot

#create the 5 number quantile summary ** is this what they are looking for?
summary(MergeData2$Ranking)

#create a new table featuring GDP ranking, country, and Income group. examine attributes
IncomeSub <- MergeData2[c(2,3,6)]
head(IncomeSub)

#Find the subset of countries that are lower middle in income group and top 38 in GDP ranking
LowerMiddleTop38 <- IncomeSub[which(IncomeSub$Ranking <= 38 & IncomeSub$Income.Group == "Lower middle income"),]
LowerMiddleTop38

#report the number of counties
nrow(LowerMiddleTop38)

#5) 5 lower income Countries with top 38 GDP