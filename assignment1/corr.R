source("complete.R")

    corr <- function(directory, threshold = 0) 
    {
        crlnum <- numeric(0)
        iLoop <- 1
        files <- list.files(directory, full.names = TRUE)
        for (i in seq_along(files)) 
            {
            cDataFiles <- read.csv(files[i])
            cleanset <- complete.cases(cDataFiles)
            datsum <- sum(cleanset)
            if (datsum > threshold) 
            {
                crlnum[iLoop] <-
                    cor(cDataFiles$sulfate, cDataFiles$nitrate, use = "pairwise.complete.obs")
                iLoop <- iLoop + 1
            }
        }
        crlnum
    }
