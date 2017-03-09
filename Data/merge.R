
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