##Statistics Homework 
#Question #2: 
datum1 <- read.csv("/Users/kaylanoelsullins/Desktop/PLPA6820  Microbiome Data/PLPA6820 Repository/Microbiome/BacteriaMetaData.csv", na.strings = "na")
head(datum1)
datum1$seedtreatment_abv=as.factor(datum1$seedtreatment_abv)
plot(kg_ha~seedtreatment_abv,data=datum1)
results1 <- aov(kg_ha~seedtreatment_abv,data=datum1)
summary(results1)
TukeyHSD(results1)
