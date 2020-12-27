library('ggplot2')
library('dplyr')

demo  <- read.csv('https://raw.githubusercontent.com/narxiss24/datasets/master/demographics.csv')

mytable  <- table(demo$educ)
 
#               College degree Did not complete high school 
#                          113                          125 
#           High school degree    Post-undergraduate degree 
#                          132                           27 
#                 Some college 
#                          113 

#people who did not complete high school and have a luxury car

hslx  <- demo[demo$educ == 'Did not complete high school' & demo$carcat == 'Luxury',] 

#people who did not complete high school OR have a luxury car
hslx.sub  <- subset(demo, demo$educ == 'Did not complete high school',)

#      age marital  income educ       carpr carcat gender retired
#    <int> <chr>     <int> <chr>      <dbl> <chr>  <chr>  <chr>  
#  1    55 Married      72 Did not c…  36.2 Luxury Female No     
#  2    56 Unmarri…    153 Did not c…  76.9 Luxury Male   No     
#  3    46 Unmarri…     24 Did not c…  12.2 Econo… Female No     

hslx.plyr  <- demo %>% filter(educ == 'Did not complete high school',)                                

gp  <- demo %>%	group_by(educ) %>%
	summarize(
		  carpr.avg=mean(carpr), 
		  income.avg=mean(income),
	)

ggplot()+geom_histogram(data=demo, aes(x=income))
