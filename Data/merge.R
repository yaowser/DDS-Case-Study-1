# Title: MSDS 6306 401 Case Study 1: Exploration of Countries’ GDPs Vs Income Groups
# Author: Yao Yao
# Date: March 9, 2017
# R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
# Platform: x86_64-w64-mingw32/x64 (64-bit)

#Merge all columns from raw GDP data and Education based by country code. 
#Save into raw merge file and examine attributes.
MergeData1 <- merge(x = GDPData, y = EducationRaw, by ='CountryCode', all=TRUE)
dim(MergeData1)

#Remove merged columns based on lack of value in GDP, country, GDP ranking, or income group.

MergeData2<-MergeData1[rowSums(is.na(MergeData1[,2:5]))==FALSE,]
MergeData2<-MergeData2[,c("CountryCode","Ranking","Economy","US Dollars (millions)",
                          "Income.Group")]
#Examine attributes and reset column count based on country code
head(MergeData2)
tail(MergeData2)
dim(MergeData2)
rownames(MergeData2) <- seq(length=nrow(MergeData2))

#Export data frames into csv file in the data directory to keep track of edits and merges
write.csv(MergeData1, "MergeData1.csv")
write.csv(MergeData2, "MergeData2.csv")
write.csv(GDPRaw, "GDPRaw.csv")
write.csv(GDPData, "GDPData.csv")
write.csv(EducationRaw, "EducationRaw.csv")
write.csv(GDPData, "GDPData.csv")

#Rank the merged data by ascending GDP ranking, examine attributes and export dataset
NegGDP <- MergeData2[order(MergeData2$`US Dollars (millions)`),] 
head(NegGDP)
write.csv(NegGDP, "NegGDP.csv")

#Breaks the GDP rankings into 5  quantile groups, with increment of 20%, and writes
#the quantiles into csv. NegGDP is used because of predefined factors
Quantiles<-cut(NegGDP$Ranking, breaks=quantile(NegGDP$Ranking,seq(0, 1, 0.2)))
head(Quantiles)
write.csv(Quantiles, "Quantiles.csv")

#Document which countries from lower middle income group has the top 38 GDP rankings
LowerMiddleTop38 <- NegGDP[which(NegGDP$Ranking <= 38 & 
                                   NegGDP$Income.Group == "Lower middle income"),]
LowerMiddleTop38
write.csv(LowerMiddleTop38, "LowerMiddleTop38.csv")
