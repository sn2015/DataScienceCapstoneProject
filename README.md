# DataScienceCapstoneProject
Capstone project in natural language processing for DataScience specialization

My goal in this capstone is to create an app that predict next word.

First i create a load.R file that download datasets provided by Coursera and split it in two files - training set and test set.
I won't use initial datasets again, and will use training set instead. 
I will explore training set and train my model on it. And test set will be used to understand how accurate my model is.

*here i put some exploratory analysis*

I create a script with a function called "clean" which take as the argument a text string or collection of text strings 
function "clean" do sentence detaction, remove foreign words, stripwhitespaces, remove numbers and punctuation, it can also can stems text using "porter" method and remove badwords (not current version).
Object cleanedset is the output of this function.

I use kneser ney method that create a unigram continuation probability, bigram and bigram continuation probability and a trigram.   

Then I create a model, maybe several models and test them.
What my model should have as an input? A sentence or a set of words. 
For each sentence my model should give a predicted next word.

