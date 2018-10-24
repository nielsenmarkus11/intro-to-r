# Load Libraries
library(tidyverse)

# Pull in data source
data(mtcars)

# Convert the data.frame to a tibble
mtcars$makemodel <- rownames(mtcars)
mtcars <- as.tibble(mtcars)

# Using the tidyverse answer the following questions:
# What car has the highest mpg?
mtcars %>% 
  select(makemodel,mpg) %>%
  arrange(-mpg)


# What is the average mpg overall?
mtcars %>%
  summarize(mean.mpg = mean(mpg))

mean(mtcars$mpg)

# What is the mean and standard deviation of mpg by number of cylinders?
mtcars %>% 
  group_by(cyl) %>% 
  summarize(mean.mpg = mean(mpg), sd.mpg = sd(mpg))
  
tapply(mtcars$mpg,mtcars$cyl,mean)
tapply(mtcars$mpg,mtcars$cyl,sd)

# Which type of vehicle gets better gas mileage, automatic or manual (am)?
# Hint: ?mtcars can give you some metadata for this preloaded data.
mtcars %>% 
  mutate(transmission = ifelse(am==0,"Automatic","Manual")) %>%
  group_by(transmission) %>%  
  summarize(mean.mpg = mean(mpg), sd.mpg = sd(mpg))
  


# What is the mpg, number of cylinders, and horsepower for each of the top 5 vehicles with the fastest 1/4 mile times (qsec)? 
# Bonus: Can you limit this list automatically to the top 5?
# Hint: ?top_n
mtcars %>% 
  select(makemodel,mpg,cyl,hp,qsec) %>%
  top_n(5,-qsec) %>% 
  arrange(qsec)
