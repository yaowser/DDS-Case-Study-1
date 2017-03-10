# Title: MSDS 6306 401 Case Study 1: Exploration of Countries’ GDPs Vs Income Groups
# Author: Yao Yao
# Date: March 9, 2017
# R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
# Platform: x86_64-w64-mingw32/x64 (64-bit)

#Install and load required packages as needed for the gathering and analysis procedures
InstallLoadMultPackage <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}
InstallLoadMultPackage(c("downloader", "ggplot2", "reshape2", "pander"))

#all the data is in the data directory, hence setting it there
setwd(".//Data")
getwd()
list.files()

#sourcing different .R code to gather, clean, and merge, pre-analysis
source("gather.R")
source("clean_GDP.R")
source("clean_education.R")
source("merge.R")