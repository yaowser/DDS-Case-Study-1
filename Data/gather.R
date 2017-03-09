
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

