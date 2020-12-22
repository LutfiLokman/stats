library(ggplot2)

demo  <- read.csv('https://raw.githubusercontent.com/narxiss24/datasets/master/demographics.csv')

demo$income

ggplot()+geom_histogram(data=demo, aes(x=income))

ggsave('income.pdf')

# print(t.test(demo$income, alternative='two.sided', mu=60))
