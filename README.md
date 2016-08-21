# DataScienceCapstoneProject
Capstone project in natural language processing for DataScience specialization

My goal in this capstone is to create an app that predict next word.

First i create a load.R file that download datasets provided by Coursera and split it in two files - training set and test set.
I won't use initial datasets again, and will use training set instead. 
I will explore training set and train my model on it. And test set will be used to understand how accurate my model is.

*here i put some exploratory analysis*

I create a script with a function called "clean" which take as the argument a text string or collection of text strings 
and remove foreign words, removing badwords, stripwhitespaces, remove numbers and punctuation, steming text using "porter" method.
Object cleanedset is the output of this function.

I write ascript that contains funcions for creating n-gram's
Functions of one argument x which is a text string or collection of text strings
Output is a saved file (data frame) in the working directory 
A data frame with columns count, word1, ..., wordn.  

Then I create a model, maybe several models and test them.
What my model should have as an input? A sentence or a set of words. 
For each sentence my model should give a predicted next word.
I think i will use model like k1*unigram+k2*bigram+k3*treegram, where k1+k2+k3=1, or maybe i can add a quadrogramm. 

