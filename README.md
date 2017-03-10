# DDS-Case-Study-1

This depository is Case Study 1 for Doing Data Science 6306 Section 401 Tuesdays at 9:30 - 11:00 PM EST, Cohort 2017 Spring semester at SMU -- "DDS-Case-Study-1" for short. Author: Yao Yao. This project was submitted through GitHub on RStudio version 1.0.136.

There are 2 directories in this depository: Data and Analysis with the Paper files in the Root directory

# Reason for analysis

To explore and understand the relationship between country GDP and income group for the different nations around the world to come up with meaningful conclusions from various analysis.

To use Github as a repository for R code and data files as well as to use R markdown to document steps, which makes the work reproducible for future analysis.

# Root Directory:

"Yao Yao MSDS 6306 401 Case Study 1 Paper.Rmd" is the R markdown file of the paper that is fully follows the rubric of annotating code, calling .R files from other directories, and completes the analysis with conclusive statements

"Yao_Yao_MSDS_6306_401_Case_Study_1_Paper.pdf" is the final knitted paper that combines text, code, and output into one conclusive file ready for submission

"DDS-Case-Study-1.Rproj" is the R project file for Rstudio

# Data directory:

1. main_helper.R – contains .R code that sources everything together prior to analysis

2. gather.R – contains .R code that gathers data sets from websites and stores into EducationalWeb.csv and GDPWeb.csv

3. clean_GDP.R – contains .R code that cleans GDPraw.csv

4. clean_education.R – contains .R code that cleans Educationraw.csv

5. merge.R – contains .R code that merges GDPdata.csv and Educationraw.csv into MergeData1 and creates subsets for later analysis

"Yao Yao MSDS 6306 401 Case Study1 Makefile.txt" is the full composition of the R code from beginning to end, which combined the gather, clean, and analysis procedures.

"VariableDescriptions.Rmd" is the markdown file that describes the column names

"GDPWeb.csv" is the original data taken from http://data.worldbank.org/data-catalog/GDP-ranking-table, which was last updated on 01-Feb-2017.

"EducationalWeb.csv" is the original data taken from http://data.worldbank.org/data-catalog/ed-stats, which was last updated on 22-Feb-2017.

"GDPRaw.csv" is the raw GDP data that was imported to incorporate column names and cleaned prior to merging 

"EducationRaw.csv" is the raw educational data that was imported to incorporate column names and cleaned prior to merging 

"GDPData.csv" is the cleaned GDP data with columns reduced ready to be merged

"MergeData1.csv" is the initial data frame that contains all the columns of GDP and Education data

"MergeData2.csv" is the truncated data frame of MergeData1 that reduces the columns to those that were analyzed

"NegGDP.csv" is the ordering of GDP rankings in ascending order from MergeData2

"HINonOECD.csv" is list of the High Income nonOECD countries created from NegGDP

"HIOECD.csv" is list of the High Income OECD countries created from NegGDP

"Quantiles.csv" is the resulting categorization of country GDP rankings to their respective quantile group

"LowerMiddleTop38.csv" lists the lower middle income countries in the top 38 GDP rankings

# Analysis directory:

1. main.R – contains .R code that has working functions to do the analysis

# Other Directory:

"Yao Yao MSDS 6306 401 Case Study1 old.R" is the original .R file that had the complete working code before .R file separation into parts and directories

"Yao Yao MSDS 6306 401 Case Study1 old.Rmd" is the original .rmd file that was knitted with the complete annotation with code and conclusions.

"Yao_Yao_MSDS_6306_401_Case_Study1 old.pdf" is the final knitted file that combined the complete code with annotation and conclusions from analysis.

"Case+study+1.pdf" is the original assignment sheet
