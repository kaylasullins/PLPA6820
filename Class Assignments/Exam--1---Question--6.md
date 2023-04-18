---
title: 'Exam #1' 
author: "Kayla Sullins"
date: "2023-03-09"
output: 
  word_document: 
    keep_md: yes
---


```r
knitr::opts_chunk$set(include = TRUE)
library(knitr)
library(ggplot2)
library(markdown)
```



```layering
######Question #4: #
#Layering: 
ggplot(mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width=0.9), shape=21, color = "black") 

```

```scales
####Question #4: 
#Scales: 
ggplot(mycotoxin, aes(x= Treatment, y= DON, fill= Cultivar)) + 
  stat_summary(Fun = mean, geom = "bar", position = "dodge", color = "black") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  geom_point(position = position_jitterdodge(dodge.width = 1), shape = 21, color = "black") +
  scale_color_manual(values=c("#56B4E9", "#CC79A7")) +
  scale_fill_manual(values=c("#56B4E9", "#CC79A7"))

```

```themes
#Question #4: 
#Themes: 
ggplot(mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  geom_boxplot() +
  theme_dark()

```

```facets
#Question #4: 
#Facets: 
ggplot(mycotoxin, aes(x= Treatment, y= DON, fill= Cultivar)) +
  stat_summary(Fun = mean, geom = "bar", position = "dodge", color = "black") +
  facet_wrap(~Treatment*Cultivar,scales = "free")

```

```question
######Question #5:   
library(datasets); data("ToothGrowth"); str(ToothGrowth)
data1 <- subset(ToothGrowth, supp == "VC")
data2 <- subset(ToothGrowth, supp == "VC" & dose == "0.5")
data3 <- subset(ToothGrowth, select = c(len), supp == "VC" & dose == "0.5")

```

