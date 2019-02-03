#Day 4
#Chaoter
#Tidy data
#1Feb

library(tidyverse)
load("data/SACTN_mangled.RData")

ggplot(SACTN1, aes(x = date, y = temp)) +
  geom_line(aes(colour = site, group = paste0(site, src))) +   #paste0 is to group more than one variable
  labs(x = "Date", y = "Temp")
  
#making SACTN2 Tidy
SACTN2_tidy <- SACTN2 %>%
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp")   #gather the 3 columns and put them in src column and their value to temp

#spreading data
SACTN3_tidy <- SACTN3 %>% 
  spread(key = var, value = val)  #instead of having a column repeating depth, we make depth the column and val to be the values in the column

#separating data
SACTN4a_tidy <- SACTN4a %>% 
  separate(col = index, into = c("site", "src"), sep = "/ ") #when separating anything into two or more columns we use a c function

#uniting columns (bringing together columns)
SACTN4b_tidy <- SACTN4b %>% 
  unite(year, month, day, col = "date", sep = "-")         #uniting year, month and day into 1 column named date and separate the data by -

#Joining
SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy)       #left join function detects similar variables and joins the data

#[A.A]
# Neat script, script runs
# Good commens thoughput the document

