## testing model

setwd("C:/Users/Sergey/Documents/Coursera/DataScientist/CapstoneProject/CapstoneDataset")


##### spliting testset into givenwords: all words exept last word
##### and last word, which i should predict

# reading testset
con <- file("quiz2.txt", "r")
testset <- readLines(con, n = -1, skipNul = TRUE, warn = FALSE)
close(con); rm(con) ##

# cleaning 
source("clean.R")
clean(testset)

givenwords <- character(length(cleanedset))
answers <- character(length(cleanedset))

for (i in 1:length(cleanedset)) {
  line <- unlist(strsplit(cleanedset[i], split = " "))
  givenwords[i] <- paste(line[1:length(line)-1], collapse = " ")
  answers[i] <- line[length(line)]
}

rm(i, line, cleanedset, clean)


source("model.R")
model(givenwords)

testset
givenwords
predictedwords
answers


library("caret")

confusionMatrix(answers, predictedwords)
