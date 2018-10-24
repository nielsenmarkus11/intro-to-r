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



# What is the mpg, number of cylinders, and horsepower for each of the top 5 vehicles with the fastest 1/4 mile times (qsec)? 
# Bonus: Can you limit this list automatically to the top 5?
# Hint: ?top_n
