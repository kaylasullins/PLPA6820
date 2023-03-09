#PLPA 6820 - Assignment #2 
#Data Visualization
#Kayla Sullins 

download.packages("ggplot2")
library(ggplot2)
mycotoxin<-read.csv("MycotoxinData.csv", na.strings="na")
head(mycotoxin)

#####Question #2: 
ggplot(mycotoxin, aes(x = Treatment, y = DON, color = Cultivar)) + 
  geom_boxplot() + 
  xlab("") + ylab("DON (ppm)") +
  theme_classic()

####Question #3: 
ggplot(mycotoxin, aes(x = Treatment, y = DON, color = Cultivar)) + 
  stat_summary (fun = mean, geom = "bar", position = "dodge") + 
  stat_summary (fun.data = mean_se, geom = "errorbar", position = "dodge") +
  xlab("") + ylab("DON (ppm)") +
  theme_classic()

####Question #4: 
ggplot(mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width=0.9), shape=21, color = "black") +
  xlab("") + ylab("DON (ppm)") +
  theme_classic()

ggplot(mycotoxin, aes(x= Treatment, y= DON, fill= Cultivar)) +
  stat_summary(Fun = mean, geom = "bar", position = "dodge", color = "black") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  geom_point(position = position_jitterdodge(dodge.width = 1), shape = 21, color = "black") +
  xlab("") + ylab("DON (ppm)") +
  theme_classic()

####Question #5: 
ggplot(mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width=0.9), shape=21, color = "black") +
  scale_color_manual(values=c("#56B4E9", "#CC79A7")) + 
  scale_fill_manual(values=c("#56B4E9", "#CC79A7")) + 
  xlab("") + ylab("DON (ppm)") +
  theme_classic()

ggplot(mycotoxin, aes(x= Treatment, y= DON, fill= Cultivar)) + 
  stat_summary(Fun = mean, geom = "bar", position = "dodge", color = "black") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  geom_point(position = position_jitterdodge(dodge.width = 1), shape = 21, color = "black") +
  scale_color_manual(values=c("#56B4E9", "#CC79A7")) +
  scale_fill_manual(values=c("#56B4E9", "#CC79A7")) +
  xlab("") + ylab("DON (ppm)") +
  theme_classic()

####Question #6: 
ggplot(mycotoxin, aes(x = Treatment, y = DON, fill = Cultivar)) + 
  geom_boxplot() +
  geom_point(position=position_jitterdodge(dodge.width=0.9), shape=21, color = "black") +
  scale_color_manual(values=c("#56B4E9", "#CC79A7")) +
  scale_fill_manual(values=c("#56B4E9", "#CC79A7")) +
  xlab("") + ylab("DON (ppm)") +
  facet_wrap(~Treatment*Cultivar,scales = "free") +
  theme_classic()

ggplot(mycotoxin, aes(x= Treatment, y= DON, fill= Cultivar)) +
  stat_summary(Fun = mean, geom = "bar", position = "dodge", color = "black") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  geom_point(position = position_jitterdodge(dodge.width = 1), shape = 21, color = "black") +
  scale_color_manual(values=c("#56B4E9", "#CC79A7")) +
  scale_fill_manual(values=c("#56B4E9", "#CC79A7")) +
  xlab("") + ylab("DON (ppm)") +
  facet_wrap(~Treatment*Cultivar,scales = "free") +
  theme_classic() 

####Question #7: 
  




 
    

  
