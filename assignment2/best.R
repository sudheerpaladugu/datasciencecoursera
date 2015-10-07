require(datasets)
best <- function(prmState, outcome)
{
    fileName <- paste("week3data",sep = "/","outcome-of-care-measures.csv")
    #valid outcome values
    vaildoutcome <- c("heart attack","heart failure","pneumonia")
    dFrame <- data.frame() #defining empty dataset to store clear data
    subFrame <- data.frame()
    
    dFrame <- rbind(dFrame, read.csv(fileName, blank.lines.skip = T, colClasses = "character", na.strings = c("Not Available", "<NA>","NA")))
    validStates <- state.abb #getting valid states from datasets
    
    #checking for valid outcome string
    if(!is.element(outcome,vaildoutcome))  {
        
        stop("invalid outcome")
        
     } else if(!is.element(prmState, validStates)) {#checking for valid state
         
        stop("invalid state")
         
     }  else   {
    
         #getting outcome colum number
         outcome <- gsub(" ", ".", outcome, fixed = TRUE)
         pattern <- paste('^Hospital.30.Day.Death..Mortality..Rates.from.', outcome, sep="")
         a <- grepl(toupper(pattern), toupper(colnames(dFrame)), ignore.case = TRUE)
         outcome <- which(a)
         
         #getting state specific sub-dataframe
         subFrame <- subset(dFrame, dFrame$State == prmState, State = as.character(), 
                           Hospital.Name = as.character(), outcome = as.numeric(), stringsAsFactors = FALSE)
         #getting required columns from sub-dataframe
         subFrame <- subFrame[,c(2,7,outcome)]
         #excluding non-numberic values
         clean_data <- subFrame[which(subFrame[,3] !="Not Available"), ]
         #ordering data
         final_data <- clean_data[order(as.numeric(clean_data[,3]), na.last=NA),]
         
         #transform(final_data, outcome = as.numeric(outcome))
         #returning required columns
         return(final_data[1,1])
    }
}


