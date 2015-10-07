require(datasets)
rankall <- function(outcome, rnknum="best")
{
    
    fileName <- paste("week3data",sep = "/","outcome-of-care-measures.csv")
    #valid outcome values
    vaildoutcome <- c("heart attack","heart failure","pneumonia")
    dFrame <- data.frame() #defining empty dataset to store clear data
    validStates <- state.abb #getting valid states from datasets
    finalDataFrame <- data.frame() #to return all dataset
    
    
    dFrame <- rbind(dFrame, read.csv(fileName, blank.lines.skip = T, colClasses = "character", na.strings = c("Not Available", "<NA>","NA")))
    #checking for valid outcome string
    if( is.null(outcome) || !is.element(outcome,vaildoutcome))  {
        
        stop("invalid outcome")
        
    }  else   {

        #getting outcome colum number
        outcome <- gsub(" ", ".", outcome, fixed = TRUE)
        pattern <- paste('^Hospital.30.Day.Death..Mortality..Rates.from.', outcome, sep="")
        a <- grepl(toupper(pattern), toupper(colnames(dFrame)), ignore.case = TRUE)
        outcome <- which(a)
        
        statesList <- unique(dFrame$State, stringsAsFactors = FALSE)
        
        for(prmState in statesList)    {
           
            subrank <- rnknum
            #getting state specific sub-dataframe
            subFrame <- subset(dFrame, dFrame$State == prmState, State = as.character(), 
                               Hospital.Name = as.character(), outcome = as.numeric(), stringsAsFactors = FALSE)
            #getting required columns from sub-dataframe
            subFrame <- subFrame[,c(2,7,outcome)]
            #excluding non-numberic values
            clean_data <- subFrame[which(subFrame[,3] !="Not Available" | subFrame[,2] !=" "), ]
            #ordering data
            final_data <- clean_data[order(as.numeric(clean_data[,3]), na.last=NA),]
            
            #checking ranking value to query datafrom
            if((nrow(final_data) == 0) && ("best" == subrank || "worst" == subrank)){
                next #moving to next state
            } else if("best" == subrank){
                subrank <- 1
            } else if("worst" == subrank){
                subrank <- nrow(final_data)
            } else if(subrank == 0) {
                subrank <- 1
            }
            
            #returning 
            finalDataFrame <- rbind(finalDataFrame, data.frame(hospital=final_data[subrank, 1],state = prmState))
        }
        if("best" == subrank || "worst" == subrank){
            finalDataFrame <- finalDataFrame[order(as.character(finalDataFrame[, c("state")]), na.last = NA),]
        } else {
            finalDataFrame <- finalDataFrame[order(as.character(finalDataFrame[, c("state")]), na.last = NA),]
        }
        return (finalDataFrame[, c(1,2)])
    }
}
