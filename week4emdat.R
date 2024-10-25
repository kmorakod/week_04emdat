# Install packages
if (!require("pacman")) {
  install.packages("pacman")
}

pacman::p_load(
  tidyverse, # tidyverse pkgs including purrr
  glue, #combining strings and objects
  gapminder, # dataset
  ggplot2, #plotting
  gridExtra #arranging plots
) 
setwd("~/Desktop/") 
getwd()

data <- read.csv("EMDAT.csv", header = TRUE)

options(scipen=999) #so that numbers are not in scientific notation

library(dplyr)

newdataset <- data %>% select(Entity, Year, deaths_all_disasters, injured_all_disasters, homeless_all_disasters,) %>% 
  rename(deaths = deaths_all_disasters, injuries = injured_all_disasters, homelessness = homeless_all_disasters, country = Entity)

#summarising data and deselecting year and country where there is no numerical data
newdataset %>%
  select(-country, -Year) %>%
  map_dbl(mean, na.rm = TRUE)

#Using purrr please automate plotting the trends of deaths, injuries, and homelessness caused by all disasters for 5 countries in the dataset

filtered_newdataset <- newdataset %>% filter(country %in% c("Japan", "Tonga", "India", "New Zealand", "Australia"))
  
  

