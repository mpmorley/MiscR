library(rgl)
library(FactoMineR)

#create a random matrix, similar to an expression matrix 
mat <- replicate(4, rnorm(1000))
groupnames <- c('ctrl1','ctrl2','mut1','mut2')
colnames(mat) <- groupnames


#compute PCA, we need transpose the matrix forst.  
pca <- PCA(t(mat),graph = F)

# Use a color for how many samples you have, this will make the ctrl black and muts red
colors=c('black','black','red','red')

#Create a plot, we get the coordinates from the PCA object.  
plot3d(pca$ind$coord[,1:3], col=colors, type='s',alpha=1.75,axes=F,
       xlab='PC1',
       ylab='PC2',
       zlab='PC3'
)
axes3d(edges=c("x--", "y--", "z"), lwd=2, expand=10, labels=FALSE,box=T)
grid3d("x")
grid3d("y")
grid3d("z")

# Move the plot around to get the viewpoint you like and then save it as a snapshot. 
#PNG
rgl.snapshot("plot.png")

#Ppostscript 
rgl.postscript("plot.pdf",fmt="pdf")
