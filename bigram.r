## this script reads cleanedset in global environment and
## use function createbigram from ngram.R script to create a bigram and
# write it down for latter use it the model.

# rm(list=ls())
# getwd()
setwd("C:/Users/Sergey/Documents/Coursera/DataScientist/CapstoneProject/CapstoneDataset")

# reading data
con <- file("trainset.txt", "r")
trainset <- readLines(con, skipNul = TRUE, warn = FALSE)
close(con); rm(con) 

# cleaning data
source("clean.R")
clean(trainset)

# creating bigram
source("ngram.R")
createbigram(cleanedset)

write.table(bigram, file = "bigram.csv")
rm(bigram, cleanedset, trainset, clean, createbigram, createtrigram)

