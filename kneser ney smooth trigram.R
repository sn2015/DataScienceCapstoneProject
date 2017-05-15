#
# Pkn (w | w-1, w-2) = 
#
#

library(quanteda)
library(dplyr)

setwd("C:/Users/Sergey/Documents/Coursera/DataScientist/CapstoneProject/CapstoneDataset/knsmooth")
list.files()
rm(list = ls())


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


## creating trigram 
tokens <- tokenize(cleanedset, ngrams = 3)
# head(tokens)

Dfm3 <- dfm(tokens);
trigram <- data.frame(words = names(topfeatures(Dfm3, dim(Dfm3)[2])), row.names = NULL,
                count = topfeatures(Dfm3, dim(Dfm3)[2]), stringsAsFactors = FALSE)

# head(trigram); tail(trigram)
rm(Dfm3, tokens)

first <- function(x){x[3]}
second <- function(x){x[2]}
third <- function(x){x[1]}

trigram <- trigram %>% mutate(words = strsplit(words, split = "_")) %>%
        mutate(word3 = sapply(words, third)) %>%
        mutate(word2 = sapply(words, second)) %>% 
        mutate(word1 = sapply(words, first)) %>% select(-words)

# discount
d <- 0.5
trigram <- trigram %>% mutate(discount = count - d)
# head(trigram)
# so have a trigram and we can get trigram probability when filter trigram with words 1, 2, 3,

# finding # word types follow (w-1, w-2) which we will use when lambda for a bigram 
lambda2 <- trigram %>% mutate(follow = 1) %>% mutate(bigram = paste(word3, word2)) %>%
        group_by(bigram) %>% summarise(sumfollow = sum(follow)) %>% arrange(desc(sumfollow)) 

lambda2 <- lambda2 %>% mutate(words = strsplit(bigram, split = " ")) %>%
        mutate(word3 = sapply(words, third)) %>%
        mutate(word2 = sapply(words, second)) %>% select(- c(words, bigram))
# head(lambda2)

rm(first, second, third, cleanedset)
