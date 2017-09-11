#CodeBook for Getting and Cleaning Data Project

##Data Source:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
##Data for the Project

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Saved in the Working Directory as folder named:

D:\Documents\R\Project Assignment Getting and Cleaning Data

###Step 1 - Merges the training and the test sets to one single set.

####Variables defined and their purpose are given below:

trainData : Holds Data fetched by - read.table("D:\Documents\R\Project Assignment Getting and Cleaning Data/train/X_train.txt")

trainLabel : Holds Data fetched by - read.table("D:\Documents\R\Project Assignment Getting and Cleaning Data/train/y_train.txt")

trainSubject: Holds Data fetched by - read.table("D:\Documents\R\Project Assignment Getting and Cleaning Data/train/subject_train.txt")

testData : Holds Data fetched by - read.table("D:\Documents\R\Project Assignment Getting and Cleaning Data/test/X_test.txt")

testLabel : Holds Data fetched by - read.table("D:\Documents\R\Project Assignment Getting and Cleaning Data/test/y_test.txt")

testSubject : Holds Data fetched by - read.table("D:\Documents\R\Project Assignment Getting and Cleaning Data/test/subject_test.txt")

features : Holds Data fetched by - read.table("D:\Documents\R\Project Assignment Getting and Cleaning Data/features.txt")

Other variables defined meanStdIndices, joinData , activity and a few to accomplish the extraction job.

Merging the data and train and subject tables using rbind() function.

Coded to perform the other steps mentioned below.

###Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 

###Step 3 - Uses descriptive activity names to name the activities in the data set

###Step 4 - Appropriately labels the data set with descriptive activity names.

The file mergedData.txt is created.

###Step 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


The file tidyDataWithMeans.txt is created.

###Output :

Files are available in the working directory - UCI-HAR-Dataset