install.packages("tidyverse")
library(tidyverse)
microbiome.fungi <- read.csv("Microbiome.csv")

###Select

microbiome.fungi2 <- select(microbiome.fungi, OTU,
                            SampleID,
                            Abundance,
                            Crop,
                            Compartment,
                            DateSampled,
                            GrowthStage,
                            Treatment,
                            Rep,
                            Fungicide,
                            Kingdom:Taxonomy)

filter(microbiome.fungi2, Class == "Sordariomycetes")

mutate(microbiome.fungi2, Percent = Abundance*100)

###Piping
microbiome.fungi %>%
  select( OTU,
          SampleID,
          Abundance,
          Crop,
          Compartment,
          DateSampled,
          GrowthStage,
          Treatment,
          Rep,
          Fungicide,
          Kingdom:Taxonomy) %>%
  filter(Class == "Sordariomycetes") %>%
  mutate(Percent = Abundance*100)

### Summarize
microbiome.fungi %>%
  select( OTU,
          SampleID,
          Abundance,
          Crop,
          Compartment,
          DateSampled,
          GrowthStage,
          Treatment,
          Rep,
          Fungicide,
          Kingdom:Taxonomy) %>%
  filter(Class == "Sordariomycetes") %>%
  mutate(Percent = Abundance*100) %>%
  summarise(Mean = mean(Percent),
            n = n(),
            sd.dev = sd(Percent)) %>%
  mutate(std.err = sd.dev/sqrt(n))

microbiome.fungi %>%
  select( OTU,
          SampleID,
          Abundance,
          Crop,
          Compartment,
          DateSampled,
          GrowthStage,
          Treatment,
          Rep,
          Fungicide,
          Kingdom:Taxonomy) %>%
  filter(Class == "Sordariomycetes") %>%
  mutate(Percent = Abundance*100) %>%
  group_by(Order) %>%
  summarise(Mean = mean(Percent),
            n = n(),
            sd.dev = sd(Percent)) %>%
  mutate(std.err = sd.dev/sqrt(n)) %>%
  replace_na(list(Order = "unidentified"))
#### ^renamed "NA" as "unidentified" 
  arrange(-Mean) %>%
  ggplot(aes(x = Mean, y = Order)) +
  geom_bar(stat = "identity") +
  coord_flip()
  
  ### Factor - Reorder - replace "arrange(-Mean)%>% with 
  #"mutate(Order2 = fct_reorder(Order, desc(Mean))) %>%
  # DESCENDING ORDER = desc(-Mean)
  

###Joining 
taxonomy <- microbiome.fungi2 %>% 
  dplyr::select(OTU, Kingdom:Taxonomy) %>%
  sample_n(size = 100)

metadata <- microbiome.fungi2 %>% 
  select(OTU:Fungicide) %>% 
  sample_n(size = 100) 

left_join(taxonomy, metadata, by = "OTU")
#by = (OTU) is the column header that the datasets have in common 
# set to column header equal to each other 
#by = c("OTU" = "OUT_ID")

#order matters (which dataset goes first?)
inner_join(taxonomy, metadata, by = "OTU")
full_join(taxonomy, metadata, by = "OTU")

#####Pivoting 
pivot_longer()
pivot_wider()

### Summarize
microbiome.fungi3 <- microbiome.fungi %>%
  select( OTU,
          SampleID,
          Abundance,
          Crop,
          Compartment,
          DateSampled,
          GrowthStage,
          Treatment,
          Rep,
          Fungicide,
          Kingdom:Taxonomy) %>%
  
microbiome.fungi3 %>%
  filter(Class == "Sordariomycetes") %>%
  mutate(Percent = Abundance*100) %>%
  group_by(Order, Crop, Compartment, Fungicide) %>%
  sumarise(Mean = mean (Percent)) %>% 
  pivot_wider(names_from = Fungicide, values_from = Mean) %>% 
  mutate(diff = C - F) %>% 
  ggplot(aes(x = Order, y = diff)) + 
  geom_point() + 
  facet_wrap(~Crop*Compartment) + 
  coord_flip()

