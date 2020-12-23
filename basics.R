library(ggplot2)

library('tibble')

library('dplyr')

demo  <- read.csv('https://raw.githubusercontent.com/narxiss24/datasets/master/demographics.csv')

demo  <- as_tibble(demo)

mytable  <- table(demo$educ)

#people who did not complete high school and have a luxury car

hslx  <- demo[demo$educ == 'Did not complete high school' & demo$carcat == 'Luxury',] 

#people who did not complete high school OR have a luxury car
hslx.sub  <- subset(demo, demo$educ == 'Did not complete high school',)

hslx.plyr  <- demo %>% filter(educ == 'Did not complete high school',)                                

gp  <- demo %>%
	group_by(educ) %>%
	summarize(
		  carpr.avg=mean(carpr), 
		  income.avg=mean(income),
	)


print(t.test(demo$income, alternative='two.sided', mu=60))

ggplot()+geom_histogram(data=demo, aes(x=income))

ggsave('income.pdf')
