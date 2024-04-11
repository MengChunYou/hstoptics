# sample code for stkde

## Not run: 
#Example1-uneven number of years
#Dataset1
# We will generate a 3 different stages' case points.
# The higher density are in the off-diagonal direction.
x1<-c(runif(100,0,1),runif(50,0.67,1))
y1<-c(runif(100,0,1),runif(50,0.67,1))
d1<-data.frame(x1,y1)
colnames(d1)<-c("x","y")
x2<-c(runif(100,0,1),runif(50,0.33,0.67))
y2<-c(runif(100,0,1),runif(50,0.33,0.67))
d2<-data.frame(x2,y2)
colnames(d2)<-c("x","y")
x3<-c(runif(100,0,1),runif(50,0,0.33))
y3<-c(runif(100,0,1),runif(50,0,0.33))
d3<-data.frame(x3,y3)
colnames(d3)<-c("x","y")
d<-rbind(d1,d2,d3)
d$tf<-c(rep(1,150),rep(2,150),rep(3,150))
#d is the simulated data
#d[1,]
#plot(d1);points(d2,col="red");points(d3,col="green")
#Key Code
#attach(d)
samkde<-stkde(xlong=d$x,ylat=d$y,ztime=d$tf,xgrids=20,ygrids=20,
              breaks=0.05,alpha=0.05,nrowspar=1,bwmethod="cv.ml")
samkde$bw
samkde$dens
#Example2-even number of years
#Dataset2
x12<-c(runif(100,0,1),runif(50,0.67,1))
y12<-c(runif(100,0,1),runif(50,0.67,1))
d12<-data.frame(x12,y12)
colnames(d12)<-c("x","y")
x22<-c(runif(100,0,1),runif(50,0.33,0.67))
y22<-c(runif(100,0,1),runif(50,0.33,0.67))
d22<-data.frame(x22,y22)
colnames(d22)<-c("x","y")
d2<-rbind(d12,d22)
d2$tf<-c(rep(1,150),rep(2,150))
colnames(d2)<-c("xlong","ylat","ztime")
#Running the function
samkde2<-stkde(d[,1],d[,2],d[,3],xgrids=20,ygrids=20,breaks=0.05,
               alpha=0.05,nrowspar=1,bwmethod="cv.ml")
samkde2$bw
samkde2$dens         

## End(Not run) 