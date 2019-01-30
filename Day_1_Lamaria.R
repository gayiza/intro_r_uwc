#day 1
#lamaria data set exploring and learning
#29 Jan 2019
#Practice
#Mihle Gayiza

#before doing anything load libraries

library(tidyverse)
lam <- read_csv("data/laminaria.csv")

#explore data

head(lam) #shows first 6 rows
tail(lam) #shows last 6 rows

head(lam, n = 3)  #shows first 3 rows
tail(lam, n = 3)  #shows last 3 rows

lam_select <- lam %>% 
  select(site, total_length) %>% #select only site n total length
  slice(54:80)

lam_kom <- lam %>%            #in the laminaria data set 
  filter(site == "Kommetjie") #filter out Kommetjie 

#in the laminaria data set select only the site and blade_length column
#filter only for sea point

lam_Sea_point <- lam %>% 
  select(site, blade_length) %>% 
  filter(site == "Sea Point")


lam %>% 
  filter(total_length == max(total_length))

summary(lam)


dim(lam)  #gives dimension of the data set (obs and var)

lam %>% 
  group_by(site) %>%
  summarise(avrg_bl = mean(blade_length),  #SINCE ITS THE SAME FUNCTION WE DONT USE %>% ;#using summarise requires a new name [AVRG_BL]
           med_bl = median(blade_length),
           sd_bl = sd(blade_length))       

lam %>%                                    #select lam data set
  summarise(var_bl = var(blade_length),    #summarize calculate the variance per site
            n = n()) %>%                   #number of entries
  mutate(se = sqrt(var_bl/n))              #mutate creates new column [standard error <- sqrt(var_bl/n)]

#exclude blade thickness and blade length in the data set
lam_2 <- lam %>% 
  select(-blade_thickness, -blade_length)


lam %>%                       #shows the number of stipe mass
  select(blade_length) %>%                            #omits NA data 
  summarise(n = n())

lam %>%                       #shows the number of stipe mass
  select(blade_length) %>% 
  na.omit %>%                              #omits NA data 
  summarise(n = n())


#visualisation
ggplot(data = lam, aes(x = stipe_mass, y = stipe_length)) +
  geom_point(shape = 21, colour = "green", fill = "purple") +
  labs(x = "Stipe mass (kg)", y = "Stipe length (cm)")

ggplot(lam, aes(x = blade_weight, y = total_length, colour = site)) +
  geom_point()+
  geom_smooth(method = "lm")





