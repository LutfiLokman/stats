circarr  <- read.csv("https://raw.githubusercontent.com/narxiss24/datasets/master/circarr.csv")

names(circarr)
# [1] 'vsd' 'dhca' 'minutes' 'birthwt' 'age' 'clinseiz' 'eegseiz' 'pdi'

circarr[c("dhca", "clinseiz")]  <- lapply(circarr[c("dhca", "clinseiz")], factor, levels = c(1,0))

fisher.test(circarr$dhca, circarr$clinseiz)
 
# 	Fisher's Exact Test for Count Data
# 
# data:  circarr$dhca and circarr$clinseiz
# p-value = 0.009527
# alternative hypothesis: true odds ratio is not equal to 1
# 95 percent confidence interval:
#    1.439284 466.640848
# sample estimates:
# odds ratio 
#   10.53888 
 
#manual check
odds_ndhca_nsz  <- 82/1
# [1] 82

odds_dhca_nsz  <- 77/10
# [1] 7.7

# Odds of hvg no seizure among non-dhca kids is 10x the odds of
# hvg no seizure among dhca kids
or  <- odds_ndhca_nsz/odds_dhca_nsz

# [1] 10.64935

# Odds of hvg no seizure among dhca kids is 1% ((1-0.09)*100)
# less than non-dhca kids
1/or

# [1] 0.09390244

