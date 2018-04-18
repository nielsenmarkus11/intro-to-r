## Load libraries

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

  FROM TRAIN.CASEMIX_SMRY SMR

  "


## Write query output to csv



## Create a summary of the data
# hint: google and stackoverflow are your friends! ;)


## Does your data need any cleaning?