
#Import raw education data from csv and examine attributes
EducationRaw <- read.csv('EducationalWeb.csv',stringsAsFactors = FALSE, header = TRUE)
dim(EducationRaw)