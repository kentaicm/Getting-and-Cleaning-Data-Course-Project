#setwd to set workspace to the file that I downloaded. To test out the script, please make the downloaded folder as the WD.

setwd("D:/Documents/R/Project Assignment Getting and Cleaning Data")

#Merges the training and the test sets to a single data set.

trainData <- read.table("D:/Documents/R/Project Assignment Getting and Cleaning Data/train/X_train.txt")
trainLabel <- read.table("D:/Documents/R/Project Assignment Getting and Cleaning Data/train/y_train.txt")
trainSubject <- read.table("D:/Documents/R/Project Assignment Getting and Cleaning Data/train/subject_train.txt")
table(trainLabel)
testData <- read.table("D:/Documents/R/Project Assignment Getting and Cleaning Data/test/X_test.txt")
testLabel <- read.table("D:/Documents/R/Project Assignment Getting and Cleaning Data/test/y_test.txt") 
table(testLabel) 
testSubject <- read.table("D:/Documents/R/Project Assignment Getting and Cleaning Data/test/subject_test.txt")
joinData <- rbind(trainData, testData)
joinLabel <- rbind(trainLabel, testLabel)
joinSubject <- rbind(trainSubject, testSubject)


#2. Extracts only the mean and standard deviation for each measurement. 

features <- read.table("D:/Documents/R/Project Assignment Getting and Cleaning Data/features.txt")

meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])

#Test content of meanStdIndices of meanStdIndices.

length(meanStdIndices) 
joinData <- joinData[, meanStdIndices]
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove "()"
names(joinData) <- gsub("mean", "Mean", names(joinData)) # capitalize M
names(joinData) <- gsub("std", "Std", names(joinData)) # capitalize S
names(joinData) <- gsub("-", "", names(joinData)) # remove "-" in column names 

#3. Use the descriptive activity names to label the activities in the data set

activity <- read.table("D:/Documents/R/Project Assignment Getting and Cleaning Data/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"

#4. Labels the data set. 

names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, joinData)

# write out the Merged dataset in a table under a mergedData.txt
write.table(cleanedData, "mergedData.txt") 

#5. Creates an independent tidy data set with the average of each variable for each activity and each subject. 

subjectLen <- length(table(joinSubject)) # 30
activityLen <- dim(activity)[1] # 6
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
        for(j in 1:activityLen) {
                result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
                result[row, 2] <- activity[j, 2]
                bool1 <- i == cleanedData$subject
                bool2 <- activity[j, 2] == cleanedData$activity
                result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
                row <- row + 1
        }
}

#Test output
head(result)

# write out the Tidy Dataset file.
write.table(result, "tidy.txt", row.name=FALSE) 
