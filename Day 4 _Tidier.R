#Day 4
#Chapter 11
#Tidy data 2.0
#1Feb 2019

#load libraries
library(tidyverse)
library(lubridate)


# Load the data from a .RData file
load("data/SACTNmonthly_v4.0.RData")

# Copy the data as a dataframe with a shorter name
SACTN <- SACTNmonthly_v4.0

# Remove the original
rm(SACTNmonthly_v4.0)


SACTN %>% 
  filter(site == "Amanzimtoti") #using the equal to == to view data for only that site

#using Logical operators
SACTN %>% 
  filter(site == "Pollock Beach", month(date) == 12 | month(date) == 1)   #we selecting the 12 month withing the date column or the 1st month


#arrange data in depth and temp
SACTN %>% 
  arrange(depth, temp)     #arrange, arranges selected columns to the lowest to the highest value

#arreange temp data descending
SACTN %>% 
  arrange(desc(temp))

#show site Humewood and data for the year 1990
SACTN %>% 
  filter(site == "Humewood", year(date) == 1990)


humewood_90s <- SACTN %>% 
  filter(site == "Humewood", year(date) %in% seq(1990, 1999, 1))


SACTN %>% 
  filter(site == "Port Nolloth", # First give the site to filter
         src == "DEA", # Then specify the source
         temp <= 11 | # Temperatures at or below 11°C OR
           is.na(temp) # Include missing values
         
 
         #chnically better or faster. So it is up to the user to find a favourite technique.
         
 # Select columns individually by name
try1 <-  SACTN %>% 
    select(site, src, date, temp)
         
# Select all columns between site and temp like a sequence
try2 <-  SACTN %>% 
  select(site:temp)                    #select data from site to temp
         
 # Select all columns except those stated individually
 try3 <- SACTN %>% 
  select(-date, -depth)
         
# Select all columns except those within a given sequence
# Note that the '-' goes outside of a new set of brackets
# that are wrapped around the sequence of columns to remove
 try4 <- SACTN %>% 
    select(-(date:depth))   #exclude data from a point to a point
 
 try5 <- SACTN %>% 
   mutate(kelvin = temp + 273.15)  #fix error in document 
 
 #summarise #we can calc. mean, sd, min n max
 SACTN %>% 
   summarise(mean_temp = mean(temp, na.rm = TRUE),  #the names e,g sd_temp are the names that we name our data
             sd_temp = sd(temp, na.rm = TRUE),    #can substitute true with T
             min_temp = min(temp, na.rm = TRUE),
             max_temp = max(temp, na.rm = TRUE)
   )
        
 # [A.A]
 # Try new things, explore the code and its functions
 # Comments throughout the documeny, niely done
 # Shows a clear understanding of the code.
