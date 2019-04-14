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
fr2017_all2$"Full-time retention rate" <- as.integer(fr2017_all2$"Full-time retention rate")
fr2017_all2 <- college2017 %>% drop_na("Full-time retention rate") %>% select('Full-time retention rate', 'Institution size Category', 'Sector of institution')
fr2017_new <- subset(fr2017_all2, fr2017_all2$'Full-time retention rate' > 20)

fr2017_new
hist(fr2017_new$'Full-time retention rate', breaks=20)

fr2017_new$"Institution size Category" <- as.numeric(fr2017_new$"Institution size Category")

fr2017_new$"Sector of institution" <- as.numeric(fr2017_new$"Sector of institution")

fr2017_new$'Full-time retention rate'

# Only consider public and private 4-year universities
fr2017_new[which((fr2017_new$"Institution size Category" >= 0) & (fr2017_new$"Institution size Category" <= 2) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate'
fr2017_new[which((fr2017_new$"Institution size Category" >= 3) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate'

hist(fr2017_new[which((fr2017_new$"Institution size Category" >= 0) & (fr2017_new$"Institution size Category" <= 2) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', breaks=20)
hist(fr2017_new[which((fr2017_new$"Institution size Category" >= 3) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', breaks=20)

t.test(sample(fr2017_new[which((fr2017_new$"Institution size Category" >= 0) & (fr2017_new$"Institution size Category" <= 2) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', 100), sample(fr2017_new[which((fr2017_new$"Institution size Category" >= 3) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', 100), var.equal = FALSE)

t.test(fr2017_new[which((fr2017_new$"Institution size Category" >= 0) & (fr2017_new$"Institution size Category" <= 2) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', fr2017_new[which((fr2017_new$"Institution size Category" >= 3) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', var.equal = FALSE, alternative = c("less"))

t.test(fr2017_new[which((fr2017_new$"Institution size Category" >= 0) & fr2017_new$"Institution size Category" <= 2)]$'Full-time retention rate', fr2017_new[which(fr2017_new$"Institution size Category" >= 3)]$'Full-time retention rate', var.equal = FALSE)

