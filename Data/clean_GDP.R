

#Import csv into raw GDP file and examine attributes
GDPRaw <- read.csv('GDPWeb.csv',stringsAsFactors = FALSE, header = TRUE)

#Eliminate header rows, rows without GDP, and unused columns.
GDPData <- GDPRaw[5:194,1:5]
#Reset column count and examine data
rownames(GDPData) <- seq(length=nrow(GDPData))
head(GDPData)
tail(GDPData)

#Retitle columns and remove unused columns
colnames(GDPData) <- c("CountryCode","Ranking","x","Economy","US Dollars (millions)")
head(GDPData)
GDPData <- GDPData[,c("CountryCode","Ranking","Economy","US Dollars (millions)")]
head(GDPData)

#Set the ranking as integer and GDP as numeric for later analysis, recheck attributes
GDPData$Ranking <- as.integer(GDPData$Ranking)
GDPData$`US Dollars (millions)` <- as.numeric(gsub(",", "", GDPData$`US Dollars (millions)`))
dim(GDPData)

