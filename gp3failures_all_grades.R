# install and load necessary packages

install.packages("janitor")
library("janitor")

install.packages("ggplot2")
library("ggplot2")

install.packages("forcats")
library("forcats")

# set working directory to location of data
setwd("C:\\Users\\ztsti\\Downloads")

# import .csv file
gp3cf <- read.csv('TMSC 2022-2023 GP3 Failure Analysis - original.csv')

# clean column names
gp3cf = clean_names(gp3cf)

# replace blank strings with NA
gp3cf <- replace(gp3cf, gp3cf=='', NA)

# Fill down missing data in specified columns
gp3cf = gp3cf %>% fill(
  student_id,student_name_last_first_middle,grade,bld,sex,ethnicity, .direction='down')

# Remove intermediary whitespace in the course_sec column
gp3cf$course_sec <- gsub('\\s+','',gp3cf$course_sec)

View(gp3cf)
# all grades, fill by grade
gp3cf %>% group_by(`grade`) %>% 
  ggplot() + geom_bar(mapping=aes(x = fct_infreq(`description`),fill=factor(`grade`))) +
    labs(fill="Grade", title="Count of Course Failures", subtitle = "by grade level", x=" Course", y="Count")

# all grades, fill by sex
gp3cf %>% group_by(`grade`) %>% 
  ggplot() + geom_bar(mapping=aes(x = fct_infreq(`description`), fill = `sex`)) +
  labs(title="Count of Course Failures", subtitle = "by sex", x=" Course", y="Count")
  
# all grades, fill by grade (6)
gp3cf %>% group_by(`grade`) %>%  filter(`grade` == 6) %>% 
  ggplot() + geom_bar(mapping=aes(x = fct_infreq(`description`), fill=`grade`),fill="#F8766D") +
  labs(title="Count of Course Failures", subtitle = "6th Grade", x=" Course", y="Count")

# all grades, fill by grade (7)
gp3cf %>% group_by(`grade`) %>%  filter(`grade` == 7) %>% 
  ggplot() + geom_bar(mapping=aes(x = fct_infreq(`description`), fill=`grade`),fill="#00BA38") +
  labs(title="Count of Course Failures", subtitle = "7th Grade", x=" Course", y="Count")

# all grades, fill by grade (8)
gp3cf %>% group_by(`grade`) %>%  filter(`grade` == 8) %>% 
  ggplot() + geom_bar(mapping=aes(x = fct_infreq(`description`), fill=`grade`),fill="#619cff") +
  labs(title="Count of Course Failures", subtitle = "8th Grade", x=" Course", y="Count")
