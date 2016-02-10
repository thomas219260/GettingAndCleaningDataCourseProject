# Coursera "Getting and Cleaning Data" Course Project
# Author: Thomas Wirtz
# Date: 2016/02/10

# Download and unzip the UCI Machine Learning Repository project data...
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- "./getdata-projectfiles-UCI HAR Dataset.zip"
download.file(fileUrl, destFile, method = "curl")
unzip(destFile)
remove(destFile)
remove(fileUrl)

# Go to the newly-created data directory...
setwd("./UCI HAR Dataset")

# Load the feature and activity label names...
cols = c("index", "name")
featuresData <-
  read.table("./features.txt", header = FALSE,
             col.names = cols, stringsAsFactors = FALSE)

cols = c("activityindex", "activityname")
activitiesData <-
  read.table("./activity_labels.txt", header = FALSE, col.names = cols)


# Load the training and test data: X (features), y (activity indexes), and
# the subject indexes...
cols = featuresData$name
trainingXData <-
  read.table("./train/X_train.txt", header = FALSE, col.names = cols)
testXData <-
  read.table("./test/X_test.txt", header = FALSE, col.names = cols)
remove(featuresData)

cols = c("activityindex")
trainingYData <-
  read.table("./train/y_train.txt", header = FALSE, col.names = cols)
testYData <-
  read.table("./test/y_test.txt", header = FALSE, col.names = cols)

cols = c("subjectindex")
trainingSubjectData <-
  read.table("./train/subject_train.txt", header = FALSE, col.names = cols)
testSubjectData <-
  read.table("./test/subject_test.txt", header = FALSE, col.names = cols)

# Cleanup and go back to the previous directory...
remove(cols)
setwd("..")

# Combine (column bind) the subject indexes, y (activity indexes), and
# X (features) for each of the training and test data frames...
trainingData <- cbind(trainingYData, trainingSubjectData, trainingXData)
testData <- cbind(testYData, testSubjectData, testXData)

# Cleanup...
remove(trainingXData); remove(testXData)
remove(trainingYData); remove(testYData);
remove(trainingSubjectData); remove(testSubjectData)

# Combine (row bind) the training and test data frames...
data <- rbind(trainingData, testData)
remove(trainingData); remove(testData)


# Note that the featuresData$name values contain syntactically invalid forms of
# the feature names (e.g., "tBodyAcc.mean()-X").  An implicit conversion was
# performed when using these values as data frame column names, in which
# parentheses and hyphens were converted to dots (e.g., "tBodyAcc.mean...X").
# To see an explicit conversion/validation, use: make.names(featuresData$name)

# Subset the columns corresponding to mean and standard deviation measurements.
# Here, I want column names corresponding to features whose names contain
# "mean()" or "std()", so I must grep for "mean.." or "std..".
data <- 
  data[, grep("activityindex|subjectindex|mean\\.\\.|std\\.\\.", names(data))]


# Rename the columns using "appropriate" and "descriptive" names...
library(dplyr)
data <-
  rename(data,
         meantimebodyaccelerationx = tBodyAcc.mean...X,
         meantimebodyaccelerationy = tBodyAcc.mean...Y,
         meantimebodyaccelerationz = tBodyAcc.mean...Z,
         stdtimebodyaccelerationx = tBodyAcc.std...X,
         stdtimebodyaccelerationy = tBodyAcc.std...Y,
         stdtimebodyaccelerationz = tBodyAcc.std...Z,
         meantimegravityaccelerationx = tGravityAcc.mean...X,
         meantimegravityaccelerationy = tGravityAcc.mean...Y,
         meantimegravityaccelerationz = tGravityAcc.mean...Z,
         stdtimegravityaccelerationx = tGravityAcc.std...X,
         stdtimegravityaccelerationy = tGravityAcc.std...Y,
         stdtimegravityaccelerationz = tGravityAcc.std...Z,
         meantimebodyaccelerationjerkx = tBodyAccJerk.mean...X,
         meantimebodyaccelerationjerky = tBodyAccJerk.mean...Y,
         meantimebodyaccelerationjerkz = tBodyAccJerk.mean...Z,
         stdtimebodyaccelerationjerkx = tBodyAccJerk.std...X,
         stdtimebodyaccelerationjerky = tBodyAccJerk.std...Y,
         stdtimebodyaccelerationjerkz = tBodyAccJerk.std...Z,
         meantimebodygyroscopex = tBodyGyro.mean...X,
         meantimebodygyroscopey = tBodyGyro.mean...Y,
         meantimebodygyroscopez = tBodyGyro.mean...Z,
         stdtimebodygyroscopex = tBodyGyro.std...X,
         stdtimebodygyroscopey = tBodyGyro.std...Y,
         stdtimebodygyroscopez = tBodyGyro.std...Z,
         meantimebodygyroscopejerkx = tBodyGyroJerk.mean...X,
         meantimebodygyroscopejerky = tBodyGyroJerk.mean...Y,
         meantimebodygyroscopejerkz = tBodyGyroJerk.mean...Z,
         stdtimebodygyroscopejerkx = tBodyGyroJerk.std...X,
         stdtimebodygyroscopejerky = tBodyGyroJerk.std...Y,
         stdtimebodygyroscopejerkz = tBodyGyroJerk.std...Z,
         meantimebodyaccelerationmagnitude = tBodyAccMag.mean..,
         stdtimebodyaccelerationmagnitude = tBodyAccMag.std..,
         meantimegravityaccelerationmagnitude = tGravityAccMag.mean..,
         stdtimegravityaccelerationmagnitude = tGravityAccMag.std..,
         meantimebodyaccelerationjerkmagnitude = tBodyAccJerkMag.mean..,
         stdtimebodyaccelerationjerkmagnitude = tBodyAccJerkMag.std..,
         meantimebodygyroscopemagnitude = tBodyGyroMag.mean..,
         stdtimebodygyroscopemagnitude = tBodyGyroMag.std..,
         meantimebodygyroscopejerkmagnitude = tBodyGyroJerkMag.mean..,
         stdtimebodygyroscopejerkmagnitude = tBodyGyroJerkMag.std..,
         meanfrequencybodyaccelerationx = fBodyAcc.mean...X,
         meanfrequencybodyaccelerationy = fBodyAcc.mean...Y,
         meanfrequencybodyaccelerationz = fBodyAcc.mean...Z,
         stdfrequencybodyaccelerationx = fBodyAcc.std...X,
         stdfrequencybodyaccelerationy = fBodyAcc.std...Y,
         stdfrequencybodyaccelerationz = fBodyAcc.std...Z,
         meanfrequencybodyaccelerationjerkx = fBodyAccJerk.mean...X,
         meanfrequencybodyaccelerationjerky = fBodyAccJerk.mean...Y,
         meanfrequencybodyaccelerationjerkz = fBodyAccJerk.mean...Z,
         stdfrequencybodyaccelerationjerkx = fBodyAccJerk.std...X,
         stdfrequencybodyaccelerationjerky = fBodyAccJerk.std...Y,
         stdfrequencybodyaccelerationjerkz = fBodyAccJerk.std...Z,
         meanfrequencybodygyroscopex = fBodyGyro.mean...X,
         meanfrequencybodygyroscopey = fBodyGyro.mean...Y,
         meanfrequencybodygyroscopez = fBodyGyro.mean...Z,
         stdfrequencybodygyroscopex = fBodyGyro.std...X,
         stdfrequencybodygyroscopey = fBodyGyro.std...Y,
         stdfrequencybodygyroscopez = fBodyGyro.std...Z,
         meanfrequencybodyaccelerationmagnitude = fBodyAccMag.mean..,
         stdfrequencybodyaccelerationmagnitude = fBodyAccMag.std..,
         meanfrequencybodybodyaccelerationjerkmagnitude = fBodyBodyAccJerkMag.mean..,
         stdfrequencybodybodyaccelerationjerkmagnitude = fBodyBodyAccJerkMag.std..,
         meanfrequencybodybodygyroscopemagnitude = fBodyBodyGyroMag.mean..,
         stdfrequencybodybodygyroscopemagnitude = fBodyBodyGyroMag.std..,
         meanfrequencybodybodygyroscopejerkmagnitude = fBodyBodyGyroJerkMag.mean..,
         stdfrequencybodybodygyroscopejerkmagnitude = fBodyBodyGyroJerkMag.std..)

# Join with the activitiesData by activityindex to pick up the activityname
# factor variable (e.g., WALKING, WALKING_UPSTAIRS, etc.)...
data <-
  merge(data, activitiesData, by.x = "activityindex", by.y = "activityindex")
remove(activitiesData)

# Select, rename, and reorder the columns.  Here we drop (omit) the
# activityindex column, and put the 
data <-
  select(data, activity = activityname, subject = subjectindex,
         meantimebodyaccelerationx:stdfrequencybodybodygyroscopejerkmagnitude)

# Finally, group by activity and subject, in preparation for the summary step
# below...
data <- group_by(data, activity, subject)

# Summarize by activity and subject, computing the average of each variable for
# each activity/subject group...
data_summary <-
  summarize(data,
            avgmeantimebodyaccelerationx = mean(meantimebodyaccelerationx),
            avgmeantimebodyaccelerationy = mean(meantimebodyaccelerationy),
            avgmeantimebodyaccelerationz = mean(meantimebodyaccelerationz),
            avgstdtimebodyaccelerationx = mean(stdtimebodyaccelerationx),
            avgstdtimebodyaccelerationy = mean(stdtimebodyaccelerationy),
            avgstdtimebodyaccelerationz = mean(stdtimebodyaccelerationz),
            avgmeantimegravityaccelerationx = mean(meantimegravityaccelerationx),
            avgmeantimegravityaccelerationy = mean(meantimegravityaccelerationy),
            avgmeantimegravityaccelerationz = mean(meantimegravityaccelerationz),
            avgstdtimegravityaccelerationx = mean(stdtimegravityaccelerationx),
            avgstdtimegravityaccelerationy = mean(stdtimegravityaccelerationy),
            avgstdtimegravityaccelerationz = mean(stdtimegravityaccelerationz),
            avgmeantimebodyaccelerationjerkx = mean(meantimebodyaccelerationjerkx),
            avgmeantimebodyaccelerationjerky = mean(meantimebodyaccelerationjerky),
            avgmeantimebodyaccelerationjerkz = mean(meantimebodyaccelerationjerkz),
            avgstdtimebodyaccelerationjerkx = mean(stdtimebodyaccelerationjerkx),
            avgstdtimebodyaccelerationjerky = mean(stdtimebodyaccelerationjerky),
            avgstdtimebodyaccelerationjerkz = mean(stdtimebodyaccelerationjerkz),
            avgmeantimebodygyroscopex = mean(meantimebodygyroscopex),
            avgmeantimebodygyroscopey = mean(meantimebodygyroscopey),
            avgmeantimebodygyroscopez = mean(meantimebodygyroscopez),
            avgstdtimebodygyroscopex = mean(stdtimebodygyroscopex),
            avgstdtimebodygyroscopey = mean(stdtimebodygyroscopey),
            avgstdtimebodygyroscopez = mean(stdtimebodygyroscopez),
            avgmeantimebodygyroscopejerkx = mean(meantimebodygyroscopejerkx),
            avgmeantimebodygyroscopejerky = mean(meantimebodygyroscopejerky),
            avgmeantimebodygyroscopejerkz = mean(meantimebodygyroscopejerkz),
            avgstdtimebodygyroscopejerkx = mean(stdtimebodygyroscopejerkx),
            avgstdtimebodygyroscopejerky = mean(stdtimebodygyroscopejerky),
            avgstdtimebodygyroscopejerkz = mean(stdtimebodygyroscopejerkz),
            avgmeantimebodyaccelerationmagnitude = mean(meantimebodyaccelerationmagnitude),
            avgstdtimebodyaccelerationmagnitude = mean(stdtimebodyaccelerationmagnitude),
            avgmeantimegravityaccelerationmagnitude = mean(meantimegravityaccelerationmagnitude),
            avgstdtimegravityaccelerationmagnitude = mean(stdtimegravityaccelerationmagnitude),
            avgmeantimebodyaccelerationjerkmagnitude = mean(meantimebodyaccelerationjerkmagnitude),
            avgstdtimebodyaccelerationjerkmagnitude = mean(stdtimebodyaccelerationjerkmagnitude),
            avgmeantimebodygyroscopemagnitude = mean(meantimebodygyroscopemagnitude),
            avgstdtimebodygyroscopemagnitude = mean(stdtimebodygyroscopemagnitude),
            avgmeantimebodygyroscopejerkmagnitude = mean(meantimebodygyroscopejerkmagnitude),
            avgstdtimebodygyroscopejerkmagnitude = mean(stdtimebodygyroscopejerkmagnitude),
            avgmeanfrequencybodyaccelerationx = mean(meanfrequencybodyaccelerationx),
            avgmeanfrequencybodyaccelerationy = mean(meanfrequencybodyaccelerationy),
            avgmeanfrequencybodyaccelerationz = mean(meanfrequencybodyaccelerationz),
            avgstdfrequencybodyaccelerationx = mean(stdfrequencybodyaccelerationx),
            avgstdfrequencybodyaccelerationy = mean(stdfrequencybodyaccelerationy),
            avgstdfrequencybodyaccelerationz = mean(stdfrequencybodyaccelerationz),
            avgmeanfrequencybodyaccelerationjerkx = mean(meanfrequencybodyaccelerationjerkx),
            avgmeanfrequencybodyaccelerationjerky = mean(meanfrequencybodyaccelerationjerky),
            avgmeanfrequencybodyaccelerationjerkz = mean(meanfrequencybodyaccelerationjerkz),
            avgstdfrequencybodyaccelerationjerkx = mean(stdfrequencybodyaccelerationjerkx),
            avgstdfrequencybodyaccelerationjerky = mean(stdfrequencybodyaccelerationjerky),
            avgstdfrequencybodyaccelerationjerkz = mean(stdfrequencybodyaccelerationjerkz),
            avgmeanfrequencybodygyroscopex = mean(meanfrequencybodygyroscopex),
            avgmeanfrequencybodygyroscopey = mean(meanfrequencybodygyroscopey),
            avgmeanfrequencybodygyroscopez = mean(meanfrequencybodygyroscopez),
            avgstdfrequencybodygyroscopex = mean(stdfrequencybodygyroscopex),
            avgstdfrequencybodygyroscopey = mean(stdfrequencybodygyroscopey),
            avgstdfrequencybodygyroscopez = mean(stdfrequencybodygyroscopez),
            avgmeanfrequencybodyaccelerationmagnitude = mean(meanfrequencybodyaccelerationmagnitude),
            avgstdfrequencybodyaccelerationmagnitude = mean(stdfrequencybodyaccelerationmagnitude),
            avgmeanfrequencybodybodyaccelerationjerkmagnitude = mean(meanfrequencybodybodyaccelerationjerkmagnitude),
            avgstdfrequencybodybodyaccelerationjerkmagnitude = mean(stdfrequencybodybodyaccelerationjerkmagnitude),
            avgmeanfrequencybodybodygyroscopemagnitude = mean(meanfrequencybodybodygyroscopemagnitude),
            avgstdfrequencybodybodygyroscopemagnitude = mean(stdfrequencybodybodygyroscopemagnitude),
            avgmeanfrequencybodybodygyroscopejerkmagnitude = mean(meanfrequencybodybodygyroscopejerkmagnitude),
            avgstdfrequencybodybodygyroscopejerkmagnitude = mean(stdfrequencybodybodygyroscopejerkmagnitude))


# Write the tidy, summarized data to a file for later analysis...
write.table(data_summary, file = "./data_summary.txt", row.names = FALSE)
