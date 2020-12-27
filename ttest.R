demo <- read.csv("https://raw.githubusercontent.com/narxiss24/datasets/master/diabetes.csv")

colnames(demo)
# [1] "Pregnancies"              "Glucose"                 
# [3] "BloodPressure"            "SkinThickness"           
# [5] "Insulin"                  "BMI"                     
# [7] "DiabetesPedigreeFunction" "Age"                     
# [9] "Outcome"                 

demo$Glucose

demo <- demo[demo$Glucose > 0, ]

summary(demo$Glucose)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#    44.0    99.0   117.0   121.7   141.0   199.0 

demo$Outcome <- as.factor(demo$Outcome)

table(demo$Outcome)
# 
#   0   1 
# 497 266 

library("ggplot2")

qplot(demo$Glucose, demo$Outcome)

# we expect the mean glucose of the first group (outcome=0) to be lower than
# the mean glucose of the second group (outcome=1)
dm_ttest <- t.test(Glucose ~ Outcome, data = demo, alternative = "less")
# 
# 	Welch Two Sample t-test
# 
# data:  Glucose by Outcome
# t = -14.884, df = 466.02, p-value < 2.2e-16
# alternative hypothesis: true difference in means is less than 0
# 95 percent confidence interval:
#       -Inf -28.16828
# sample estimates:
# mean in group 0 mean in group 1 
#        110.6439        142.3195 
# 

dm_wilcox <- wilcox.test(Glucose ~ Outcome, data = demo, alternative = "less")
# 
# 	Wilcoxon rank sum test with continuity correction
# 
# data:  Glucose by Outcome
# W = 27394, p-value < 2.2e-16
# alternative hypothesis: true location shift is less than 0
# 
