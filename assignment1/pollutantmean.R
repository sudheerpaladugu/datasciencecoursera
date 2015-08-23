
pollutantmean <- function(directory, pollutant, id = 1:332) 
{
    cDataFiles <- list.files(directory, full.names=TRUE)
    datpol <- data.frame()
    for(i in id)
    {
        datpol <-rbind(datpol, read.csv(cDataFiles[i]))
    }
    
    if(pollutant == "sulfate"){
        mean(datpol$sulfate, trim=0, na.rm=TRUE)
    }
    else if(pollutant == "nitrate"){
        mean(datpol$nitrate, trim=0, na.rm=TRUE)
    }
}