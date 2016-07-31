### here i download data from the internet 
### then load data into R 
### and create two character files in working directory: training set 60% and a test set 40% of data
# files have structure like this 
# trainset[1:5]
# [1] "How are you? Btw thanks for the RT. You gonna be in DC anytime soon? Love to see you. Been way, way too long."
# [2] "i no! i get another day off from skool due to the wonderful snow (: and THIS wakes me up...damn thing"        
# [3] "I'm coo... Jus at work hella tired r u ever in cali"                                                          
# [4] "we need to reconnect THIS WEEK"                                                                               
# [5] "Dammnnnnn what a catch"        

setwd("C:/Users/Sergey/Documents/Coursera/DataScientist/CapstoneProject/CapstoneDataset")

## downloading data from the internet 
## Url was provided by Coursera, also i can use any other datasets

Url <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
download.file(Url, "Coursera-SwiftKey.zip")
datedownloaded <- date() # Sat Jun 04 15:20:50 2016

unzip("Coursera-SwiftKey.zip")

list.files()
list.files("final/")
list.files("final/en_US")


## reading data into R

con <- file("final/en_US/en_US.twitter.txt", "r")
UStwitter <- readLines(con, skipNul = TRUE, warn = FALSE)
close(con) ##

con <- file("final/en_US/en_US.news.txt", "r")
USnews <- readLines(con, skipNul = TRUE, warn = FALSE)
close(con)

con <- file("final/en_US/en_US.blogs.txt", "r")
USblogs <- readLines(con, skipNul = TRUE, warn = FALSE)
close(con)

## combaining datasets together
sample <- c(UStwitter, USblogs, USnews)
rm(con, UStwitter, USblogs, USnews)

## creating trainset and testset
set.seed(1234)
sampleline <- rbinom(length(sample), 1, 0.60)
trainset <- sample[as.logical(sampleline)]
testset <- sample[!as.logical(sampleline)]

rm(sampleline, sample)

write(trainset, file = "trainset.txt")
write(testset, file = "testset.txt")

# str(trainset)
# trainset[1:5]
# rm(trainset, testset)

