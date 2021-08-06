### H-Clustering
# Exploring Dataset
mydat <- input[,-1]
View(mydat)
nor <- scale(mydat)
d <- dist(nor,method = "euclidean")
fit <- hclust(d,method = "complete")
fit
plot(fit,hang=-1)
group <- cutree(fit,k=11)
group
rect <- rect.hclust(fit,k=11,border = "red")
rect
clustr <- as.matrix(group)
fil <- data.frame(input,clustr)
View(fil)
Fil <- arrange(fil,clustr)
View(Fil)
write.csv(Fil,file = "Hclustering_Passenger_cluster.csv")

## K-Means Clustering
install.packages("plyr")
library("plyr")
install.packages("kselection")
library("kselection")
install.packages("factoextra")
library("factoextra")
nor <- scale(mydat)
k <- kselection(nor)
k
fviz_nbclust(nor,kmeans,method = "wss")+labs(subtitle = "Elbow Curve method")
  cl <- kmeans(nor,11)
str(cl)
aggregate(mydat,by=list(cl$cluster),FUN=mean)
final <- data.frame(input,cl$cluster)
View(final)
Final3 <- arrange(final,cl$cluster)
View(Final3)
write.csv(Final3,file = "Updated_Passenger_Cluster.csv")
getwd()
