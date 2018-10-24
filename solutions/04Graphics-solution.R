# Load Libraries
library(dplyr)
library(ggplot2)

# Set working directory
setwd('~')


# Read in the csv data from the casemix summary pull in the last section
dat=read.csv("Casemix_Smry.csv",header=TRUE)
# dat$SEX_CD = as.factor(dat$SEX_CD)


# Plot the densities of TOTAL_COST_AMT by SEX_CD
ggplot(data=dat,aes(x = TOTAL_COST_AMT, fill = SEX_CD, color=SEX_CD)) + 
  geom_density(adjust=5,alpha=0.3) +
  xlim(0,1000) # This will not show the long right tail so we can see the distributions better


# Create a summary data set containing the means and medians of TOTAL_COST_AMT by SEX_CD
cost.summary=dat %>% 
  group_by(SEX_CD) %>% 
  summarise(mn = mean(TOTAL_COST_AMT), med=median(TOTAL_COST_AMT), cnt=length(TOTAL_COST_AMT))

cost.summary

# Overlay reference lines for the means and medians of each distribution from cost.summary
# hint: geom_vline() is the function needed for vertical reference lines.
ggplot(data=dat,aes(x = TOTAL_COST_AMT, fill = SEX_CD, color=SEX_CD)) + 
  geom_density(adjust=5,alpha=0.3) + 
  geom_vline(data=cost.summary, aes(xintercept=med,  color=SEX_CD),linetype="dashed", size=1) + 
  geom_vline(data=cost.summary, aes(xintercept=mn,  color=SEX_CD),linetype="solid", size=1) + 
  labs(x = "TOTAL_COST_AMT") +
  xlim(0,1000) # This will not show the long right tail so we can see the distributions better
