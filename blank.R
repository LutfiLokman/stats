circarr  <- read.csv("https://raw.githubusercontent.com/narxiss24/datasets/master/circarr.csv")

names(circarr)
# [1] "vsd"      "dhca"     "minutes"  "birthwt"  "age"      "clinseiz" "eegseiz"  "pdi"     

table(circarr$vsd)
#   0   1 
# 129  42 

table(circarr$clinseiz)
#   0   1 
# 159  11 

fisher.test(circarr$vsd, circarr$clinseiz)
 
# 	Fisher's Exact Test for Count Data
# 
# data:  circarr$vsd and circarr$clinseiz
# p-value = 0.02466
# alternative hypothesis: true odds ratio is not equal to 1
# 95 percent confidence interval:
#   1.003864 18.529698
# sample estimates:
# odds ratio 
#   4.205616 
 
