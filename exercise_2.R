#EXERCISE
#use 3 buil-in datasets (use the dataset function) to produce 2 graphs per dataset.
#calculate the means in one column in each dataset.
#create a hypothesis for each of the graph and use the graphs to answer the hypothesis
#
#draw 3 from the laminaria data

air1 <- datasets::airquality
??airquality
ggplot(air1, aes(x = Wind, y = Temp)) +
  geom_point() +
  geom_smooth(method = "lm")
  
ggplot(air1, aes(x = Month,)) +
  geom_histogram() 
  
