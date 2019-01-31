#Show how to change csv to Rdata (write one line of code)
 #first load csv doc
#use laminaria data set to convert to Rdata
#write a 5 line paragraph discussing what the ggsn function sawell as the scales function is?
####PRACTICE CODING
library(tidyverse)
library(readr)
laminaria <- read_csv("Intro_R_UWC/data/laminaria.csv")      #loading laminaria data

save(laminaria, file = "Intro_R_UWC/data/laminaria1.RData")  #saving laminaria as RData

#ggsn function is a function that has north symbols and scale bars for maps created with ggplot
#or ggmaps. It has 18 options of north symbols that it can add and scale bars in kilometeres
#to maps within ggplot or ggmap. The scales The idea of the scales package is to implement scales
#in a way that is graphics system agnostic. The scales package is made up of the following interdependent components
#Palettes which describe the useful palettes of aesthetic;Transformations,describe common scale transformations, 
#their inverses, and ways of generating breaks and labels. Bounds: various ways of rescaling the data
#Scaling functions: pull together palettes, bounding functions and transformations to provide a complete pathway from raw data to perceptual propertiesst be computed over multiple groups or multiple panels. 
#Mutable ranges: in many graphics pathways, scale ranges can not be computed in a single pass, but mu

     