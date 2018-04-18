# Load Libraries
library(tidyverse)

# Pull in data source
data(mtcars)

# Convert the data.frame to a tibble
mtcars$makemodel <- rownames(mtcars)
mtcars <- as.tibble(mtcars)

# Using the tidyverse answer the following questions:
# What car has the highest mpg?



# What is the average mpg overall?



# What is the mean and standard deviation of mpg by number of cylinders?



# Which type of vehicle gets better gas mileage, automatic or manual (am)?
# Hint: ?mtcars can give you some metadata for this preloaded data.



# Bonus: What are the top 5 vehicles with the fastest 1/4 mile times (qsec)?
# Hint: ?top_n
