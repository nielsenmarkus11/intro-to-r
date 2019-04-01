library(tidyverse)
# Change this to match where your chronic-conditions.csv file is saved
setwd('~/dept-drive/Mark N/zMisc/training/Intermountain/Intro to R/data')
ccdat <- read.csv("chronic-conditions.csv")

trim <- function (x) gsub("^\\s+|\\s+$", "", x)
ccdat$state <- trim(ccdat$state)
ccdat$year <- as.numeric(ccdat$year)

alldat <- ccdat %>% 
  filter(age=="All", state=="National")

## Set 0 Exercises ---------------------------------
# 1. Run `ggplot(data = mpg)`. What do you see?


# 2. How many rows are in `mpg`? How many columns?


# 3. What does the `drv` variable describe? Read the help for `?mpg` to find out.


# 4. Make a scatterplot of `hwy` vs `cyl`.


# 5. What happens if you make a scatterplot of `class` vs `drv`? Why is the plot not useful?



## Set 1 Exercises ---------------------------------
#1. What’s gone wrong with this code? Why are the points not blue?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))


# 2. Which variables in `mpg` are categorical? Which variables are continuous? (Hint: type `?mpg` to read the documentation for the dataset). How can you see this information when you run `mpg`?


# 3. Map a continuous variable to `color`, `size`, and `shape`. How do these aesthetics behave differently for categorical vs. continuous variables?


# 4. What happens if you map the same variable to multiple aesthetics?


# 5. What does the stroke aesthetic do? What shapes does it work with? (Hint: use `?geom_point`)


# 6. What happens if you map an aesthetic to something other than a variable name, like `aes(colour = displ < 5)`? Note, you’ll also need to specify x and y.



## Set 2 Exercises ---------------------------------
# Consider the following code for exercises 1-3:
ggplot(data = alldat) + 
  geom_histogram(mapping = aes(x=prevalence))

# 1. What happens when you add the `geom_histogram(binwidth=5)` mapping?


# 2. What happens when you change the geometric object to `geom_density()`?


# 3. Can you tweak the code from exercise 2 to generate the density by `gender`?



## Set 3 Exercises ---------------------------------
# 1. What `geom` would you use to draw a line chart? A boxplot? A histogram? An area chart?


# 2. What happens when you exclude `as.factor()` and run the following code?
ggplot(data = alldat) + 
  geom_boxplot(mapping = aes(x=as.factor(year), y=prevalence))


# 3. What happens when you move both of the the `mapping` arguments into the `ggplot()` function?
ggplot(data = alldat) + 
  geom_point(mapping = aes(x=year,y=prevalence)) + 
  geom_smooth(mapping = aes(x=year,y=prevalence), method=lm)


# 4. What does `method=lm` do in the code above? What happens when you remove it?


# 5. Use `alldat` and generate a combined scatter plot and line graph colored by `chronicCondition`. What do you see?  Are there any issues?



## Set 4 Exercises ---------------------------------
# 1. Take the following example and switch the `color` and `facet` variables. Which plot do you prefer and why?
ggplot(data = alldat, mapping = aes(x=year, y=prevalence, color=chronicCondition)) + 
  geom_point() + 
  geom_line() + 
  facet_wrap(~gender)


# 2. For exercise 1, what happens when you add `ncol=4` to the `facet_wrap()` function?
  