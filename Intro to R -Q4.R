#make a vector 
z<-c(1:200)
z
mean(z)
sd(z)
z>1
#dataframe
df<-data.frame(z,z>1)
df
colnames(df)<-c("z","zlog")
df
z^2
df2<-data.frame(z,z>1,z^2)
df2
colnames(df2)<-c("z","zlog","zsquared")
df2
subset(df2,zsquared>10 & zsquared<100)
