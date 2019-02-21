library(tidyverse)
library(readxl)
library(ggplot2)
library(janitor)

concentrations <- read_xlsx("concentrations_h.xlsx") %>% 
  gather(Year, Count, 2:11) %>% 
  clean_names()

hard_sciences <- concentrations %>% 
  filter(concentration %in% c("Molecular and Cellular Biology", "Chemistry", "Physics")) 
hard_sciences_plot<- 
  ggplot(hard_sciences, aes(x = year, y = count, fill = concentration, label = count)) + 
  geom_bar(stat = "identity") +
  xlab("Year") +
  ylab("Number of Concentrators") +
  geom_text(size = 3, position = position_stack(vjust = 0.5)); 
  plot(hard_sciences_plot)

applied_stem <- concentrations %>% 
  filter(concentration %in% c("Statistics", "Computer Science", "Applied Mathematics*"))
applied_stem_plot<- 
  ggplot(applied_stem, aes(x = year, y = count, fill = concentration, label = count)) + 
  geom_bar(stat = "identity")+
  xlab("Year") +
  ylab("Number of Concentrators") +
  geom_text(size = 3, position = position_stack(vjust = 0.5));
  plot(applied_stem_plot)


humanities <- concentrations %>% 
  filter(concentration %in% c("English", "Comparative Literature"))
humanities_plot<- 
  ggplot(humanities, aes(x = year, y = count, fill = concentration, label = count)) + 
  geom_bar(stat = "identity") +
  xlab("Year") +
  ylab("Number of Concentrators") +
  geom_text(size = 3, position = position_stack(vjust = 0.5));
  plot(humanities_plot)

social_sciences <- concentrations %>% 
  filter(concentration %in% c("Economics*","Government", "Psychology"))
social_sciences_plot <- 
  ggplot(social_sciences, aes(x = year, y = count, fill = concentration, label = count)) + 
  geom_bar(stat = "identity") + 
  xlab("Year") +
  ylab("Number of Concentrators") +
  geom_text(size = 3, position = position_stack(vjust = 0.5));
  plot(social_sciences_plot)
