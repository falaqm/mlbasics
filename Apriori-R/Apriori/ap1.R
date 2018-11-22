#reading the dataset
dataset=read.csv('Market_Basket_Optimisation.csv',header = FALSE)

#install.packages('arules')
library(arules)
dataset=read.transactions('Market_Basket_Optimisation.csv',sep = ',',rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset,topN = 10) #plotting

#TRaining apriori on dataset
rules = apriori(data=dataset,parameter = list(support=0.004,confidence=0.2))
#support =3*7/7500,confidence=default=0.8/2

# Visualising
inspect(sort(rules,by='lift')[1:10]) #first 10 rules
