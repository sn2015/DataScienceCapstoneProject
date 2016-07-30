## here i download data 
## then load data into R 
## and create a training set 60% and a test set 40%

setwd("C:/Users/Sergey/Documents/Coursera/DataScientist/CapstoneProject/CapstoneDataset")

Url <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
download.file(Url, "Coursera-SwiftKey.zip")
datedownloaded <- date() # Sat Jun 04 15:20:50 2016

unzip("Coursera-SwiftKey.zip")

list.files()
list.files("final/")
list.files("final/en_US")


# reading data
con <- file("final/en_US/en_US.twitter.txt", "r")
UStwitter <- readLines(con, skipNul = TRUE, warn = FALSE)
close(con) ##

con <- file("final/en_US/en_US.news.txt", "r")
USnews <- readLines(con, skipNul = TRUE, warn = FALSE)
close(con)

con <- file("final/en_US/en_US.blogs.txt", "r")
USblogs <- readLines(con, skipNul = TRUE, warn = FALSE)
close(con)

sample <- c(UStwitter, USblogs, USnews)
rm(con, UStwitter, USblogs, USnews)

# creating trainset and testset
set.seed(1234)
sampleline <- rbinom(length(sample), 1, 0.60)
trainset <- sample[as.logical(sampleline)]
testset <- sample[!as.logical(sampleline)]

rm(sampleline, sample)

write.table(trainset, file = "sets/trainset.csv")
write.table(testset, file = "sets/testset.csv")

