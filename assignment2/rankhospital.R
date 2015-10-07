require(datasets)
rankhospital <- function(prmState, outcome, rnknum="best")
{
    #CSC file Name
    fileName <- paste("week3data",sep = "/","outcome-of-care-measures.csv")
    #static valid outcome values
    vaildoutcome <- c("heart attack","heart failure","pneumonia")
    dFrame <- data.frame() #dataset to store csv file data
    subFrame <- data.frame() #subFrame to store state specic data
    #Reading CSV file data
    dFrame <- rbind(dFrame, read.csv(fileName, blank.lines.skip = T, colClasses = "character", na.strings = c("Not Available", "<NA>","NA")))
    validStates <- state.abb #getting valid states from datasets
    
    #checking for valid outcome string
    if(!is.element(outcome,vaildoutcome))  {
        
        stop("invalid outcome")
        
    } else if(!is.element(prmState, validStates)) {#checking for valid state
        
        stop("invalid state")
        
    } else   {
        
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
        clean_data <- subFrame[which(subFrame[,3] !="Not Available" | subFrame[,2] !=" "), ]
        #ordering data
        final_data <- clean_data[order(as.numeric(clean_data[,3]), na.last=NA),]
        #checking ranking value to query datafrom
        if("best"  == rnknum){
            rnknum <- 1
        } else if("worst" == rnknum){
            rnknum <- nrow(final_data)
        } else if( rnknum == 0) {
            rnknum <- 1
        } else if( rnknum > nrow(final_data)){
            return(NA)
        } 
        #returning 
        return(final_data[rnknum,1])
    }
}
