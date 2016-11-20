## this script should create a function for predict next word
## this function should take a sentence (givenwords) as input and a word as output
## this fuction use "clean" function to input sentence so we can use ngrams which were bild 
## with the same algorithm used
## object trigram and givenword should be in working environment


model <- function(x) {

setwd("C:/Users/Sergey/Documents/Coursera/DataScientist/CapstoneProject/CapstoneDataset")

if (!exists("trigram")) {trigram <- read.table("trigram.csv", stringsAsFactors = FALSE)}

library(quanteda)


# cleaning givenwords
source("clean.R")
clean(givenwords)
givenwords <- cleanedset
rm(cleanedset)

words <- character(length(givenwords))

for (i in 1:length(givenwords)) {
  tempphrase <- unlist(tokenize(givenwords[i]))
  words[i] <- trigram[trigram$word3 == tempphrase[length(tempphrase) - 2] &
                        trigram$word2 == tempphrase[length(tempphrase) - 1], ][1, 4]
}
rm(tempphrase)
predictedwords <<- words
rm(words)
}

