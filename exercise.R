## Exercise: 

lam <- read_csv("data/laminaria.csv")
1.#Create a new data frame from the `laminaria` dataset that meets the following criteria: contains only the `site` column and a new column called `total_length_half` containing values that are half of the `total_length`. In this `total_length_half` column, there are no `NA`s and all values are less than 100.
#**Hint**: think about how the commands should be ordered to produce this data frame!
  total_length_half <- lam %>%                      #create a new data set
    mutate(total_length_half = total_length/2) %>%  #creating a new column
    filter(total_length_half <= 100) %>%            #which column to show, to be less than 100
    select(site, total_length)                  #only show site and total length
   
  
2. #Use `group_by()` and `summarize()` to find the mean, min, and max blade_length for each site. Also add the number of observations (hint: see `?n`).
lam %>%                                   #select data set
  group_by(site) %>%                      #group by simmilarity (site)
  summarize(avrg_bl = mean(blade_length), 
  min_bl = min(blade_length),
  max_bl = max(blade_length)) # Forgetting a pipe functiong??
  n = (n)
3.#What was the heaviest stipe measured in each site? Return the columns `site`, `region`, and `stipe_len
lam %>% 
  group_by(site) %>%
  filter(stipe_mass == max(stipe_mass))
  select(site, region, stipe_length)


# [A.A]
# Script runs
  # Fix minor errors
  # Good commenting throughout the script
  