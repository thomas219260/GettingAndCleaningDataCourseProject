# GettingAndCleaningDataCourseProject

Overview
--------
This repository provides an R script to create an output Data Set that provides
summarizations of some of the measurement data sourced from the "Human Activity
Recognition Using Smartphones" Data Set published by the UCI Machine Learning
Repository.  The original UCI Data Set
represents accelerometer and gyroscope readings from smartphones worn by thirty
individuals (test subjects) while performing six activities (i.e., walking,
walking up or down stairs, sitting, standing, or lying down).  The UCI study
used Machine Learning to analyze the accelerometer and gyroscope measurements
("features") in order to predict the specific activities ("labels") being
performed by the test subjects.  The summarizations in the output Data Set
provides average values (grouped by combinations of activity and test subject)
for each of the individual mean and standard deviation measurements in the UCI
Data Set.

This document provides an overview of the repository contents and a description
of the workings of the R script.

Repository Contents
-------------------
The following table identifies each of the files contained in this repository,
together with a short description of its purpose.

| File Name      | Description                                                                                          |
|----------------|------------------------------------------------------------------------------------------------------|
|README.md       | This file.                                                                                           |
|CodeBook.md     | Identifies and describes the variables in the data_summary.txt file                                  |
|run_analysis.R  | R Script that downloads and processes the original UCI Data Set and creates the data_summary.txt file|
|data_summary.txt| Output file (Data Set) from run_analysis.R script                                                    |

Workings of the R Script
------------------------
The R script (run_analysis.R) begins by downloading and unzipping the original
UCI Data Set (please see the references below) into the current working
directory.  The table below identifies the files from the newly-created 
"UCI HAR Dataset" directory which are required by the R script.  Note that the
original UCI Data Set is partitioned into separate training and test sets.

| File Name      | Description                                                                                          |
|----------------|------------------------------------------------------------------------------------------------------|
| features.txt            | 561 feature variable names: tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, etc.   |
| activity_labels.txt     | 6 activity labels (values 1 to 6) corresponding to WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING|
| train/X_train.txt       | Training data providing 7352 observations of 561 feature variables|
| train/y_train.txt       | Training data providing the activity labels corresponding to each observation in X_train.txt.  This file provides 7352 observations of the single variable.|
| train/subject_train.txt | Training data providing the test subject (values 1 to 30) corresponding to each observation in X_train.txt.  This file provides 7352 observations of the single variable.|
| test/X_test.txt         | Test data providing 2947 observations of 561 feature variables|
| test/y_test.txt         | Test data providing the activity labels corresponding to each observation in X_test.txt.  This file provides 2947 observations of the single variable.|
| test/subject_test.txt   | Test data providing the test subject (values 1 to 30) corresponding to each observation in X_test.txt.  This file provides 2947 observations of the single variable.|

After downloading and unzipping the source data, the R script then reads the
feature variable names and activity labels from the corresponding files, storing
the results into appropriately named data frames.  Next,
the script loads the training and test data: X (features), y (activity labels),
and the test subject identifiers, again placing the results into data frames.

As noted, the source data is partitioned into separate training and test sets.
The individual files in the train and test directories have a one-to-one
correspondence, with identical structures and layouts.  This makes sense, as
the training and test data represents a 70/30 split of the total experiment
data.  Splitting the data in this manner is consistent with Machine Learning
practices.  Later, however, the R script will recombine the data.

None of the files in the train or test directories contain a header row
providing column names.  When reading the two y
(activity labels) files and two test subject files, simple "made-up" column
names are used.
When reading the two X (features) files, the values previously read
from features.txt provide the required column names.  One minor complication
arises here, since none of the features values constitute syntactically
valid column names, due to the presence of parentheses and hyphens.
R handles this implicitly by converting each of the illegal characters to dots
(e.g., "tBodyAcc-mean()-X" becomes "tBodyAcc-mean...X").

Next, the script column binds each of the three "training" data frames and
each of the "test" data frames, storing the results into two intermediate
data frames.  In effect, the activity label and test subject
columns are "tacked on" to the features (measurement observations).  Finally,
the script row binds the two intermediate data frames into a single data frame,
thus combining all of the training and test data.

Next, the script subsets the columns corresponding to the mean and standard
deviation measurements (as well as the activity label and test subject).  At
this point, it renames the columns to provide more "appropriate" and
"descriptive" names.  Column naming is discussed in more detail in the
CodeBook.md file in this repository.

In the next set of steps, the data is merged with the data frame sourced from
the activity_labels.txt file, providing the descriptive activity names (e.g.,
WALKING) in place of the activity label values of 1 to 6.  Finally, the data
frame is grouped by activity and test subject, creating a grouped data frame.

In the final steps, the grouped data frame is summarized,
in order to compute the average value of each mean
and standard deviation feature for each combination of activity and test
subject.  The summary output is then written to the data_summary.txt file.

Dependencies
------------
The R script requires use of the dplyr library, making use of its rename,
select, group_by, and summarize functions.

References
----------
The UCI Machine Learning Repository study page may be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original UCI Data Set (providing the source data for the summarizations) may
be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Attribution
-----------
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.