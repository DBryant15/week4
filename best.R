#This will be for the best function
best <- function(state, outcome){
  
  ## 20171204 1634 - DWB - test variables 
  ## state = "BB"
  ##outcome = "heart failure"
  
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
  
  ##20171206 DWB - following is test SQL to figure out issue with mortality rate
  ##query
  ##20171206 1309 DWB - below is valid just need the [] in the mortality rate query
  test_qry_1 <- sqldf::sqldf("Select [Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack] as 'HA_Mortality_Rate'
                              FROM readOutcomesFile")
  
  ## Check to see if state is valid
  if(!(state %in% valid_states$State)){
    stop("invalid state")
  }

  ##Check to see if outcome is valid
  if(outcome == "heart attack"){
    #20171206 1310 below error out on the name of columns with '.'
    #To make this valid surround in []
    # best_Mortality <- sqldf::sqldf("Select State,
    #                                Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack as 'HA_Mortality_rate' 
    #                                FROM readOutcomesFile 
    #                                ORDER BY Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack DESC")
  }
  else if(outcome == "heart failure"){
    print("we have a heart failure")
  }
  else if(outcome == "pneumonia"){
    print("we have pneumonia")
  }
  else 
    stop("invalid outcome")
  
  
  ## Return hospital name in that state with the lowest 30-day death
  ## rate.
  
  ##TODO
}