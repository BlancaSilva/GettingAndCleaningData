# GettingAndCleaningData
peer-graded assignment

This code allows the analysis of the data set obtained at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

First the data must be downloaded and unziped in the working directory. Then we must run the code, that will first read all the data (train and test), unify in a single table, select only the mean values and the standard deviation and calculate the mean values of the variables based on subject and activity.

The code will need the libraries plyr and dplyr. 
