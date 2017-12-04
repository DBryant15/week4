#This will be for the best function
best <- function(state, outcome){
  
  ## 20171204 1634 - DWB - test variables 
  ## state = "NE"
  ## outcome = "heart failure"
  
  ## load prefered librarys
  ## 20171204 1634 - DWB - may not need to call sqldf?
  ## library()
  
  ## Read outcome data
  readOutcomesFile <- read.csv("U:/Coursera/Assignments/2_R_Programming/week_4/Assignment3_DATA/outcome-of-care-measures.csv",
                               colClasses = "character", 
                               na.strings = "Not Available",
                               stringsAsFactors = FALSE)
  
  ## Check that state and outcome are valid
  
  ## get the valid states in the data
  valid_states <- sqldf::sqldf("Select State FROM readOutcomesFile GROUP BY State")
  
  ## get the valid outcomes
  ## TODO
  
  ## Check to see if state is valid
  if((state %in% valid_states$State)=FALSE){
    print("invalid state")
  }
  
  ##Check to see if outcome is valid
  ## TODO
  
  
  ## Return hospital name in that state with the lowest 30-day death
  ## rate.
  
  ##TODO
}