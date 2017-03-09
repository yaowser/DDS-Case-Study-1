
#Install and load required packages as needed for the gathering and analysis procedures
InstallLoadMultPackage <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}
InstallLoadMultPackage(c("downloader", "ggplot2", "reshape2"))


getwd()
list.files()
source("gather.R")
source("clean_GDP.R")
source("clean_education.R")
source("merge.R")
main <- function(){
  source("main.R")
}