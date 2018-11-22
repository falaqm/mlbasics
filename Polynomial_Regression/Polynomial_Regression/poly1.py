# Data Preprocessing Template

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

# Splitting the dataset into the Training set and Test set
'''from sklearn.cross_validation import train_test_split
#X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)'''

# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""


# linear regression
from sklearn.linear_model import LinearRegression
linreg=LinearRegression()
linreg.fit(X,y)

# polynomial regression

from sklearn.preprocessing import PolynomialFeatures
polyreg=PolynomialFeatures(degree=4)
X_poly=polyreg.fit_transform(X)

linreg2=LinearRegression()
linreg2.fit(X_poly,y)


# Visualizing linear Regression

plt.scatter(X,y,color='red')
plt.plot(X,linreg.predict(X),color='blue')
plt.title('Truth vs Bluff(linear)')
plt.xlabel('position')
plt.ylabel('Salary')
# Visualizing Polynomial Regression
plt.scatter(X,y,color='red')
plt.plot(X,linreg2.predict(polyreg.fit_transform(X)),color='blue')
plt.title('Truth vs Bluff(linear)')
plt.xlabel('position')
plt.ylabel('Salary')

# more precision
X_grid=np.arange(min(X),max(X),0.1).reshape(-1,1)

plt.scatter(X,y,color='red')
plt.plot(X_grid,linreg2.predict(polyreg.fit_transform(X_grid)),color='blue')
plt.title('Truth vs Bluff(poly)')
plt.xlabel('position')
plt.ylabel('Salary')

# predict using LR
linreg.predict(6.5)
# predict using PR
linreg2.predict(polyreg.fit_transform(6.5))






































