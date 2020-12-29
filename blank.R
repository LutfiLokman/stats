carr  <- read.csv("https://raw.githubusercontent.com/narxiss24/datasets/master/circarr.csv")

colnames(carr)
# [1] "vsd"      "dhca"     "minutes"  "birthwt"  "age"     
# [6] "clinseiz" "eegseiz"  "pdi"     

cols  <- c("dhca", "clinseiz")

carr[cols]  <- lapply(carr[cols], factor, levels = c(1,0))

table(carr$dhca, carr$clinseiz)
#      1  0
#   1 10 77
#   0  1 82

fisher.test(carr$dhca, carr$clinseiz)
 
# 	Fisher's Exact Test for Count Data
# 
# data:  carr$dhca and carr$clinseiz
# p-value = 0.009527
# alternative hypothesis: true odds ratio is not equal to 1
# 95 percent confidence interval:
#    1.439284 466.640848
# sample estimates:
# odds ratio 
#   10.53888 
# 
 
# Manual check

# Odds of having seizure in those with dhca
dhca_sz  <- 10/77 
# [1] 0.1298701

# Odds of having seizure in those without dhca
ndhca_sz  <- 1/82
# [1] 0.01219512

or  <- dhca_sz/ndhca_sz
# [1] 10.64935
