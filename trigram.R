## this script reads cleanedset in global environment and
## use function createtrigram from ngram.R script to create a trigram and
# write it down for later use it the model.

# rm(list=ls())
# getwd()
setwd("C:/Users/Sergey/Documents/Coursera/DataScientist/CapstoneProject/CapstoneDataset")

# reading data
con <- file("trainset.txt", "r")
trainset <- readLines(con, skipNul = TRUE, warn = FALSE)
close(con); rm(con) 

# cleaning data
source("clean.R")
clean(trainset[1:1000])

# creating bigram
source("ngram.R")
createtrigram(cleanedset)

write.table(trigram, file = "trigram.csv")
rm(trigram, cleanedset, trainset, clean, createbigram, createtrigram)

