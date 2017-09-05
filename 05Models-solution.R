## Load Libraries


## Set Working Directory
setwd('~')


## Read in the csv data from the casemix summary pull in the last section
dat=read.csv("Casemix_Smry.csv",header=TRUE)


## Conduct a t-test between the means of each gender
# hint: use the t.test function
t.test(dat$TOTAL_COST_AMT~dat$SEX_CD)


## Now fit a linear model of TOTAL_COST_AMT regressed on both SEX_CD and AGE_YRS
fit1 <- lm(TOTAL_COST_AMT ~ SEX_CD + AGE_YRS, data = dat)

## Check your model assumptions
plot(fit1)
summary(fit1)

## Are there any adjustments you need to make due to model assumption violations?
fit2 <- lm(log(TOTAL_COST_AMT) ~ SEX_CD + AGE_YRS, data = dat)
fit3 <- lm(log(TOTAL_COST_AMT) ~ SEX_CD + AGE_YRS, data = dat[dat$TOTAL_COST_AMT>0,])
plot(fit3)
summary(fit3)

# NOTE: Throwing out those that have zero cost is probably not the best answer since they are
#       valid data and depending on the project perhaps the most relevant data.