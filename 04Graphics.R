# Load Libraries
library(dplyr)

# Set working directory
setwd('~')


# Read in the csv data from the casemix summary pull in the last section



# Plot the densities of TOTAL_COST_AMT by SEX_CD



# Create a summary data set containing the means and medians of TOTAL_COST_AMT by SEX_CD
# hint: don't forget to replace 'dat' with whatever you name your input data set above
cost.summary=dat %>% group_by(SEX_CD) %>% summarise(mn = mean(TOTAL_COST_AMT), med=median(TOTAL_COST_AMT), cnt=length(TOTAL_COST_AMT))

# Overlay reference lines for the means and medians of each distribution from cost.summary
# hint: geom_vline() is the function needed for vertical reference lines.