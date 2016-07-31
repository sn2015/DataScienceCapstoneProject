# DataScienceCapstoneProject
Capstone project in natural language processing for DataScience specialization

My goal in this capstone is to create an app that predict next word.

First i create a load.R file that download datasets provided by Coursera and split it in two files - training set and test set.
I won't use initial datasets again, and will use training set instead. 
I will explore training set and train my model on it and test set will be used to understand how accurate my model is.

here i put some exploratory analysis.

Then i create a function called "clean" which take as the argument a text string or collection of text strings 
and remove foreign words, removing badwords, stripwhitespaces, remove numbers and punctuation, steming text using "porter" method.
Object cleanedset is the output of this function.


