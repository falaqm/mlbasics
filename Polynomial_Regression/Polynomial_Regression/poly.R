# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset=dataset[2:3]


# # Splitting the dataset into the Training set and Test set
# # install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


# Linear Regression
lin_reg=lm(formula ='Salary ~.',data=dataset)
summary(lin_reg)

# Polynomial Regression
dataset$Level2=dataset$Level^2
dataset$Level3=dataset$Level^3
dataset$Level4=dataset$Level^4
poly_reg=lm(formula = 'Salary ~.',data=dataset)
summary(poly_reg)

#
library(ggplot2)
# Linear Regression

ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),color='red')+
  geom_line(aes(x=dataset$Level,y=predict(lin_reg,newdata = dataset)),color='blue')+
  ggtitle('Truth vs Bluff')+
  xlab('Level')+
  ylab('Salary')

# Polynomial Regression

ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),color='red')+
  geom_line(aes(x=dataset$Level,y=predict(poly_reg,newdata = dataset)),color='blue')+
  ggtitle('Truth vs Bluff')+
  xlab('Level')+
  ylab('Salary')

## increasing 
X_grid=seq(min(dataset$Level),max(dataset$Level),0.1)

ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),color='red')+
  geom_line(aes(x=X_grid,y=predict(poly_reg,
                                   newdata = data.frame(Level=X_grid,
                                                        Level2 = X_grid^2,
                                                        Level3 = X_grid^3,
                                                        Level4 = X_grid^4))),color='blue')+
  ggtitle('Truth vs Bluff')+
  xlab('Level')+
  ylab('Salary')

# predict using LR

y_pred=predict(lin_reg,newdata = data.frame(Level=6.5))

#predict using PR

y_pred=predict(poly_reg,newdata = data.frame(Level=6.5,
                                             Level2=6.5^2,
                                             Level3=6.5^3,
                                             Level=6.5^4))



