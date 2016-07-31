## here i create a function called "clean" which make nessecery preparations to the argument
# it takes a text string or collection of text strings and remove foreign words, removing badwords,
# stripwhitespaces, remove numbers and punctuation, 
# steming "porter" method
# file "badwords.txt" should exist in the working directory
# library tm and quanteda are necessary for transformation 
# object cleanedset is the output of this function, it only exist in working environment
#
# cleanedset looks like this:
# [1] "btw thank rt gonna dc anytim soon love see wai wai long"
# [2] "get anoth dai skool due wonder snow wake thing"         
# [3] "coo ju work hella tire r u ever cali"                   
# [4] "need reconnect week"                                    
# [5] "dammnnnnn catch"     

library(tm)
library(quanteda)

clean <- function(x) {

# removing foreign words
for (i in 1:length(x)) {
  line <- unlist(strsplit(x[i], split = " "))
  line <- iconv(line, to = "ASCII", sub = "foreignword")
  line <- line[!grepl("foreignword", line)]
  line <- paste(line, collapse = " ")
  x[i] <- line
}
rm(i, line)

x <- tolower(x)
## removing badwords
con <- file("badwords.txt", "r")
badwords <- readLines(con, skipNul = TRUE)
close(con)
x <- removeWords(x, words = badwords)
rm(badwords, con)

x <- removeWords(x, words = stopwords("english")) 
x <- removePunctuation(x)
x <- removeNumbers(x)
x <- stripWhitespace(x)
x <- sub("^ ", "", x)
x <- sub(" $", "", x)
x <- x[!x ==""] # removing blank rows "5-th!" become "" after all

x <- tokenize(x)
x <- wordstem(x, language = "porter")

x1 <- character(length(x))
for (i in 1:length(x)) {
  x1[i] <- paste(unlist(x[i]), collapse = " ")
}
cleanedset <<- x1

rm(x1, i)
}
