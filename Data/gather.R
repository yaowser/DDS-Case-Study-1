# Title: MSDS 6306 401 Case Study 1: Exploration of Countries’ GDPs Vs Income Groups
# Author: Yao Yao
# Date: March 9, 2017
# R version 3.3.2 (2016-10-31) -- "Sincere Pumpkin Patch"
# Platform: x86_64-w64-mingw32/x64 (64-bit)

#Download files via internet, read files into csv into respective destination files as needed
if (!file.exists("GDPWeb.csv")) {
  download('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
           destfile='GDPWeb.csv')
}
if (!file.exists("EducationalWeb.csv")) {
  download('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv',
           destfile='EducationalWeb.csv')
}
list.files() #make sure the files are there
