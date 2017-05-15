library(quanteda)
library(dplyr)

setwd("C:/Users/Sergey/Documents/Coursera/DataScientist/CapstoneProject/CapstoneDataset/knsmooth")
list.files()
rm(list = ls())

phrase <- "I like how the same people are in almost all of Adam Sandler's"
source("clean.R")
phrase <- clean(phrase)
rm(cleanedset, clean)
# phrase <- "ill be there for you id live and id die"
# phrase <- "this is good thank for the"


system.time({
# model
phrase <- unlist(strsplit(phrase, split = " "))
length(phrase)
phrase <- phrase[(length(phrase) - 2):(length(phrase) -1)]


# phrase = wordn + ... + word3 + word2 + word1 after cleaning 
# our goal is to predict word1 or choose between different words1
# we use trigam data frame to find word1
# we filter trigram using previose words (word3 and word2) to find a set of word1
# we assign conditional probability to all elements of word1


# first element is a unigram continuation probabality
# it does not depent on any other following data table
# head(unigram)
finalunigram <- select(unigram, -sum)
# head(finalunigram)
# user  system elapsed 
# 0       0       0 

# next element is a bigram continuation
modelbigram <- bigram %>% filter(word2 == phrase[2]) %>% mutate(p2 = discount / sum(count)) %>% 
        select( - c(discount))
# head(modelbigram)
# sum(modelbigram$count)

# user  system elapsed 
# 0.08    0.00    0.08 

# to combine bigram and unigram we need to find lambdas
# finding lambda for a unigram using a bigram
modellambda1 <- lambda1 %>% filter(word2 == phrase[2]) %>% 
        mutate(lambda = d / sum(modelbigram$count) * sumfollow) %>% select( - c(sumfollow))

# user  system elapsed 
# 0.12    0.00    0.13 

# head(modellambda1)
# here i combine unigram continuation probability dataframe with lambba dataframe
# and multiply lambda and unigram continuation probability
finalunigram <- merge(modellambda1, finalunigram, all = TRUE)
finalunigram <- finalunigram %>% mutate(p1 = pconti * lambda) %>% 
        select( - c(lambda, pconti))
# head(finalunigram)

# user  system elapsed 
# 0.71    0.00    0.70 

# here i reduce unigram length to bigram length 
# i think that other words have very small probabilities  
# finalunigram <- finalunigram[finalunigram$word1 %in% modelbigram$word1, ]

# here i combine unigram continuation probability multiplied by lambda with bigram probability 
modelbigram <- modelbigram %>% select( - count)
modelbigram  <- merge(modelbigram, finalunigram, all = TRUE)
modelbigram$p2[is.na(modelbigram$p2)] <- 0
modelbigram <- modelbigram %>% mutate(p2 = p2 + p1) %>% select( -c(p1)) %>% arrange(desc(p2))
# head(modelbigram)


# user  system elapsed 
# 8.00    0.05    8.05 

# modeltrigram shows every trigram which has word2 and word3 the same as in phrase 
modeltrigram <- trigram %>% filter(word3 == phrase[1] & word2 == phrase[2]) %>% 
        mutate(p3 = discount / sum(count))
# head(modeltrigram)

## i assume that modelbigram is not empty
## checking if trigram is not empty
## if modeltrigram is empty i use modelbigram as a final table
# modeltrigram <- modeltrigram[0, ]
if (dim(modeltrigram)[1] == 0) {
  final <- modelbigram      
} else{
        # modelbigramlambdas shows lambda for a bigram
        modellambda2 <- lambda2 %>% filter(word3 == phrase[1] & word2 == phrase[2]) %>%
                mutate(lambda2 = d / sum(modeltrigram$count) * sumfollow) %>% select(- c(sumfollow))
        # head(modellambda2)
        
        # here i combine lambda with a bigram probability 
        modelbigram <- merge(modellambda2, modelbigram, all = TRUE)
        # head(modelbigram)
        modelbigram <- modelbigram %>% mutate(p2 = p2 * lambda2) %>% select(- c(lambda2))
        
        
        # here i combine trigram probability with a bigram continuation probability 
        modeltrigram <- modeltrigram %>% select(- c(count, discount))
        modeltrigram <- merge(modeltrigram, modelbigram, all = TRUE)
        modeltrigram$p3[is.na(modeltrigram$p3)] <- 0
        final <- modeltrigram %>% mutate(p3 = p3 + p2) %>% select(- c(p2)) %>% arrange(desc(p3))
}
})
