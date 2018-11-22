dataset = read.csv('Mall_Customers.csv')
X <-dataset[4:5]

#elbow method to find optimal clusters
set.seed(6)
wcss <- vector()
for (i in 1:10) wcss[i] <-sum(kmeans(X,i)$withinss)
plot(1:10,wcss,type = 'b',
     main = paste('Cluster of clients'),
     xlab = 'Number of Clusters',
     ylab = 'WCSS')

# kmeans with 5
set.seed(29)
kmeans <-kmeans(X,5,iter.max = 300,nstart = 10)
y_kmeans=kmeans$cluster 

#visualising
library(cluster)
clusplot(X,
         clus = kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 4,
         plotchar = FALSE,
         span = TRUE,
         main = 'Cluster of clients',
         xlab = 'Annual Spend',
         ylab = 'Spending Score')
