setwd(".//Data")

#Extract the number of rows from origianl merged raw data, 
#Track the number of cumulative matched rows, number of N/A values in
#Rankings, Economies, GDP, Income groups, and cumulative unmatched rows
NumberMissingValues <- function(MergeData1){
  print(paste0("Total Number of Rows in Merged Data: ", nrow(MergeData1)))
  NARanking<-sum(is.na(MergeData1$Ranking) == TRUE)
  print(paste0("Number of N/A Rankings: ", NARanking))
  NAEconomy<-sum(is.na(MergeData1$Economy) == TRUE)
  print(paste0("Number of N/A Economies: ", NAEconomy))
  NAGDP<-sum(is.na(MergeData1$`US Dollars (millions)`) == TRUE)
  print(paste0("Number of N/A GDPs: ", NAGDP))
  NAIncomeGroup<-sum(is.na(MergeData1$Income.Group) == TRUE)
  print(paste0("Number of N/A Income Groups: ", NAIncomeGroup))
  NATotal<-sum(is.na(MergeData1$Ranking) == TRUE| is.na(MergeData1$Economy) == TRUE |
               MergeData1$`US Dollars (millions)` == TRUE | 
               is.na(MergeData1$Income.Group) == TRUE)
  print(paste0("Total Number of Unmatched Rows: ", NATotal))
}

#find the number of matched values in the new data set, after merge
NumberMatchedValues <- function(MergeData1){
  print(paste0("Number of Rows in Merged Data with complete values: ", nrow(MergeData2)))
}

Find13thGDPAscending <- function(NegGDP, x){
#Code to find 13th country with the ascending GDP. 
#More code to show that there is a tie between St. Kitts and Grenada at 12th place,
#which results the alphabetical order to dictate St. Kitts at 13th place in ranking.
  country13NegGDP<-NegGDP[x,3]
  print(paste0("The 13th country in ascending order by GDP is: ", country13NegGDP))
}

FindException <- function(NegGDP, x, y) {
  pander(NegGDP[x:y,2:5])
}


#Find the average GDP rank of countries from a certain income group
AverageGDPByGroup <- function(MergeData2, x) {
  y<-round(mean(MergeData2[which(MergeData2$Income.Group == x), ]$Ranking), digits = 2)
  print(paste0("The average GDP ranking of ", x, " countries is: ", y))
}

  
#AverageGDPByIncome <- function(MergeData2, x){
#  HIOECD <- MergeData2[ which(MergeData2$Income.Group=='High income: OECD'), ]
#  head(HIOECD)
#  write.csv(HIOECD, "HIOECD.csv")
#  HAvgGDPRank<- mean(HIOECD$Ranking)
#  print(paste0("The average GDP ranking of high income, OECD countries is: ",
#             round(HAvgGDPRank, digits = 2)))
#}


#HINonOECD <- MergeData2[ which(MergeData2$Income.Group=='High income: nonOECD'), ]
#head(HINonOECD)
#write.csv(HINonOECD, "HINonOECD.csv")
#NAvgGDPRank<- mean(HINonOECD$Ranking)
#print(paste0("The average GDP ranking of high income, nonOECD countries is: ",
#             round(NAvgGDPRank, digits = 2)))

#Using ggplot2, individual countries with matching rows in GDP are logarithmically plotted
#by separately colored income group box plots to show distribution.
GraphBoxPlotsByGroup <- function(NegGDP, v, w, x, y, z) {
  NegGDP$Income.Group <- factor(NegGDP$Income.Group, levels=c("Low income", 
                                                              "Lower middle income", "Upper middle income",
                                                              "High income: nonOECD", "High income: OECD"))
  color.codes<-as.character(c(v, w, x, y, z))
  ggplot(data = NegGDP, aes(y = `US Dollars (millions)`, x = Income.Group, 
                          colour = Income.Group))+ geom_boxplot() + scale_y_log10() +
                          scale_colour_manual(breaks = NegGDP$Income.Group,values =
                          unique(as.character(color.codes)))
}
SummaryStats <- function(NegGDP) {
  pander(tapply(NegGDP$`US Dollars (millions)`, NegGDP$Income.Group, summary))
}

#GDP rankings per quantile by income group

GDPRankingsPerQuantByIncome <- function(NegGDP, Quantiles, x) {
  Quantiles<-cut(NegGDP$Ranking, breaks=quantile(NegGDP$Ranking,seq(0, 1, x)))
  #Using reshape2, a table shows the number of contries per income group that falls inside 
  #their respective 20% quantile groups based on individual GDP ranking
  panderOptions('table.split.table', Inf)
  pander(table(NegGDP$Income.Group, Quantiles))
}

CountriesByIncomeGDPRank <- function(NegGDP, y, z) {
  LowerMiddleTop38 <- NegGDP[which(NegGDP$Ranking <= y & 
                                   NegGDP$Income.Group == z),2:5]
  pander(LowerMiddleTop38[seq(dim(LowerMiddleTop38)[1],1),])
}