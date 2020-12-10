library(dplyr)

data <- read.csv('https://raw.githubusercontent.com/narxiss24/datasets/master/diabetes.csv')

df  <- data[, c('BloodPressure','SkinThickness')] 

gp  <- aggregate(data$Age, list(data$Outcome), FUN=length) 

sm <- data %>% summarise(bp=mean(BloodPressure), glu=length(Glucose))

print(head(sm))
