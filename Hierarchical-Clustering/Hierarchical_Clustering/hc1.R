#import data
dataset=read.csv('Mall_Customers.csv')
X <-dataset[4:5]
# Using dendogram find optimal number of customers
dendrogram=hclust(dist(X,method = 'euclidean'),method = 'ward.D')
plot(dendrogram,main='Dendrogram',xlab='Customers',ylab = 'Euclidean Distances')

# hierachical clustering
hc=hclust(dist(X,method = 'euclidean'),method = 'ward.D')
y_hc=cutree(hc,5)


#Visualising
library('cluster')
clusplot(X,
         clus = y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 4,
         plotchar = FALSE,
         span = TRUE,
         main = 'Clustering',
         xlab = 'Customers',
         ylab = 'Spending Score ')
