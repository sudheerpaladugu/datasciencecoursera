#Course ID: rprog-031
#Submission login (email): sudheerpaladugu@yahoo.com
#Submission password: XWWTafsRDZ


source("best.R")

best("TX", "heart attack")

best("TX", "heart failure")

best("MD", "heart attack")

best("MD", "pneumonia")

best("BB", "heart attack")

best("NY", "hert attack")

strng <- c("NY", "hert attack")



st <- "NY"
ot <- "heart attack"

stri <- paste(st,ot,sep = "','")
cat("Error in beast(",stri,"): invalid state",sep = "'")


a <- cat(shQuote("NY"))

test <- "abc$def`gh`i\\j"
cat(shQuote(test), "\n")


b <- cat(shQuote(",hert attack"),"\n")



cat(shQuote("blah"), "\n")




data(mtcars)
head(mtcars)
smallmt <-  mtcars[ , c(1,2,4)]

NewColumnNames    <-    c("milespergallon", "cylinders", "horsepower")
NewColumnNames
colnames(smallmt) <- NewColumnNames

head(smallmt)




rankhospital("TX", "heart attack",1)
rankhospital("MD", "heart failure", 5)

source("rankhospital.R")
rankhospital("TX", "heart failure", 4)
rankhospital("TX", "heart failure", "worst")
rankhospital("TX", "heart failure","best")
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)
rankhospital("MK", "heart attack", 5000)
rankhospital("MN", "heart attack1", 5000)

rankhospital("MD", "heart failure", 5)

rankhospital("MD", "heart failure", "best")
rankhospital("MD", "heart failure", "worst")

tail(rankall("heart failure"), 10)

rankall("heart failure","best")
rankall("heart attack", "worst")


 for(i in (1:10)){
     if(i == 5){next}
     print(i)
     
 }

rankhospital("FL", "heart attack", 20)
best("FL", "heart attack")

rankhospital("AL", "heart attack", "best")



source("rankall.R")
head(rankall("heart attack", 20), 10)

rankall("heart attack", 20)
tail(rankall("heart failure"), 10)
rankall("pneumonia", "worst")
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("pneumonia", "best"), 3)

source("rankall.R")
head(rankall("heart attack", 20), 10)


rankall("heart failure", "best")

tail(rankall("pneumonia", "worst"), 3)

head(rankall("heart failure"), 10)
rankhospital("WI", "heart failure", "best")

rankall("pneumonia", "worst")

rankall("heart failure", 10)

rankall("heart attack", 4)

