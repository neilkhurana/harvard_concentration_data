library(tidyverse)
library(readr)
library(readxl)
library(ggplot2)
library(knitr)

concentrations <- read_xlsx("concentrations_h.xlsx") %>% 
  gather(Year, Count, 2:11) 

hard_sciences <- concentrations %>% 
  filter(Concentration %in% c("Molecular and Cellular Biology", "Chemistry", "Physics")) 
hard_sciences_plot<- 
  ggplot(hard_sciences, aes(x = Year, y = Count, fill = Concentration)) + 
  geom_bar(stat = "identity"); plot(hard_sciences_plot)

applied_stem <- concentrations %>% 
  filter(Concentration %in% c("Statistics", "Computer Science", "Applied Mathematics*"))
applied_stem_plot<- 
  ggplot(applied_stem, aes(x = Year, y = Count, fill = Concentration)) + 
  geom_bar(stat = "identity"); plot(applied_stem_plot)

