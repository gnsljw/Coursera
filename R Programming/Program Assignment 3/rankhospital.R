rankhospital <- function(state, outcome, num){
     # Read outcome of care data file
     data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     data <- data[c(2, 7, 11, 17, 23)]
     names(data)[1] <- "name"
     names(data)[2] <- "state"
     names(data)[3] <- "heart attack"
     names(data)[4] <- "heart failure"
     names(data)[5] <- "pneumonia"
     
     # Check outcome string, if outcome string is false, print "invalid outcome"
     outcomes = c("heart attack", "heart failure", "pneumonia")
     if (outcome %in% outcomes == FALSE) stop ("invalid outcome")
     
     # Check state string, if state string is false, print "invalid state"
     states <- data[,2]
     states <- unique(states)
     if (state %in% states == FALSE) stop ("invalid state")
     
     # Check num
     if (num != "best" && num != "worst" && num%%1 != 0) stop ("invalid num")
     
     # Select rows with specific state
     data <- data[data$state == state & data[outcome] != "Not Available", ]
     
     # Ordering
     data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
     data <- data[order(data$name, decreasing = FALSE), ]
     data <- data[order(data[outcome], decreasing = FALSE), ]
     
     # Calculate num
     vals <- data[,outcome]
     if (num == "best"){
          rowNum <- which.min(vals)
     }
     else if (num == "worst"){
          rowNum <- which.max(vals)
     }
     else{
          rowNum <- num
     }
     
     # Result
     data[rowNum, ]$name
}