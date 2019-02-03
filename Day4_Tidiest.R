#Day 4
#Chapter 12
#Tidy data 3.0
#1Feb 2019

#load libraries
library(tidyverse)
library(lubridate)


Load the data from a .RData file
load("data/SACTNmonthly_v4.0.RData")

# Copy the data as a dataframe with a shorter name
SACTN <- SACTNmonthly_v4.0

# Remove the original
rm(SACTNmonthly_v4.0)


# Group by depth

# Calculate mean temperature by depth
SACTN_depth_mean <- SACTN_depth %>% 
  group_by(depth) %>%                              #group by depth
  summarise(mean_temp = mean(temp, na.rm = TRUE), #using summarise to calc. mean 
            count = n())
SACTN_depth_mean


ggplot(data = SACTN_depth_mean, mapping = aes(x = depth, y = mean_temp)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE) +
  ggtitle("A") +                                  #adding title
  labs(x = "Depth", y = "Mean Temp")              #adding labels
 
#selecting data greater than 30 years 
SACTN_30_years <- SACTN %>%
  group_by(site, src) %>%                        #weach site and source viewed individually
  filter(n() > 360)

# First create a character vector containing the desired sites
selected_sites <- c("Paternoster", "Oudekraal", "Muizenberg", "Humewood")  #filtering more than 1 site #c (concatinate) creates a set

# Then calculate the statistics
SACTN %>% 
  filter(site %in% selected_sites) %>%                #filter in site column in the selected sites folder
  group_by(site, src) %>%                             #group the selected set of sites by site and src
  summarise(mean_temp = mean(temp, na.rm = TRUE),     #sunnarise needs us to give a name for the mean/sd data
            sd_temp = sd(temp, na.rm = TRUE))

# [A.A]
# Comments throughut the script
# Neat script
# Exploring of the functions will only improve your knowledge and maks
# Try new things
