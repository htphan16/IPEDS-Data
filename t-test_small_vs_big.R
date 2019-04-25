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

# 2017 retention rate 
fr2017_all2 <- college2017 %>% drop_na("Full-time retention rate") %>% select('Full-time retention rate', 'Institution size Category', 'Sector of institution')
fr2017_all2$"Full-time retention rate" <- as.integer(fr2017_all2$"Full-time retention rate")
fr2017_new <- subset(fr2017_all2, fr2017_all2$'Full-time retention rate' != 0)

hist(fr2017_new$'Full-time retention rate', breaks=20)

fr2017_new$"Institution size Category" <- as.numeric(fr2017_new$"Institution size Category")

fr2017_new$"Sector of institution" <- as.numeric(fr2017_new$"Sector of institution")

# Only consider public and private 4-year universities

hist(fr2017_new[which((fr2017_new$"Institution size Category" >= 0) & (fr2017_new$"Institution size Category" <= 2) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', breaks=20)
hist(fr2017_new[which((fr2017_new$"Institution size Category" >= 3) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', breaks=20)

t.test(sample(fr2017_new[which((fr2017_new$"Institution size Category" >= 0) & (fr2017_new$"Institution size Category" <= 2) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', 100), sample(fr2017_new[which((fr2017_new$"Institution size Category" >= 3) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', 100), var.equal = FALSE)

t.test(fr2017_new[which((fr2017_new$"Institution size Category" >= 0) & (fr2017_new$"Institution size Category" <= 2) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', fr2017_new[which((fr2017_new$"Institution size Category" >= 3) & (fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]$'Full-time retention rate', var.equal = FALSE, alternative = c("less"))

t.test(fr2017_new[which((fr2017_new$"Institution size Category" >= 0) & fr2017_new$"Institution size Category" <= 2)]$'Full-time retention rate', fr2017_new[which(fr2017_new$"Institution size Category" >= 3)]$'Full-time retention rate', var.equal = FALSE, alternative = c("less"))

#ggplot(cars, aes(Type, Price)) + geom_boxplot()

fr2017_new2 <- fr2017_new[which((fr2017_new$"Sector of institution" <= 3) & (fr2017_new$"Sector of institution" >= 1))]
fr2017_new2$Size <- ifelse((fr2017_new2$"Institution size Category" >= 0) & (fr2017_new2$"Institution size Category" <= 3), 'Small', 'Big')
class(fr2017_new2$`Full-time retention rate`)
ggplot(fr2017_new2, aes(Size, fr2017_new2$`Full-time retention rate`)) + geom_boxplot()

# 2010
fr2010_all2 <- college2010 %>% drop_na("Full-time retention rate") %>% select('Full-time retention rate', 'Institution size Category', 'Sector of institution')
fr2010_all2$"Full-time retention rate" <- as.integer(fr2010_all2$"Full-time retention rate")
fr2010_new <- subset(fr2010_all2, fr2010_all2$'Full-time retention rate' != 0)

hist(fr2010_new$'Full-time retention rate', breaks=20)

fr2010_new$"Institution size Category" <- as.numeric(fr2010_new$"Institution size Category")

fr2010_new$"Sector of institution" <- as.numeric(fr2010_new$"Sector of institution")

# Only consider public and private 4-year universities

hist(fr2010_new[which((fr2010_new$"Institution size Category" >= 0) & (fr2010_new$"Institution size Category" <= 2) & (fr2010_new$"Sector of institution" <= 3) & (fr2010_new$"Sector of institution" >= 1))]$'Full-time retention rate', breaks=20)
hist(fr2010_new[which((fr2010_new$"Institution size Category" >= 3) & (fr2010_new$"Sector of institution" <= 3) & (fr2010_new$"Sector of institution" >= 1))]$'Full-time retention rate', breaks=20)

t.test(sample(fr2010_new[which((fr2010_new$"Institution size Category" >= 0) & (fr2010_new$"Institution size Category" <= 2) & (fr2010_new$"Sector of institution" <= 3) & (fr2010_new$"Sector of institution" >= 1))]$'Full-time retention rate', 100), sample(fr2010_new[which((fr2010_new$"Institution size Category" >= 3) & (fr2010_new$"Sector of institution" <= 3) & (fr2010_new$"Sector of institution" >= 1))]$'Full-time retention rate', 100), var.equal = FALSE)

t.test(fr2010_new[which((fr2010_new$"Institution size Category" >= 0) & (fr2010_new$"Institution size Category" <= 2) & (fr2010_new$"Sector of institution" <= 3) & (fr2010_new$"Sector of institution" >= 1))]$'Full-time retention rate', fr2010_new[which((fr2010_new$"Institution size Category" >= 3) & (fr2010_new$"Sector of institution" <= 3) & (fr2010_new$"Sector of institution" >= 1))]$'Full-time retention rate', var.equal = FALSE, alternative = c("less"))

t.test(fr2010_new[which((fr2010_new$"Institution size Category" >= 0) & fr2010_new$"Institution size Category" <= 2)]$'Full-time retention rate', fr2010_new[which(fr2010_new$"Institution size Category" >= 3)]$'Full-time retention rate', var.equal = FALSE, alternative = c("less"))

#ggplot(cars, aes(Type, Price)) + geom_boxplot()

fr2010_new2 <- fr2010_new[which((fr2010_new$"Sector of institution" <= 3) & (fr2010_new$"Sector of institution" >= 1))]
fr2010_new2$Size <- ifelse((fr2010_new2$"Institution size Category" >= 0) & (fr2010_new2$"Institution size Category" <= 3), 'Small', 'Big')
class(fr2010_new2$`Full-time retention rate`)
ggplot(fr2010_new2, aes(Size, fr2010_new2$`Full-time retention rate`)) + geom_boxplot()

# 2013
fr2013_all2 <- college2013 %>% drop_na("Full-time retention rate") %>% select('Full-time retention rate', 'Institution size Category', 'Sector of institution')
fr2013_all2$"Full-time retention rate" <- as.integer(fr2013_all2$"Full-time retention rate")
fr2013_new <- subset(fr2013_all2, fr2013_all2$'Full-time retention rate' != 0)

hist(fr2013_new$'Full-time retention rate', breaks=20)

fr2013_new$"Institution size Category" <- as.numeric(fr2013_new$"Institution size Category")

fr2013_new$"Sector of institution" <- as.numeric(fr2013_new$"Sector of institution")

# Only consider public and private 4-year universities
hist(fr2013_new[which((fr2013_new$"Institution size Category" >= 0) & (fr2013_new$"Institution size Category" <= 2) & (fr2013_new$"Sector of institution" <= 3) & (fr2013_new$"Sector of institution" >= 1))]$'Full-time retention rate', breaks=20)
hist(fr2013_new[which((fr2013_new$"Institution size Category" >= 3) & (fr2013_new$"Sector of institution" <= 3) & (fr2013_new$"Sector of institution" >= 1))]$'Full-time retention rate', breaks=20)

t.test(sample(fr2013_new[which((fr2013_new$"Institution size Category" >= 0) & (fr2013_new$"Institution size Category" <= 2) & (fr2013_new$"Sector of institution" <= 3) & (fr2013_new$"Sector of institution" >= 1))]$'Full-time retention rate', 100), sample(fr2013_new[which((fr2013_new$"Institution size Category" >= 3) & (fr2013_new$"Sector of institution" <= 3) & (fr2013_new$"Sector of institution" >= 1))]$'Full-time retention rate', 100), var.equal = FALSE)

t.test(fr2013_new[which((fr2013_new$"Institution size Category" >= 0) & (fr2013_new$"Institution size Category" <= 2) & (fr2013_new$"Sector of institution" <= 3) & (fr2013_new$"Sector of institution" >= 1))]$'Full-time retention rate', fr2013_new[which((fr2013_new$"Institution size Category" >= 3) & (fr2013_new$"Sector of institution" <= 3) & (fr2013_new$"Sector of institution" >= 1))]$'Full-time retention rate', var.equal = FALSE, alternative = c("less"))

t.test(fr2013_new[which((fr2013_new$"Institution size Category" >= 0) & fr2013_new$"Institution size Category" <= 2)]$'Full-time retention rate', fr2013_new[which(fr2013_new$"Institution size Category" >= 3)]$'Full-time retention rate', var.equal = FALSE, alternative = c("less"))

#ggplot(cars, aes(Type, Price)) + geom_boxplot()

fr2013_new2 <- fr2013_new[which((fr2013_new$"Sector of institution" <= 3) & (fr2013_new$"Sector of institution" >= 1))] %>% drop_na("Full-time retention rate")
fr2013_new2$Size <- ifelse((fr2013_new2$"Institution size Category" >= 0) & (fr2013_new2$"Institution size Category" <= 3), 'Small', 'Big')
class(fr2013_new2$`Full-time retention rate`)
ggplot(fr2013_new2, aes(Size, fr2013_new2$`Full-time retention rate`)) + geom_boxplot()

# 2014
fr2014_all2 <- college2014 %>% drop_na("Full-time retention rate") %>% select('Full-time retention rate', 'Institution size Category', 'Sector of institution')
fr2014_all2$"Full-time retention rate" <- as.integer(fr2014_all2$"Full-time retention rate")
fr2014_new <- subset(fr2014_all2, fr2014_all2$'Full-time retention rate' != 0)

hist(fr2014_new$'Full-time retention rate', breaks=20)

fr2014_new$"Institution size Category" <- as.numeric(fr2014_new$"Institution size Category")

fr2014_new$"Sector of institution" <- as.numeric(fr2014_new$"Sector of institution")

# Only consider public and private 4-year universities
hist(fr2014_new[which((fr2014_new$"Institution size Category" >= 0) & (fr2014_new$"Institution size Category" <= 2) & (fr2014_new$"Sector of institution" <= 3) & (fr2014_new$"Sector of institution" >= 1))]$'Full-time retention rate', breaks=20)
hist(fr2014_new[which((fr2014_new$"Institution size Category" >= 3) & (fr2014_new$"Sector of institution" <= 3) & (fr2014_new$"Sector of institution" >= 1))]$'Full-time retention rate', breaks=20)

t.test(sample(fr2014_new[which((fr2014_new$"Institution size Category" >= 0) & (fr2014_new$"Institution size Category" <= 2) & (fr2014_new$"Sector of institution" <= 3) & (fr2014_new$"Sector of institution" >= 1))]$'Full-time retention rate', 100), sample(fr2014_new[which((fr2014_new$"Institution size Category" >= 3) & (fr2014_new$"Sector of institution" <= 3) & (fr2014_new$"Sector of institution" >= 1))]$'Full-time retention rate', 100), var.equal = FALSE)

t.test(fr2014_new[which((fr2014_new$"Institution size Category" >= 0) & (fr2014_new$"Institution size Category" <= 2) & (fr2014_new$"Sector of institution" <= 3) & (fr2014_new$"Sector of institution" >= 1))]$'Full-time retention rate', fr2014_new[which((fr2014_new$"Institution size Category" >= 3) & (fr2014_new$"Sector of institution" <= 3) & (fr2014_new$"Sector of institution" >= 1))]$'Full-time retention rate', var.equal = FALSE, alternative = c("less"))

t.test(fr2014_new[which((fr2014_new$"Institution size Category" >= 0) & fr2014_new$"Institution size Category" <= 2)]$'Full-time retention rate', fr2014_new[which(fr2013_new$"Institution size Category" >= 3)]$'Full-time retention rate', var.equal = FALSE, alternative = c("less"))

#ggplot(cars, aes(Type, Price)) + geom_boxplot()

fr2014_new2 <- fr2014_new[which((fr2013_new$"Sector of institution" <= 3) & (fr2014_new$"Sector of institution" >= 1))] %>% drop_na("Full-time retention rate")
fr2014_new2$Size <- ifelse((fr2014_new2$"Institution size Category" >= 0) & (fr2014_new2$"Institution size Category" <= 3), 'Small', 'Big')
class(fr2014_new2$`Full-time retention rate`)
ggplot(fr2014_new2, aes(Size, fr2014_new2$`Full-time retention rate`)) + geom_boxplot()


# 2017 Total all revenues and other additions per entering class

tr2017_all2 <- college2017 %>% drop_na("Total all revenues and other additions", 'Total entering students at the undergraduate level, fall of current year') %>% select('Total all revenues and other additions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
tr2017_all2$'Total revenue per student' <- tr2017_all2$'Total all revenues and other additions'/tr2017_all2$'Total entering students at the undergraduate level, fall of current year'

tr2017_new <- subset(tr2017_all2, tr2017_all2$'Total revenue per student' != 0)

hist(tr2017_new$'Total revenue per student', breaks=20)

tr2017_new$"Sector of institution" <- as.numeric(tr2017_new$"Sector of institution")

# Only consider public and private 4-year universities
hist(tr2017_new[which((tr2017_new$"Institution size Category" >= 0) & (tr2017_new$"Institution size Category" <= 2) & (tr2017_new$"Sector of institution" <= 3) & (tr2017_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)
hist(tr2017_new[which((tr2017_new$"Institution size Category" >= 3) & (tr2017_new$"Sector of institution" <= 3) & (tr2017_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)

t.test(tr2017_new[which((tr2017_new$"Institution size Category" >= 0) & (tr2017_new$"Institution size Category" <= 2) & (tr2017_new$"Sector of institution" <= 3) & (tr2017_new$"Sector of institution" >= 1))]$'Total revenue per student', tr2017_new[which((tr2017_new$"Institution size Category" >= 3) & (tr2017_new$"Sector of institution" <= 3) & (tr2017_new$"Sector of institution" >= 1))]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

t.test(tr2017_new[which((tr2017_new$"Institution size Category" >= 0) & tr2017_new$"Institution size Category" <= 2)]$'Total revenue per student', tr2017_new[which(tr2017_new$"Institution size Category" >= 3)]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

# 2016 Total all revenues and other additions per entering class

tr2016_all2 <- college2016 %>% drop_na("Total all revenues and other additions", 'Total entering students at the undergraduate level, fall of current year') %>% select('Total all revenues and other additions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
tr2016_all2$'Total revenue per student' <- tr2016_all2$'Total all revenues and other additions'/tr2016_all2$'Total entering students at the undergraduate level, fall of current year'

tr2016_new <- subset(tr2016_all2, tr2016_all2$'Total revenue per student' != 0)

hist(tr2016_new$'Total revenue per student', breaks=20)

tr2016_new$"Sector of institution" <- as.numeric(tr2016_new$"Sector of institution")

# Only consider public and private 4-year universities
hist(tr2016_new[which((tr2016_new$"Institution size Category" >= 0) & (tr2016_new$"Institution size Category" <= 2) & (tr2016_new$"Sector of institution" <= 3) & (tr2016_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)
hist(tr2016_new[which((tr2016_new$"Institution size Category" >= 3) & (tr2016_new$"Sector of institution" <= 3) & (tr2016_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)

t.test(tr2016_new[which((tr2016_new$"Institution size Category" >= 0) & (tr2016_new$"Institution size Category" <= 2) & (tr2016_new$"Sector of institution" <= 3) & (tr2016_new$"Sector of institution" >= 1))]$'Total revenue per student', tr2016_new[which((tr2016_new$"Institution size Category" >= 3) & (tr2016_new$"Sector of institution" <= 3) & (tr2016_new$"Sector of institution" >= 1))]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

t.test(tr2016_new[which((tr2016_new$"Institution size Category" >= 0) & tr2016_new$"Institution size Category" <= 2)]$'Total revenue per student', tr2016_new[which(tr2016_new$"Institution size Category" >= 3)]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

# 2013 Total all revenues and other additions per entering class

tr2013_all2 <- college2013 %>% drop_na("Total all revenues and other additions", 'Total entering students at the undergraduate level, fall of current year') %>% select('Total all revenues and other additions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
tr2013_all2$'Total revenue per student' <- tr2013_all2$'Total all revenues and other additions'/tr2013_all2$'Total entering students at the undergraduate level, fall of current year'

tr2013_new <- subset(tr2013_all2, tr2013_all2$'Total revenue per student' != 0)

hist(tr2013_new$'Total revenue per student', breaks=20)

tr2013_new$"Sector of institution" <- as.numeric(tr2013_new$"Sector of institution")

# Only consider public and private 4-year universities
hist(tr2013_new[which((tr2013_new$"Institution size Category" >= 0) & (tr2013_new$"Institution size Category" <= 2) & (tr2013_new$"Sector of institution" <= 3) & (tr2013_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)
hist(tr2013_new[which((tr2013_new$"Institution size Category" >= 3) & (tr2013_new$"Sector of institution" <= 3) & (tr2013_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)

t.test(tr2013_new[which((tr2013_new$"Institution size Category" >= 0) & (tr2013_new$"Institution size Category" <= 2) & (tr2013_new$"Sector of institution" <= 3) & (tr2013_new$"Sector of institution" >= 1))]$'Total revenue per student', tr2013_new[which((tr2013_new$"Institution size Category" >= 3) & (tr2013_new$"Sector of institution" <= 3) & (tr2013_new$"Sector of institution" >= 1))]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

t.test(tr2013_new[which((tr2013_new$"Institution size Category" >= 0) & tr2013_new$"Institution size Category" <= 2)]$'Total revenue per student', tr2013_new[which(tr2013_new$"Institution size Category" >= 3)]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

# 2010 Total all revenues and other additions per entering class

tr2010_all2 <- college2010 %>% drop_na("Total all revenues and other additions", 'Total entering students at the undergraduate level, fall of current year') %>% select('Total all revenues and other additions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
tr2010_all2$'Total revenue per student' <- tr2010_all2$'Total all revenues and other additions'/tr2010_all2$'Total entering students at the undergraduate level, fall of current year'

tr2010_new <- subset(tr2010_all2, tr2010_all2$'Total revenue per student' != 0)

hist(tr2010_new$'Total revenue per student', breaks=20)

tr2010_new$"Sector of institution" <- as.numeric(tr2010_new$"Sector of institution")

# Only consider public and private 4-year universities
hist(tr2010_new[which((tr2010_new$"Institution size Category" >= 0) & (tr2010_new$"Institution size Category" <= 2) & (tr2010_new$"Sector of institution" <= 3) & (tr2010_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)
hist(tr2010_new[which((tr2010_new$"Institution size Category" >= 3) & (tr2010_new$"Sector of institution" <= 3) & (tr2010_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)

t.test(tr2010_new[which((tr2010_new$"Institution size Category" >= 0) & (tr2010_new$"Institution size Category" <= 2) & (tr2010_new$"Sector of institution" <= 3) & (tr2010_new$"Sector of institution" >= 1))]$'Total revenue per student', tr2010_new[which((tr2010_new$"Institution size Category" >= 3) & (tr2010_new$"Sector of institution" <= 3) & (tr2010_new$"Sector of institution" >= 1))]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

t.test(tr2010_new[which((tr2010_new$"Institution size Category" >= 0) & tr2010_new$"Institution size Category" <= 2)]$'Total revenue per student', tr2010_new[which(tr2010_new$"Institution size Category" >= 3)]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

# 2011 Total all revenues and other additions per entering class

tr2011_all2 <- college2011 %>% drop_na("Total all revenues and other additions", 'Total entering students at the undergraduate level, fall of current year') %>% select('Total all revenues and other additions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
tr2011_all2$'Total revenue per student' <- tr2011_all2$'Total all revenues and other additions'/tr2011_all2$'Total entering students at the undergraduate level, fall of current year'

tr2011_new <- subset(tr2011_all2, tr2011_all2$'Total revenue per student' != 0)

hist(tr2011_new$'Total revenue per student', breaks=20)

tr2011_new$"Sector of institution" <- as.numeric(tr2011_new$"Sector of institution")

# Only consider public and private 4-year universities

hist(tr2011_new[which((tr2011_new$"Institution size Category" >= 0) & (tr2011_new$"Institution size Category" <= 2) & (tr2011_new$"Sector of institution" <= 3) & (tr2011_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)
hist(tr2011_new[which((tr2011_new$"Institution size Category" >= 3) & (tr2011_new$"Sector of institution" <= 3) & (tr2011_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)

t.test(tr2011_new[which((tr2011_new$"Institution size Category" >= 0) & (tr2011_new$"Institution size Category" <= 2) & (tr2011_new$"Sector of institution" <= 3) & (tr2011_new$"Sector of institution" >= 1))]$'Total revenue per student', tr2011_new[which((tr2011_new$"Institution size Category" >= 3) & (tr2011_new$"Sector of institution" <= 3) & (tr2011_new$"Sector of institution" >= 1))]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

t.test(tr2011_new[which((tr2011_new$"Institution size Category" >= 0) & tr2011_new$"Institution size Category" <= 2)]$'Total revenue per student', tr2011_new[which(tr2011_new$"Institution size Category" >= 3)]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))


# 2012 Total all revenues and other additions per entering class

tr2012_all2 <- college2012 %>% drop_na("Total all revenues and other additions", 'Total entering students at the undergraduate level, fall of current year') %>% select('Total all revenues and other additions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
tr2012_all2$'Total revenue per student' <- tr2012_all2$'Total all revenues and other additions'/tr2012_all2$'Total entering students at the undergraduate level, fall of current year'

tr2012_new <- subset(tr2012_all2, tr2012_all2$'Total revenue per student' != 0)

hist(tr2012_new$'Total revenue per student', breaks=20)

tr2012_new$"Sector of institution" <- as.numeric(tr2012_new$"Sector of institution")

# Only consider public and private 4-year universities

hist(tr2012_new[which((tr2012_new$"Institution size Category" >= 0) & (tr2012_new$"Institution size Category" <= 2) & (tr2012_new$"Sector of institution" <= 3) & (tr2012_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)
hist(tr2012_new[which((tr2012_new$"Institution size Category" >= 3) & (tr2012_new$"Sector of institution" <= 3) & (tr2012_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)

t.test(tr2012_new[which((tr2012_new$"Institution size Category" >= 0) & (tr2012_new$"Institution size Category" <= 2) & (tr2012_new$"Sector of institution" <= 3) & (tr2012_new$"Sector of institution" >= 1))]$'Total revenue per student', tr2012_new[which((tr2012_new$"Institution size Category" >= 3) & (tr2012_new$"Sector of institution" <= 3) & (tr2012_new$"Sector of institution" >= 1))]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

t.test(tr2012_new[which((tr2012_new$"Institution size Category" >= 0) & tr2012_new$"Institution size Category" <= 2)]$'Total revenue per student', tr2012_new[which(tr2012_new$"Institution size Category" >= 3)]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

# 2014 Total all revenues and other additions per entering class

tr2014_all2 <- college2014 %>% drop_na("Total all revenues and other additions", 'Total entering students at the undergraduate level, fall of current year') %>% select('Total all revenues and other additions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
tr2014_all2$'Total revenue per student' <- tr2014_all2$'Total all revenues and other additions'/tr2014_all2$'Total entering students at the undergraduate level, fall of current year'

tr2014_new <- subset(tr2014_all2, tr2014_all2$'Total revenue per student' != 0)

hist(tr2014_new$'Total revenue per student', breaks=20)

tr2014_new$"Sector of institution" <- as.numeric(tr2014_new$"Sector of institution")

# Only consider public and private 4-year universities

hist(tr2014_new[which((tr2014_new$"Institution size Category" >= 0) & (tr2014_new$"Institution size Category" <= 2) & (tr2014_new$"Sector of institution" <= 3) & (tr2014_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)
hist(tr2014_new[which((tr2014_new$"Institution size Category" >= 3) & (tr2014_new$"Sector of institution" <= 3) & (tr2014_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)

t.test(tr2014_new[which((tr2014_new$"Institution size Category" >= 0) & (tr2014_new$"Institution size Category" <= 2) & (tr2014_new$"Sector of institution" <= 3) & (tr2014_new$"Sector of institution" >= 1))]$'Total revenue per student', tr2014_new[which((tr2014_new$"Institution size Category" >= 3) & (tr2014_new$"Sector of institution" <= 3) & (tr2014_new$"Sector of institution" >= 1))]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

t.test(tr2014_new[which((tr2014_new$"Institution size Category" >= 0) & tr2014_new$"Institution size Category" <= 2)]$'Total revenue per student', tr2014_new[which(tr2014_new$"Institution size Category" >= 3)]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

# 2015 Total all revenues and other additions per entering class

tr2015_all2 <- college2015 %>% drop_na("Total all revenues and other additions", 'Total entering students at the undergraduate level, fall of current year') %>% select('Total all revenues and other additions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
tr2015_all2$'Total revenue per student' <- tr2015_all2$'Total all revenues and other additions'/tr2015_all2$'Total entering students at the undergraduate level, fall of current year'

tr2015_new <- subset(tr2015_all2, tr2015_all2$'Total revenue per student' != 0)

hist(tr2015_new$'Total revenue per student', breaks=20)

tr2015_new$"Sector of institution" <- as.numeric(tr2015_new$"Sector of institution")

# Only consider public and private 4-year universities
hist(tr2015_new[which((tr2015_new$"Institution size Category" >= 0) & (tr2015_new$"Institution size Category" <= 2) & (tr2015_new$"Sector of institution" <= 3) & (tr2015_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)
hist(tr2015_new[which((tr2015_new$"Institution size Category" >= 3) & (tr2015_new$"Sector of institution" <= 3) & (tr2015_new$"Sector of institution" >= 1))]$'Total revenue per student', breaks=20)

t.test(tr2015_new[which((tr2015_new$"Institution size Category" >= 0) & (tr2015_new$"Institution size Category" <= 2) & (tr2015_new$"Sector of institution" <= 3) & (tr2015_new$"Sector of institution" >= 1))]$'Total revenue per student', tr2015_new[which((tr2015_new$"Institution size Category" >= 3) & (tr2015_new$"Sector of institution" <= 3) & (tr2015_new$"Sector of institution" >= 1))]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

t.test(tr2015_new[which((tr2015_new$"Institution size Category" >= 0) & tr2015_new$"Institution size Category" <= 2)]$'Total revenue per student', tr2015_new[which(tr2015_new$"Institution size Category" >= 3)]$'Total revenue per student', var.equal = FALSE, alternative = c("less"))

# 2015 Total expenses and other deductions per entering class

te2015_all2 <- college2015 %>% drop_na("Total expenses and other deductions", 'Total entering students at the undergraduate level, fall of current year') %>% select('Total expenses and other deductions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
te2015_all2$'Total expenses per student' <- te2015_all2$'Total expenses and other deductions'/te2015_all2$'Total entering students at the undergraduate level, fall of current year'

te2015_new <- subset(te2015_all2, te2015_all2$'Total expenses per student' != 0)

hist(te2015_new$'Total expenses per student', breaks=20)

te2015_new$"Sector of institution" <- as.numeric(te2015_new$"Sector of institution")

# Only consider public and private 4-year universities
hist(te2015_new[which((te2015_new$"Institution size Category" >= 0) & (te2015_new$"Institution size Category" <= 2) & (te2015_new$"Sector of institution" <= 3) & (te2015_new$"Sector of institution" >= 1))]$'Total expenses per student', breaks=20)
hist(te2015_new[which((te2015_new$"Institution size Category" >= 3) & (te2015_new$"Sector of institution" <= 3) & (te2015_new$"Sector of institution" >= 1))]$'Total expenses per student', breaks=20)

t.test(te2015_new[which((te2015_new$"Institution size Category" >= 0) & (te2015_new$"Institution size Category" <= 2) & (te2015_new$"Sector of institution" <= 3) & (te2015_new$"Sector of institution" >= 1))]$'Total expenses per student', te2015_new[which((te2015_new$"Institution size Category" >= 3) & (te2015_new$"Sector of institution" <= 3) & (te2015_new$"Sector of institution" >= 1))]$'Total expenses per student', var.equal = FALSE, alternative = c("less"))

t.test(te2015_new[which((te2015_new$"Institution size Category" >= 0) & te2015_new$"Institution size Category" <= 2)]$'Total expenses per student', te2015_new[which(te2015_new$"Institution size Category" >= 3)]$'Total expenses per student', var.equal = FALSE, alternative = c("less"))


# 2015 Total profit per entering class

tp2015_all2 <- college2015 %>% drop_na("Total all revenues and other additions", "Total expenses and other deductions", 'Total entering students at the undergraduate level, fall of current year') %>% select("Total all revenues and other additions", 'Total expenses and other deductions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
tp2015_all2$'Total profit per student' <- (tp2015_all2$'Total all revenues and other additions' - tp2015_all2$'Total expenses and other deductions')/tp2015_all2$'Total entering students at the undergraduate level, fall of current year'

tp2015_new <- subset(tp2015_all2, tp2015_all2$'Total profit per student' != 0)

hist(tp2015_new$'Total profit per student', breaks=20)

tp2015_new$"Sector of institution" <- as.numeric(tp2015_new$"Sector of institution")

# Only consider public and private 4-year universities
hist(tp2015_new[which((tp2015_new$"Institution size Category" >= 0) & (tp2015_new$"Institution size Category" <= 2) & (tp2015_new$"Sector of institution" <= 3) & (tp2015_new$"Sector of institution" >= 1))]$'Total profit per student', breaks=20)
hist(tp2015_new[which((tp2015_new$"Institution size Category" >= 3) & (tp2015_new$"Sector of institution" <= 3) & (tp2015_new$"Sector of institution" >= 1))]$'Total profit per student', breaks=20)

t.test(tp2015_new[which((tp2015_new$"Institution size Category" >= 0) & (tp2015_new$"Institution size Category" <= 2) & (tp2015_new$"Sector of institution" <= 3) & (tp2015_new$"Sector of institution" >= 1))]$'Total profit per student', tp2015_new[which((tp2015_new$"Institution size Category" >= 3) & (tp2015_new$"Sector of institution" <= 3) & (tp2015_new$"Sector of institution" >= 1))]$'Total profit per student', var.equal = FALSE, alternative = c("less"))

t.test(tp2015_new[which((tp2015_new$"Institution size Category" >= 0) & tp2015_new$"Institution size Category" <= 2)]$'Total profit per student', tp2015_new[which(tp2015_new$"Institution size Category" >= 3)]$'Total profit per student', var.equal = FALSE, alternative = c("less"))

# 2016 Total profit per entering class

tp2016_all2 <- college2016 %>% drop_na("Total all revenues and other additions", "Total expenses and other deductions", 'Total entering students at the undergraduate level, fall of current year') %>% select("Total all revenues and other additions", 'Total expenses and other deductions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
tp2016_all2$'Total profit per student' <- (tp2016_all2$'Total all revenues and other additions' - tp2016_all2$'Total expenses and other deductions')/tp2016_all2$'Total entering students at the undergraduate level, fall of current year'

tp2016_new <- subset(tp2016_all2, tp2016_all2$'Total profit per student' != 0)

hist(tp2016_new$'Total profit per student', breaks=20)

tp2016_new$"Sector of institution" <- as.numeric(tp2016_new$"Sector of institution")

# Only consider public and private 4-year universities
hist(tp2016_new[which((tp2016_new$"Institution size Category" >= 0) & (tp2016_new$"Institution size Category" <= 2) & (tp2016_new$"Sector of institution" <= 3) & (tp2016_new$"Sector of institution" >= 1))]$'Total profit per student', breaks=20)
hist(tp2016_new[which((tp2016_new$"Institution size Category" >= 3) & (tp2016_new$"Sector of institution" <= 3) & (tp2016_new$"Sector of institution" >= 1))]$'Total profit per student', breaks=20)

t.test(tp2016_new[which((tp2016_new$"Institution size Category" >= 0) & (tp2016_new$"Institution size Category" <= 2) & (tp2016_new$"Sector of institution" <= 3) & (tp2016_new$"Sector of institution" >= 1))]$'Total profit per student', tp2016_new[which((tp2016_new$"Institution size Category" >= 3) & (tp2016_new$"Sector of institution" <= 3) & (tp2016_new$"Sector of institution" >= 1))]$'Total profit per student', var.equal = FALSE, alternative = c("less"))

t.test(tp2016_new[which((tp2016_new$"Institution size Category" >= 0) & tp2016_new$"Institution size Category" <= 2)]$'Total profit per student', tp2016_new[which(tp2016_new$"Institution size Category" >= 3)]$'Total profit per student', var.equal = FALSE, alternative = c("less"))

# 2017 Total profit per entering class

tp2017_all2 <- college2017 %>% drop_na("Total all revenues and other additions", "Total expenses and other deductions", 'Total entering students at the undergraduate level, fall of current year') %>% select("Total all revenues and other additions", 'Total expenses and other deductions', 'Total entering students at the undergraduate level, fall of current year', 'Institution size Category', 'Sector of institution')
tp2017_all2$'Total profit per student' <- (tp2017_all2$'Total all revenues and other additions' - tp2017_all2$'Total expenses and other deductions')/tp2017_all2$'Total entering students at the undergraduate level, fall of current year'

tp2017_new <- subset(tp2017_all2, tp2017_all2$'Total profit per student' != 0)

hist(tp2017_new$'Total profit per student', breaks=20)

tp2017_new$"Sector of institution" <- as.numeric(tp2017_new$"Sector of institution")


# Only consider public and private 4-year universities

hist(tp2017_new[which((tp2017_new$"Institution size Category" >= 0) & (tp2017_new$"Institution size Category" <= 2) & (tp2017_new$"Sector of institution" <= 3) & (tp2017_new$"Sector of institution" >= 1))]$'Total profit per student', breaks=20)
hist(tp2017_new[which((tp2017_new$"Institution size Category" >= 3) & (tp2017_new$"Sector of institution" <= 3) & (tp2017_new$"Sector of institution" >= 1))]$'Total profit per student', breaks=20)

t.test(tp2017_new[which((tp2017_new$"Institution size Category" >= 0) & (tp2017_new$"Institution size Category" <= 2) & (tp2017_new$"Sector of institution" <= 3) & (tp2017_new$"Sector of institution" >= 1))]$'Total profit per student', tp2017_new[which((tp2017_new$"Institution size Category" >= 3) & (tp2017_new$"Sector of institution" <= 3) & (tp2017_new$"Sector of institution" >= 1))]$'Total profit per student', var.equal = FALSE, alternative = c("less"))

t.test(tp2017_new[which((tp2017_new$"Institution size Category" >= 0) & tp2017_new$"Institution size Category" <= 2)]$'Total profit per student', tp2017_new[which(tp2017_new$"Institution size Category" >= 3)]$'Total profit per student', var.equal = FALSE, alternative = c("less"))

# Multiple linear regression
co2016 <- college2016 %>% drop_na('Degree of urbanization','Total entering students at the undergraduate level, fall of current year', "Full-time retention rate", 'Average amount of grant and scholarship aid awarded, income level (0-30,000','Average amount of federal, state, local or institutional grant aid awarded','Total all revenues and other additions', 'Total expenses and other deductions', 'Total current assets', 'Long term debt', "4-year Graduation rate - bachelor's degree within 100% of normal time", "6-year Graduation rate - bachelor's degree within 150% of normal time", 'Total entering students at the undergraduate level, fall of current year', "Institution size Category", "Sector of institution") %>% select("Full-time retention rate", 'Average amount of grant and scholarship aid awarded, income level (0-30,000','Total all revenues and other additions', 'Total expenses and other deductions', 'Total current assets', 'Long term debt', "4-year Graduation rate - bachelor's degree within 100% of normal time", "6-year Graduation rate - bachelor's degree within 150% of normal time", "Institution size Category", "Sector of institution",'Total entering students at the undergraduate level, fall of current year', 'Degree of urbanization')

y = co2016$'Full-time retention rate'
x1 = co2016$'Average amount of grant and scholarship aid awarded, income level (0-30,000'
x2 = as.numeric(co2016$'Total expenses and other deductions')/as.numeric(co2016$'Total entering students at the undergraduate level, fall of current year')
x3 = as.numeric(co2016$'Total all revenues and other additions')/as.numeric(co2016$'Total entering students at the undergraduate level, fall of current year')
x4 = as.numeric(co2016$'Long term debt')/as.numeric(co2016$'Total entering students at the undergraduate level, fall of current year')
x5 = co2016$"4-year Graduation rate - bachelor's degree within 100% of normal time"
x6 = co2016$"6-year Graduation rate - bachelor's degree within 150% of normal time"

lm(y ~ x1+x2+x3+x4+x5+x6)
lm(y ~ log(x1)+log(x2)+log(x3))
summary(lm(y ~ x1+x2+x3+x4))
summary(lm(y ~ log(x1)+log(x2)+log(x3)+x4+x5+x6))

summary(lm(y ~ x1+x2+x3+x4+x5+x6))
summary(lm(y ~ x1+x2+x3+x4+x5))
summary(lm(y ~ x1+x2+x3+x4+x6))
summary(lm(y ~ x1+x2+x3+x5+x6))
summary(lm(y ~ x1+x2+x4+x5+x6))
summary(lm(y ~ x1+x3+x4+x5+x6))
summary(lm(y ~ x2+x3+x4+x5+x6))
summary(lm(y ~ x5+x6))
lm(y ~ x5+x6)

summary(lm(y ~ x1))
summary(lm(y ~ x2))
summary(lm(y ~ x3))
summary(lm(y ~ x4))
summary(lm(y ~ x5))

ggplot(co2016, aes(as.numeric(co2016$'Total expenses and other deductions'), as.numeric(co2016$'Full-time retention rate'), color=co2016$'Institution size Category')) + geom_point() + geom_smooth()
ggplot(co2016, aes(x2, as.numeric(co2016$'Full-time retention rate'), color=co2016$'Institution size Category')) + geom_point() + geom_smooth(method=lm) + stat_smooth()

ggplot(co2016, aes(x1+x2+x3+x4+x5+x6, as.numeric(co2016$'Full-time retention rate'), color=co2016$'Institution size Category')) + geom_point() + geom_smooth(method='loess')

ggplot(co2016, aes(x1+x2+x3+x4+x5+x6, as.numeric(co2016$'Full-time retention rate'), color=as.factor(co2016$'Institution size Category'))) + geom_point() + geom_smooth(se = FALSE)

dou2016 <- college2016 %>% drop_na('Degree of urbanization', 'Books and supplies (current year)', 'Full-time retention rate', 'Institution size Category')
dou2016$Size <- ifelse(((as.numeric(dou2016$"Institution size Category") >= 0) & ((as.numeric(dou2016$"Institution size Category") <= 3))), 'Small', 'Big')

y = as.numeric(dou2016$'Full-time retention rate')
x11 = as.factor(dou2016$'Degree of urbanization')
x21 = as.numeric(dou2016$'Books and supplies (current year)')

dou2016$'Institution size Category' <- as.factor(dou2016$'Institution size Category')
lm(y ~ x11)
summary(lm(y ~ x11))
ggplot(dou2016, aes(x11, y, color=dou2016$Size)) + geom_boxplot()

hist(as.numeric(x21))
ggplot(data=dou2016, aes(x=x21, color=dou2016$Size)) + geom_density(alpha=0.4)
lm(y~as.numeric(x21))
summary(lm(y ~ as.numeric(x21)))

