#
# Pkn (wi | wi-1) = max(c(wi | wi-1) - d, 0 ) / c(wi-1) + a(wi-1) * Pcont(wi)
#
#

library(quanteda)
library(dplyr)


setwd("C:/Users/Sergey/Documents/Coursera/DataScientist/CapstoneProject/CapstoneDataset/knsmooth")
list.files()
rm(list = ls())

cleanedset <- c("thank for the", "thank for the", "thank for the",
                "thank for your", "thank for your", "thank for your",
                "thank for my",
                "hope for the", "hope for the", "hope for the",
                "hope for our", "believe in our", "thank you sir")


# if there is no cleanedset function reads and clean trainset
if (!exists("cleanedset")) {
        # reading data
        con <- file("trainset.txt", "r")
        trainset <- readLines(con, n = 500000, skipNul = TRUE, warn = FALSE)
        close(con); rm(con)
        # cleaning data
        source("clean.R")
        clean(trainset)
}
rm(trainset, clean)
# head(cleanedset)

## creating bigram
tokens <- tokenize(cleanedset, ngrams = 2)
# rm(cleanedset)
# head(tokens)

Dfm2 <- dfm(tokens);
bigram <- data.frame(words = names(topfeatures(Dfm2, dim(Dfm2)[2])), row.names = NULL,
                     count = topfeatures(Dfm2, dim(Dfm2)[2]), stringsAsFactors = FALSE)
rm(tokens, Dfm2)
first <- function(x){x[2]}
second <- function(x){x[1]}

bigram <- bigram %>% mutate(words = strsplit(words, split = "_")) %>% 
        mutate(word2 = sapply(words, second)) %>% mutate(word1 = sapply(words, first)) %>% select(-words)
rm(first, second)

# creating discounted bigram
d <- 0.5
bigram$discount <- bigram$count - d
# head(bigram)

# finding # word types follow w-1 which we will use when lambda for a unigram 
lambda1 <- bigram %>% mutate(follow = 1) %>% group_by(word2) %>% summarise(sumfollow = sum(follow)) %>%
        arrange(desc(sumfollow)) 
# head(lambda1)


## using bigram i create a continuation probability for unigram
unigram <- bigram %>% mutate(preced = 1) %>% group_by(word1) %>% summarise(sum = sum(preced)) %>% 
        mutate(pconti = sum/dim(bigram)[1]) %>% arrange(desc(sum))
# head(unigram)

