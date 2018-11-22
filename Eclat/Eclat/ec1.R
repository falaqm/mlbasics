#Eclat
#reading the dataset
dataset=read.csv('Market_Basket_Optimisation.csv',header = FALSE)

#install.packages('arules')
library(arules)
dataset=read.transactions('Market_Basket_Optimisation.csv',sep = ',',rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset,topN = 10) #plotting

#TRaining Eclat on dataset
rules = eclat(data=dataset,parameter = list(support=0.004,minlen=2))
#support =3*7/7500,confidence=default=0.8/2

# Visualising
inspect(sort(rules,by='support')[1:10]) #first 10 rules
