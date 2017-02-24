
library(dplyr)
library(plyr)
activitylabels<-read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE) #labels of 
#activities 1-6
features<-read.table("./UCI HAR Dataset/features.txt", header = FALSE) #features calculated (561x2)
namesfeatures<-sapply(features[[2]],toString)

#training data
subjecttrain<-read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE) #subjects (7352x1)
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)#training labels (7352x1)
xtrain<-read.table("./UCI HAR Dataset/train/x_train.txt", header = FALSE)#training set (7352x561)
traindata<-cbind("train",activitylabels[ytrain[,1],2], subjecttrain, xtrain) #this table 
#contains for each row one measurement, a column "train", the training label, the subject of
#the measurement and all the calculated features (7352x564)
names(traindata)<-c("train/test", "activity", "subject", namesfeatures)


#tests data
subjecttest<-read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)#test subjects (2947x1)
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)#test labels (2947x1)
xtest<-read.table("./UCI HAR Dataset/test/x_test.txt", header = FALSE)#test sets (2947x561)
testdata<-cbind("test",activitylabels[ytest[,1],2], subjecttest, xtest) #this table contains
#for each row one measurement, a column "train", the training label, the subject of 
#the measurement and all the calculated features
names(testdata)<-c("train/test", "activity", "subject", namesfeatures)

#======================================================================================#

totaldata<-rbind(traindata, testdata) #one data set merging train and test results (10299x564)
meanvaluecolumns<-grep("*mean[()]",names(totaldata)) #positions of the mean values
standardevcolumns<-grep("*std[()]",names(totaldata)) #positions of the standard deviations
meanandstandarvalues<-totaldata[c(meanvaluecolumns,standardevcolumns)] #select only the two
#sets of columns found for mean and std. Extracts only the measurements on the mean and 
#standard deviation for each measurement.

#======================================================================================#

totalsplitsubact<-split(totaldata, list(totaldata$subject,totaldata$activity)) #this is the
#initial table "totaldata" which has been split by two paramenters: subject and activity.


partmeans<-matrix(0, ncol=561, nrow= length(totalsplitsubact)) #This vector will contain the mean values of each
#variable for each subject-activity couple
partnames<-matrix(0, ncol=2, nrow=length(totalsplitsubact)) #This vector contains the information of subject and
#activity

#calculate the mean (partmeans) of all the variables for every couple subject-activity (partnames)
for (i in 1:length(totalsplitsubact)){
        partmeans[i,]<-(sapply(totalsplitsubact[[i]][4:564], mean))
        partnames[i,]<-c(totalsplitsubact[[i]][1,3],totalsplitsubact[[i]][1,2])
}

tablemeansorderedbysubject<-as.data.frame(cbind(partnames,partmeans)) #final table with: subject (column 1), activity
#(column 2) and mean value of the variables (columns 3-564)
names(tablemeansorderedbysubject)<-c("subject", "activity", namesfeatures)

write.table(tablemeansorderedbysubject, "./resultpart5.txt", row.names = FALSE) 
