# GettingAndCleaningData
peer-graded assignment

This code consists on 3 main parts: getting the data, cleaning and unifiying and a final analysis for the last part of the assignment ("create tidy data set with the average of each variable for each activity and each subject.")

Our wd must be set for the file that contains the downloaded unziped file (UCI HAR Dataset)

The code will first import the libraries dplyr and plyr, which are useful when working with data frames. It first imports two sets of data from the main file (UCI HAR Dataset)

-activitylabels : labels the activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) from 1 to 6
-features : contains all the variables calculated assigning them a number, giving a total of 2 columns and 561 rows, where the first column is the code and the second the name of the variable
-namesfeatures : transforms the elements of the second column of "features" (ie. the variables) into strings, which will be used for the names on the tables

Now it imports the data of the training fiile:

-subjectrain : a data frame of 7352 elements, each corresponding to a different training. The elements are the codes of the subject (1 to 30) who performed the training
-ytrain : a data frame like subjecttrain but in this case each term corresponds to the activity (1 to 6)
-xtrain : a data frame with 7352 rows (one for each training) and 561 columns (one for each of the variables calculated in the training)
-traindata : a data frame with 7352 rows (one for each training) and 564 columns: the first one specifies that it's a training (trains/test = "train"), the second one is the activity of the training, the third is the subject who performed the training and the remaining columns are the calculated variables

Now we do the same with the test:

-subjectest : a dafa frame of 2947 elements, each corresponding to a different test. The elements are the codes of the subject (1 to 30) who performed the training
-ytest : a data frame like subjecttrain but in this case each term corresponds to the activity (1 to 6)
-xtest : a data frame with 2947 rows (one for each test) and 561 columns (one for each of the variables calculated in the test)
-testdata : a data frame with 2947 rows (one for each test) and 564 columns: the first one specifies that it's a test (train/test = "test"), the second one is the activity of the test, the third is the subject who performed the test and the remaining columns are the calculated variables

Lines 16 and 26 set the names of both traindata and testdata to : "train/test", "activity", "subject" and the 561 names of the variables

-totaldata : this data frame contrains the values of traindata and testdata. Given that they have the same names, they have been binded by rows, giving a final data frame of 10299 rows (for all the trainings and tests) and 564 columns ( "train/test", "activity", "subject"and the 561 variables). This is the data set merging trainn and test results (part 1 of the assignment).

The next lines are for selecting only the variables corresponding to mean and standard deviation values:

-meanvaluecolumns : contains the positions of all the variables with the text "mean()" in the name (which is defined as the mean values in the readme file of the data)
-standardevcolumns : contrains the positions of all the variables with the text "std()", corresponding to standard deviation variables
-meanandstandarvalues : data frame containing only the variables of mean values and standard deviations for each measurement (part 2 of the assignment). It takes only the columns of meanvaluecolumns and standardevcolumns from the totaldata data frame.
-totalfiltereddata : Contains a column for subject, one for activity and all the ones of meanandstandarvalues

The last part of the code is the one of step 5 of the assignment. The first step will be to split the data by subject and activity:

-totalsplitsubact: splits the totalfiltereddata data frame based on subject and activity. This returs a data frame which, for each couple (subject,activity), returns the  "train/test", "activity", "subject" and the 66 names of the variables.

We create two new variables: partmeans and partnames. The first one will contain the mean values of all the variables for each couple, the second one will contain the information of the couple (subject, activity)

The next lines are a for loop in which the mean values of each column of variables are calculated and substituted into partmeans and the values of subject and activity are extraced and substituted into partnames.

Finally, we bind partnames and partmeans to obtain tablemeansorderedbysubject

-tablemeansorderedbysubject : this is the table of part 5 of the assignment, which contains 180 rows, one for each combination (subject, activity). There are 68 columns: "subject", "activity" and the mean values of the 66 variable. These names are assigned to the columns by means of the names() command.








