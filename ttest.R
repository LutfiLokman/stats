library("ggplot2")

dm <- read.csv("https://raw.githubusercontent.com/narxiss24/datasets/master/diabetes.csv")

colnames(dm)
# [1] "Pregnancies"              "Glucose"                 
# [3] "BloodPressure"            "SkinThickness"           
# [5] "Insulin"                  "BMI"                     
# [7] "DiabetesPedigreeFunction" "Age"                     
# [9] "Outcome"                 

summary(dm$Glucose)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#     0.0    99.0   117.0   120.9   140.2   199.0 

#apply scaling
dm <- dm[dm$Glucose > 0, ]

summary(dm$Glucose)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#    44.0    99.0   117.0   121.7   141.0   199.0 

dm$Outcome <- as.factor(dm$Outcome)

table(dm$Outcome)
# 0 1 497 266

# check for normality
m <- mean(dm$Glucose)
std <- sd(dm$Glucose)

ggplot() + 
	geom_histogram(data = dm, aes(x = Glucose, y = ..density..), fill = "blue") + 
	stat_function(fun = dnorm, args = list(mean = m, sd = std))

qplot(dm$Glucose, dm$Outcome)

# we expect the mean glucose is equal to the pregnant population mean glucose
# of 120
dm_one_ttest <- t.test(dm$Glucose, mu = 120, alternative = "two.sided")
 
# 	One Sample t-test
# 
# data:  dm$Glucose
# t = 1.5258, df = 762, p-value = 0.1275
# alternative hypothesis: true mean is not equal to 120
# 95 percent confidence interval:
#  119.5166 123.8569
# sample estimates:
# mean of x 
#  121.6868 
# 

#we expect the mean glucose of the first group (outcome=0) to be lower than
#the mean glucose of the second group (outcome=1)
dm_two_ttest <- t.test(Glucose ~ Outcome, data = dm, alternative = "less")
 
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

# If we are concerned about normality of the variable
dm_wilcox <- wilcox.test(Glucose ~ Outcome, data = dm, alternative = "less")
 
# 	Wilcoxon rank sum test with continuity correction
# 
# data:  Glucose by Outcome
# W = 27394, p-value < 2.2e-16
# alternative hypothesis: true location shift is less than 0
 
