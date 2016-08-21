#### this script contains funcions for creating n-gram's
#### library needed: quanteda, dplyr
# ngram function is a function of one argument x which is a text string or 
# collection of text strings
# output is an object bigram or trigram in global environmennt 
# a data frame with columns count, word1, ..., wordn.  
# it can looks like this in case of a bigram uncleaned collection of strings
# count word2 word1
# 1    45     .     .
# 2    11     !     !
# 3    10    in   the
# 4     9   for   the
# 5     7    to   the

# or it can looks like this in case of a trigram and cleaned collection of strings
#   count word3   word2 word1
# 1  2053 happi  mother   dai
# 2  1624   let       u  know
# 3  1326 happi     new  year
# 4   912  look forward   see
# 5   775   new    york  citi


library(quanteda)
library(dplyr)

## creating bigram function

createbigram <- function(x) {

tokens <- tokenize(x, ngrams = 2)
# head(tokens)
rm(x)

Dfm2 <- dfm(tokens);
bigram <- data.frame(words = names(topfeatures(Dfm2, dim(Dfm2)[2])), row.names = NULL,
                     count = topfeatures(Dfm2, dim(Dfm2)[2]), stringsAsFactors = FALSE)

bigram <- filter(bigram, count > 1)

first <- function(x){x[2]}
second <- function(x){x[1]}

bigram <- bigram %>% mutate(words = strsplit(words, split = "_")) %>% 
  mutate(word2 = sapply(words, second)) %>% 
  mutate(word1 = sapply(words, first)) %>% select(-words)

bigram <<- bigram
# head(bigram); tail(bigram)
rm(Dfm2, tokens, first, second)
}



## creating trigram function

createtrigram <- function(x) {
  
tokens <- tokenize(x, ngrams = 3)
# head(tokens)
rm(trainset)

Dfm3 <- dfm(tokens);
trigram <- data.frame(words = names(topfeatures(Dfm3, dim(Dfm3)[2])), row.names = NULL,
                      count = topfeatures(Dfm3, dim(Dfm3)[2]), stringsAsFactors = FALSE)

trigram <- filter(trigram, count > 1)

first <- function(x){x[3]}
second <- function(x){x[2]}
third <- function(x){x[1]}

trigram <- trigram %>% mutate(words = strsplit(words, split = "_")) %>%
  mutate(word3 = sapply(words, third)) %>%
  mutate(word2 = sapply(words, second)) %>% 
  mutate(word1 = sapply(words, first)) %>% select(-words)

trigram <<- trigram
# head(trigram); tail(trigram)
rm(Dfm3, tokens, first, second, third)
}

