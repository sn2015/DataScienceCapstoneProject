## here i create a function called "clean" which makes nessecery preparations to the argument
# it takes a text string or collection of text strings and
# split it into sentences,
# remove smiles and foreign words
# stripwhitespaces, remove numbers and punctuation, 
# add begining and end of the line
# library tm and quanteda are necessary for transformation 
# object cleanedset is the output of this function, it exists only in working environment
# cleanedset looks like this:
# [1] "beginingofline how are you endofline"                                                                               
# [2] "beginingofline btw thanks for the rt endofline"                                                                     
# [3] "beginingofline you gonna be in dc anytime soon endofline"                                                           
# [4] "beginingofline love to see you endofline"                                                                           
# [5] "beginingofline been way way too long endofline"  

library(tm)
library(quanteda)

clean <- function(x) {

        x <- unlist(tokenize(x, what = "sentence"))
        x <- tolower(x)
        
        for (i in 1:length(x)) {
                line <- unlist(strsplit(x[i], split = " "))
                line[grep("[^[:punct:]0-9a-z]", line)] <- "simbolnotword" # removing smiles
                line[grep("[0-9]", line)] <- "wordwithnumber" # removing numbers
                x[i] <- paste(line, collapse = " ")
                x[i] <- paste("beginingofline", x[i], "endofline")
        }
        
        x <- removePunctuation(x)
        x <- stripWhitespace(x)
        
        cleanedset <<- x
}
