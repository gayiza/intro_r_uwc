#Mihle Gayiza
#3650799
#30th Jan 2019


#EXERCISE_2
#use 3 buil-in datasets (use the dataset function) to produce 2 graphs per dataset.
#calculate the means in one column in each dataset.
#create a hypothesis for each of the graph and use the graphs to answer the hypothesis
#
#draw 3 graphs from the laminaria data
library(tidyverse)
library(ggplot2)

air1 <- datasets::airquality
??airquality
#Hypothesis: As the wind increases temperature will also increase
ggplot(air1, aes(x = Wind, y = Temp)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("Scatter plot showing the temperature of the wind")
  #Hypothesis = June is the hottest month 
  #Investigative question is What is the  hottest month?
boxplot(Temp~Month,            #seperate Temp and Month data
        data=air1,                
        main="Different boxplots for each month",  #boxplot heading
        xlab="Month Number",                       #boxplot x axis
        ylab="Degree Fahrenheit",                 #y axis
        col="lightblue",
        border="yellow")

iris1 <- datasets::iris

#The Species that has the largets sepal length has the lowest sepal width

ggplot(iris1, aes(x = Sepal.Width, y = Sepal.Length, colour = Species)) +
  geom_point() +
  geom_smooth(method = "lm")


#HYPOTHESIS: The species that has the largest sepal width will have the smallest patel width

iris_plot1<- ggplot(iris1, aes(Species, Petal.Width, colour = Species)) +  
  geom_boxplot() +
  scale_y_continuous("Petal Width (cm)", , breaks = seq(0,30, by = .5)) +   #naming the y axis, control the flow of the box
  labs(title = "Iris Petal Width Box Plot", x = "Species")                  #naming the box plot

iris_plot <- ggplot(iris1, aes(Species, Sepal.Width, colour = Species)) +   #looking at sepal width
  geom_boxplot()+
  scale_y_continuous(" Sepal Width (cm)", , breaks= seq(0,30, by = .5)) +
  labs(title = "Sepal Width Box Plot", x = "Species")

plot_combined <- ggarrange(iris_plot, iris_plot1)                           #plotting both the plots


Carbon <- datasets::CO2

#Hypothesis: There is more non chilled treatment uptake as the CO2 concentration increases
 
ggplot(Carbon, aes(x = conc, y = uptake, colour = Treatment)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "CO2 concentration (mL/L)", y = "CO2 uptake rates (umol/m^2 sec)") +
  ggtitle("CO2 uptake rate vs CO2 concentration")
 
#Hypothesis: Uptake rates for all pant types is increasing linear as the CO2 conc. increases 
ggplot(Carbon, aes(x = conc, y = uptake, colour = Plant)) +
  geom_line() +
  geom_smooth(method = "lm", colour = "black") +
  labs(x = "CO2 concentration (mL/L)", y = "CO2 uptake rates (umol/m^2 sec)") +
  theme_bw() +
  ggtitle("CO2 uptake rate vs CO2 concentration for each plant level")

lam <- read_csv("data/laminaria.csv")

  #Hypothesis: There is a strong correlation between stipe mass and stipe length

ggplot(data = lam, aes(x = stipe_mass, y = stipe_length)) +
  geom_point(shape = 21, colour = "green", fill = "purple") +
  labs(x = "Stipe mass (kg)", y = "Stipe length (cm)") +
  geom_smooth(method = "lm") +
  ggtitle("Correlation between stipe mass and stipe length")

#Hypothesis: In each site as the blade weight increases the total length increases

ggplot(lam, aes(x = blade_weight, y = total_length, colour = site)) +
  geom_point()+
  geom_smooth(method = "lm") +
  ggtitle("Total length and blade weight of Laminaria in each of the sites")



#Hypothesis: There is a strong correlation betweem the Thallus mass and digits of Laminaria sp.
ggplot(data = lam, aes(x = digits , y = thallus_mass )) +
  geom_point(shape = 21, colour = "black", fill = "blue") +
  labs(x = "Digits (cm)", y = "Thallus mass (kg)") +
  geom_smooth(method = "lm") +
  ggtitle("Correlation between Thallus mass and digits")

# [A.A]
# Sjoh, nicely done
# First student to try different things with this exercise
# Well done!!
# Good commenting and neat script




