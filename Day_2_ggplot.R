#plotting in R using ggplots2
#day2
#Mihle Gayiza
#30th Jan 2019

#load library
library(tidyverse)

chicks <- datasets::ChickWeight
??ChickWeight

ggplot(data = chicks, aes(x = Time, y = weight)) +  #specify data #aes (aestethic) specify x n y
  geom_point() +                                   #when plotting you use +, same as %>% 
  geom_line(aes(group = Chick))                     #when plotting you use group, same as group by


ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) + #for time effeciency entry is dataset
  geom_point() +
  geom_line(aes(group = Chick))

ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm")    #geom smooth averages the data and creates a smooth line #lm is a linear model

ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) + 
  geom_point(colour = "green") +
  geom_line(aes(group = Chick))


ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) + 
  geom_point(aes(size = weight)) +            #point size to show the weight
  geom_smooth(method = "lm") +
  labs(x = "Days", y = "Weight (kg)") + #when you want to rename the label
  ggtitle("The weight of chick growth over time on different diets")
  theme_bw()                            #changing appearance of graph
  
  #FACETTING IN GGPLOT
  library(ggpubr)

  ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) +
    geom_point() +
    geom_smooth(method = "lm") +
    facet_wrap(~Diet, ncol = 2)  #~tells us that the data we want to split, ncol is the number of columns we want to split the data into

chicks_2 <- chicks %>%             #create new dataset
  filter(Time == 21)             #show only day 21

plot_1 <- ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_line(aes(group = Chick)) +
  ggtitle("A1")
  

plot_2 <- ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("B")


plot_3 <- ggplot(data = chicks_2, aes(x = weight)) +
  geom_histogram(aes(fill = Diet), position = "dodge", binwidth = 100) +  #with histogram always use dodge
  labs(x = "Final Mass (g)", y = "Count")

plot_4 <- ggplot(data = chicks_2, aes(x = Diet, y = weight)) +
  geom_boxplot(aes(fill = Diet)) +
  labs(x = "Diet", y = "Final Mass (g)")

plot_combined <- ggarrange(plot_1, plot_2, plot_3, plot_4)

##3rd library
library(boot)
urine <- boot::urine
??urine

 urine %>% 
  select(-cond)     #excluding a column
 
 ggplot(data = urine, aes(x = osmo, y = ph)) +
   geom_point(aes(colour = cond))

 ggplot(data = urine, aes(x = osmo, y = ph)) +
   geom_point(aes(colour = as.factor(r)))    #as."factor" tells r to read as a factor
 
 dd