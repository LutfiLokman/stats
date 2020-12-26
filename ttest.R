demo  <- read.csv('https://raw.githubusercontent.com/narxiss24/datasets/master/diabetes.csv')

colnames(demo)
# [1] "Pregnancies"              "Glucose"                 
# [3] "BloodPressure"            "SkinThickness"           
# [5] "Insulin"                  "BMI"                     
# [7] "DiabetesPedigreeFunction" "Age"                     
# [9] "Outcome"                 


summary(demo$Glucose)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#     0.0    99.0   117.0   120.9   140.2   199.0 

demo$Outcome  <- as.factor(demo$Outcome)

table(demo$Outcome)
#   0   1 
# 500 268 

library('ggplot2')

qplot(demo$Glucose, demo$Outcome)

# we expect the mean glucose of the first group (outcome=0) to be lower than the mean glucose of the second group (outcome=1)
dm.ttest  <- t.test(Glucose ~ Outcome, data=demo ,alternative='less')

# t = -13.752, df = 461.33, p-value < 2.2e-16
# mean in group 0 mean in group 1 
#        109.9800        141.2575 

dm.wilcox  <- wilcox.test(Glucose ~ Outcome, data=demo ,alternative='less')

# W = 28390, p-value < 2.2e-16
# alternative hypothesis: true location shift is less than 0
