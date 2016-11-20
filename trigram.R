## this script reads cleanedset in global environment and
## use function createtrigram from ngram.R script to create a trigram and
# write it down for later use it the model.

# rm(list=ls())
# getwd()
setwd("C:/Users/Sergey/Documents/Coursera/DataScientist/CapstoneProject/CapstoneDataset")


# check if cleanedset exist. if dont exist clean trainset
if (file.exists("cleanedset.txt")) {
  # reading data
  con <- file("cleanedset.txt", "r")
  cleanedset <- readLines(con, skipNul = TRUE, warn = FALSE)
  close(con); rm(con);
  print("reading cleanedset.txt") } else {
        # reading trainset, cleaning and writing down
        print("cleaning trainset")
        con <- file("trainset.txt", "r")
        trainset <- readLines(con, skipNul = TRUE, warn = FALSE)
        close(con); rm(con) 

        # cleaning data
        source("clean.R")
        clean(trainset)
        rm(trainset)
        write(cleanedset, file = "cleanedset.txt")
  }


# spliting trainset into four smaller datasets because trainset is too big for my computer
line <- rep(1:4, len = length(cleanedset))
cleanedset1 <- cleanedset[line == 1]
cleanedset2 <- cleanedset[line == 2]
cleanedset3 <- cleanedset[line == 3]
cleanedset4 <- cleanedset[line == 4]
rm(cleanedset, line)

# creating 4 trigrams
source("ngram.R")

createtrigram(cleanedset1)
trigram1 <- trigram
rm(cleanedset1)

createtrigram(cleanedset2)
trigram2 <- trigram
rm(cleanedset2)

createtrigram(cleanedset3)
trigram3 <- trigram
rm(cleanedset3)

createtrigram(cleanedset4)
trigram4 <- trigram
rm(cleanedset4)
rm(trigram)

# combining 4 trigrams into one
library(dplyr)
trigram <- rbind(trigram1, trigram2, trigram3, trigram4)
rm(trigram1, trigram2, trigram3, trigram4)
grouped <- group_by(trigram, words)
trigram <- summarise(grouped, count = sum(count))
rm(grouped)
trigram <- arrange(trigram, desc(count))


# splitting words in different columns
first <- function(x){x[3]}
second <- function(x){x[2]}
third <- function(x){x[1]}

trigram <- trigram %>% mutate(words = strsplit(words, split = "_")) %>%
  mutate(word3 = sapply(words, third)) %>%
  mutate(word2 = sapply(words, second)) %>% 
  mutate(word1 = sapply(words, first)) %>% select(-words)

write.table(trigram, file = "trigram.csv")
rm(trigram, createbigram, createtrigram, first, second, third)

