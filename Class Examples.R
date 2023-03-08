#This is a comment - annotate code with #### 
#command - enter = runs code 
x = 3 
y <-2 
x+y
#class = tells us what type of data is in the file 
class()
name <- "Kayla"
seven <- "7"
seven + x 
class (seven)
class(x)
#Different Data Types: 
#Vector - Most simple form of data in R 
#numerical 
>vec<-c(1,2,3,4,5,6,7)
vec<-c(1,2,3,4,5,6,7)
vec=c(1:7)
vec<-(1:1000)
#charaters 
vec2<-c("Kayla","Nicole","Jordan")
#logical 
vec3<-c(TRUE,FALSE)
#add a number 
vec+x
mean(vec)
sd(vec)
#standard Error
sd(vec)/sqrt(1000)
sum(vec)
median(vec)
min(vec)
max(vec)
summary(vec)
exp(vec)
#>#greater than 
# <
# | #or 
# & #and 
# >= #greater than or equals to 
# != #not equal to 

#Subset 
t<-(1:10)
t[(t>8)|(t<5)]  

1 %in% t
#is 1 in the vector "t"

#Matrix 
mat1<-matrix(data=c(1,2,3),nrow=3,ncol=3)
#highlight and run to get the values to pop up in console 
#dataframe can contain different data classes, matrix have to be the same type
#[] mean "such that"
mat1[1]
mat1[5]
mat1[2,2]
#middle number is both of those
mat1[,2]
#all rows in second column 
mat2<-matrix(data=c("Kayla","Jordan","Nicole"),nrow=3,ncol=3)
df <- data.frame(mat1[,1],mat2[,1])
#change data headers 
colnames(df) <- c("value","name")
df$value
df[,1]
#both of these are the same 

#Subsetting Dataframes 
df[df$name == "Kayla",]
#easier way 
subset(df, name=="Kayla")