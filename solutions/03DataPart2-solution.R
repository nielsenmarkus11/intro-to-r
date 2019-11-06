## Load libraries
library(intermountain)

## Set Working directory
setwd("~")
# getwd()


## Pull data from the edw
# hint: set the connection first then submit the query with 'sqlQuery()'
myQuery <- "

  SELECT
    SMR.EDW_CM_ID
    ,SMR.SEX_CD
    ,SMR.AGE_YRS
    ,SMR.TOTAL_COST_AMT
    ,SMR.ADMIT_YR

  FROM TRAIN.CASEMIX_SMRY_NOT_USED SMR

  "
db <- edw()
# dat <- sqlQuery(db,myQuery)
dat <- dbGetQuery(db,myQuery)

## Write query output to csv
write.csv(dat,"Casemix_Smry.csv", row.names = FALSE)


## Create a summary of the data
# hint: google and stackoverflow are your friends! ;)
dim(dat) # 20,388 observations
summary(dat)

dat %>% 
  filter(SEX_CD=='1') %>% 
  Hmisc::describe()

Hmisc::describe(dat[dat['SEX_CD']=='1',])

## Does your data need any cleaning?

# EDW_CM_ID and SEX_CD came in as numerical values lets set them to factors
dat$EDW_CM_ID = as.factor(dat$EDW_CM_ID)
dat$SEX_CD = as.factor(dat$SEX_CD)

summary(dat) # It looks like we correct SEX_CD and EDW_CM_ID but now it bothers me that EDW_CM_ID is not unique 

# So lets look at two cases with the same EDW_CM_ID
?duplicated
dup <- dat %>% 
  filter(duplicated(EDW_CM_ID)) %>% 
  select(EDW_CM_ID)

# this will show all non unique EDW_CM_IDs
dups <- dat %>% 
  filter(EDW_CM_ID %in% dup$EDW_CM_ID) %>% 
  arrange(EDW_CM_ID)
# Good thing this is a training data set lets go ahead and remove a single instance of those that are duplicated

#remove duplicates
dat=dat %>% 
  filter(!duplicated(EDW_CM_ID))

dim(dat) # Now we have 20,346 Observatios

# Now we've removed the duplicate EDW_CM_IDs - There are some NA's in the age and 999 age_yrs
summary(dat)

dat=dat[!is.na(dat$AGE_YRS) & dat$AGE_YRS<200,] # This excludes both the NA's and ages greater than 200 years old

summary(dat) #Looks better - Lets assume this is clean enough - we now have 20,324 accounts
