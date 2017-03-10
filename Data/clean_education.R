# Title: MSDS 6306 401 Case Study 1: Exploration of Countries’ GDPs Vs Income Groups
# Author: Yao Yao
# Date: March 9, 2017
# R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
# Platform: x86_64-w64-mingw32/x64 (64-bit)

#Import raw education data from csv and examine attributes
EducationRaw <- read.csv('EducationalWeb.csv',stringsAsFactors = FALSE, header = TRUE)
dim(EducationRaw)