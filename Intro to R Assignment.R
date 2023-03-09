#Intro to R Assignment - Questions 4-6

######Question #4: 
#Vector 
z<-c(1:200)
z
mean(z)
#100.5
sd(z)
#57.88
z>1

#DataFrame 
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



######Question #5: 
#Package Installations
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
install.packages("purr")
library(purrr)
install.packages("lme4")
library(lme4)
install.packages("emmeans")
library(emmeans)
#all downloads were confirmed and transferred into R package library. 
#2 packages were updated. 
#all packages are confirmed using library function and have checks next to them. 

######Question #6: 
getwd()
csv<-read.csv("TipsR.csv",na.strings=".")
csv
#when I pulled up the csv file, there are <NA> in spaces of missing data.