#Uncomment to install the following packages
#install.packages('data.table')
#install.packages('dplyr')
#install.packages('tidyr')
#install.packages('Rmisc')

library(data.table)
library(dplyr)
library(tidyr)
library(Rmisc)
library(ggplot2)

college2010 <- fread('2010_data.csv', header=TRUE)
college2011 <- fread('2011_data.csv', header=TRUE)
college2012 <- fread('2012_data.csv', header=TRUE)
college2013 <- fread('2013_data.csv', header=TRUE)
college2014 <- fread('2014_data.csv', header=TRUE)
college2015 <- fread('2015_data.csv', header=TRUE)
college2016 <- fread('2016_data.csv', header=TRUE)
college2017 <- fread('2017_data.csv', header=TRUE)

# 2017

fr2017_all2 <- college2017 %>% drop_na("Full-time retention rate") %>% select('Full-time retention rate', 'Institution size Category')
fr2017_all2$"`Institution size Category`" <- as.numeric(fr2017_all$"`Institution size Category`")

fr2017_all2[which(fr2017_all2$"Institution size Category" <= 2)]$'Full-time retention rate'
fr2017_all2[which(fr2017_all2$"Institution size Category" >= 3)]$'Full-time retention rate'

t.test(sample(fr2017_all2[which(fr2017_all2$"Institution size Category" <= 2)]$'Full-time retention rate', 50), sample(fr2017_all2[which(fr2017_all2$"Institution size Category" >= 3)]$'Full-time retention rate', 50))
