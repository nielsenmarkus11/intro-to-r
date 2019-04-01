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
## This produces a blank canvas.


# 2. How many rows are in `mpg`? How many columns?
nrow(mpg)
ncol(mpg)


# 3. What does the `drv` variable describe? Read the help for `?mpg` to find out.
## The drv variable is a categorical variable which categorizes cars into front-wheels, rear-wheels, or four-wheel drive.


# 4. Make a scatterplot of `hwy` vs `cyl`.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))


# 5. What happens if you make a scatterplot of `class` vs `drv`? Why is the plot not useful?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = drv))
## A scatter plot is not a useful display of these variables since both drv and class are categorical variables.



## Set 1 Exercises ---------------------------------
#1. What’s gone wrong with this code? Why are the points not blue?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

## The color = 'blue' should be outside the aes() function
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


# 2. Which variables in `mpg` are categorical? Which variables are continuous? (Hint: type `?mpg` to read the documentation for the dataset). How can you see this information when you run `mpg`?
?mpg
## categorical: manufacturer, model, trans, drv, fl, class
## continuous : displ, year, cyl, cty, hwy

# 3. Map a continuous variable to `color`, `size`, and `shape`. How do these aesthetics behave differently for categorical vs. continuous variables?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = cty))
## Instead of using discrete colors, the continuous variable uses a scale that varies from a light to dark blue color.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = cty))
## When mapped to size, the sizes of the points vary continuously as a function of their size.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = cty))
## When a continuous value is mapped to shape, it gives an error.


# 4. What happens if you map the same variable to multiple aesthetics?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = hwy, size = displ))
## In the above plot, hwy is mapped to both location on the y-axis and color, and displ is mapped to both location on the x-axis and size.
##   The code works and produces a plot, even if it is a bad one. Mapping a single variable to multiple aesthetics is redundant. Because it 
##   is redundant information, in most cases avoid mapping a single variable to multiple aesthetics.


# 5. What does the stroke aesthetic do? What shapes does it work with? (Hint: use `?geom_point`)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), shape = 21, colour = "black", fill = "white", size = 5, stroke = 5)
## Stroke changes the size of the border for shapes (21-25). These are filled shapes in which the color and size of the border can differ 
##   from that of the filled interior of the shape.


# 6. What happens if you map an aesthetic to something other than a variable name, like `aes(colour = displ < 5)`? Note, you’ll also need to specify x and y.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))
##  The ggplot() function behaves as if a temporary variable was added to the data with with values equal to the result of the expression.



## Set 2 Exercises ---------------------------------
# Consider the following code for exercises 1-3:
ggplot(data = alldat) + 
  geom_histogram(mapping = aes(x=prevalence))


# 1. What happens when you add the `geom_histogram(binwidth=5)` mapping?
ggplot(data = alldat) + 
  geom_histogram(mapping = aes(x=prevalence), binwidth = 5)
## The histogram bins get wider.


# 2. What happens when you change the geometric object to `geom_density()`?
ggplot(data = alldat) + 
  geom_density(mapping = aes(x=prevalence))
## This changes our histogram to a kernel density estimator plot.


# 3. Can you tweak the code from exercise 2 to generate the density by `gender`?
ggplot(data = alldat) + 
  geom_density(mapping = aes(x=prevalence, color=gender, fill=gender), alpha = 0.35)



## Set 3 Exercises ---------------------------------
# 1. What `geom` would you use to draw a line chart? A boxplot? A histogram? An area chart?
# line chart: geom_line()
# boxplot: geom_boxplot()
# histogram: geom_hist()
# area chart: geom_area()


# 2. What happens when you exclude `as.factor()` and run the following code?
ggplot(data = alldat) + 
  geom_boxplot(mapping = aes(x=as.factor(year), y=prevalence))
## It generates one large boxplot for all years.

# 3. What happens when you move both of the the `mapping` arguments into the `ggplot()` function?
ggplot(data = alldat) + 
  geom_point(mapping = aes(x=year,y=prevalence)) + 
  geom_smooth(mapping = aes(x=year,y=prevalence), method=lm)
## Nothing changes... except that I don't have to map the variables twice. :)


# 4. What does `method=lm` do in the code above? What happens when you remove it?
ggplot(data = alldat) + 
  geom_point(mapping = aes(x=year,y=prevalence)) + 
  geom_smooth(mapping = aes(x=year,y=prevalence))
## It changes the smoother to the LOESS smoother instead of a linear model.


# 5. Use `alldat` and generate a combined scatter plot and line graph colored by `chronicCondition`. What do you see?  Are there any issues?
ggplot(data = alldat, mapping = aes(x=year, y=prevalence, color=chronicCondition)) + 
  geom_point() + 
  geom_line()
## Each year has two values, it looks like we could facet by gender to get a better visualization.



## Set 4 Exercises ---------------------------------
# 1. Take the following example and switch the `color` and `facet` variables. Which plot do you prefer and why?
ggplot(data = alldat, mapping = aes(x=year, y=prevalence, color=chronicCondition)) + 
  geom_point() + 
  geom_line() + 
  facet_wrap(~gender)

ggplot(data = alldat, mapping = aes(x=year, y=prevalence, color=gender)) + 
  geom_point() + 
  geom_line() + 
  facet_wrap(~chronicCondition)
# Depends on the question you are trying to answer and what comparison you want to make.


# 2. For exercise 1, what happens when you add `ncol=4` to the `facet_wrap()` function?

ggplot(data = alldat, mapping = aes(x=year, y=prevalence, color=gender)) + 
  geom_point() + 
  geom_line() + 
  facet_wrap(~chronicCondition, ncol = 4)
## Changes the number of facet columns to 4.