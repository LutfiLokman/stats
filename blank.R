demo  <- read.csv('https://raw.githubusercontent.com/narxiss24/datasets/master/demographics.csv')
odds.m.female  <- 129/125
odds.um.female  <- 83/135

m.or  <- odds.m.female/odds.um.female

mytable  <- table(demo$marital, demo$gender)

fet <- fisher.test(mytable)

csqt  <- chisq.test(mytable)
#library('ggplot2')

#myplot  <- qplot(demo$age, demo$retired)
