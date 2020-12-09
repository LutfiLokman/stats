df <- read.csv('https://raw.githubusercontent.com/narxiss24/datasets/master/diabetes.csv')

y <- df[df$Pregnancies > 3,]

library('tidyverse')