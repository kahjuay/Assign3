# Coursera R Programming Assign 3
#source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")

# Setting working directory
setwd ("~/R/repos/coursera/assign3")

# Reading outcome data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome) # 46
nrow(outcome) # 4706
#str(outcome)

# Heart attack (col 11) data
#outcome[, 11] <- as.numeric(outcome[, 11])
#hist(outcome[, 11])

best <- function(state, outcome) {
  ## Read outcome data
  outfile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # List of acceptable outcomes
  # colnames (outcome)
  # Heart Attack 13
  # Heart Failure 19
  # Pneumonia 25
  
  outvec <- c("heart attack","heart failure","pneumonia")
  
  
  ## Check that state 7 and outcome are valid
  if (state %in% outfile[,7]) {
    # State Found
    # print ("State Found")
    
    if (outcome %in% outvec) {
      # State and Outcome found
      # Set sort column, plus 1 to cater for hospital name
      outsort <- match(outcome,outvec) +1
      #print(outsort)
      
      # Do work here
      #besthospital <- sort(factor(outfile[outfile$TX==state][,2]))
      myhosp <- subset(outfile,State==state,select=c(2,13,19,25))
      besthosp <- myhosp[order(myhosp[,outsort],myhosp[,1]),]
      print(besthosp[[1]])
    } else {
      # Outcome not found
      stop ('invalid outcome')
    }
    
    
  } else {
    # State not found
    #print ("State not found")
    stop ('invalid state')
  }
  

  
  
  
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}

