#PLPA 6820 - Exam #1 
#Kayla Sullins 

######Question #4: 
#Layering: 
ggplot(mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width=0.9), shape=21, color = "black") 
#Scales: 
ggplot(mycotoxin, aes(x= Treatment, y= DON, fill= Cultivar)) + 
  stat_summary(Fun = mean, geom = "bar", position = "dodge", color = "black") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  geom_point(position = position_jitterdodge(dodge.width = 1), shape = 21, color = "black") +
  scale_color_manual(values=c("#56B4E9", "#CC79A7")) +
  scale_fill_manual(values=c("#56B4E9", "#CC79A7"))
#Themes: 
ggplot(mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  geom_boxplot() +
  theme_dark()
#Facets: 
ggplot(mycotoxin, aes(x= Treatment, y= DON, fill= Cultivar)) +
  stat_summary(Fun = mean, geom = "bar", position = "dodge", color = "black") +
  facet_wrap(~Treatment*Cultivar,scales = "free")


######Question #5:   
library(datasets); data("ToothGrowth"); str(ToothGrowth)
data1 <- subset(ToothGrowth, supp == "VC")
data2 <- subset(ToothGrowth, supp == "VC" & dose == "0.5")
data3 <- subset(ToothGrowth, select = c(len), supp == "VC" & dose == "0.5")

