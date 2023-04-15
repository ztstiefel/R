# install and load necessary packages
install.packages("readxl")
library('readxl')

install.packages("janitor")
library("janitor")

install.packages("ggplot2")
library("ggplot2")
# set working directory to location of data (in this case an .xlsx file)
setwd("C:\\Users\\ztsti\\Downloads")
# read .xlsx (Sheet2" contains the data) into variable 'demoData'
demoData <- read_excel('TMSC 2022-2023 GP3 Failure Analysis-demo_data.xlsx', sheet="Sheet2")

# clean column names to be more user-friendly
demoData %>% clean_names()

# plot data
ggplot(data=demoData) + geom_bar(mapping=aes(
  x=`Fed Ethnic Description`,fill=`ECO STATUS`)) + 
  labs(title="2022 - 2023 Choir Program Enrollment",
       subtitle="Breakdown by Ethnicity and Economic Status",
       x="Ethnicity", y="Count") + 
  theme(legend.position="top", legend.title=element_blank())