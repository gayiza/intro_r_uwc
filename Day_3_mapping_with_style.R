#mapping with styke
#Day3
#Mihle Gayiza
#31st Jan 2019

# Load libraries
library(tidyverse)
library(scales)
library(ggsn)

#Default map (world map)
ggplot() +
  borders() + # The global shape file
  coord_equal() # Equal sizing for lon/lat

#Better view of SA
sa_1 <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  coord_equal(xlim = c(12, 36), ylim = c(-38, -22), expand = 0) # Force lon/lat extent
sa_1

#Map with labelling
sa_2 <- sa_1 +
  annotate("text", label = "Atlantic\nOcean", 
           x = 15.1, y = -32.0, 
           size = 5.0, 
           angle = 30, 
           colour = "coral1") +
  annotate("text", label = "Indian\nOcean",  #/n (Y) means that you put the word under
           x = 33.2, y = -34.2, 
           size = 5.0, 
           angle = 330, 
           colour = "lawngreen")
sa_2

#Map of SA with scale bar
sa_3 <- sa_2 +
  scalebar(x.min = 22, x.max = 26, y.min = -36, y.max = -35, # Set location of bar
           dist = 200, height = 1, st.dist = 0.8, st.size = 4, # Set particulars
           dd2km = TRUE, model = "WGS84") + # Set appearance
  north(x.min = 22.5, x.max = 25.5, y.min = -33, y.max = -31, # Set location of symbol
        scale = 1.2, symbol = 16)
sa_3

#inserting maps
sa_4 <- sa_3 +
  annotation_custom(grob = ggplotGrob(africa_map),
                    xmin = 20.9, xmax = 26.9,
                    ymin = -30, ymax = -24)
sa_4

# [A.A]
# Neat script, Add more self made comments throughput the document