
    complete <- function(directory, ids = 1:332)
    {
           
            id <- vector()
            nobs <- vector()
            cDataFiles <- list.files(directory, full.names=TRUE)
            dataFinal <- data.frame()
            subFrm <- data.frame()
          
            for(i in ids)
            {
                
                dataFrm <- data.frame()
                dataFrm <-rbind(dataFrm, read.csv(cDataFiles[i],header = T, na.strings = "NA"))
                complete_rows <- subFrm[complete.cases(dataFrm),]
                nobs<-c(nrow(complete_rows))
                id <- (i)
                dataFinal<-rbind(dataFinal,data.frame(id,nobs))
                
            }
            
            dataFinal
    }