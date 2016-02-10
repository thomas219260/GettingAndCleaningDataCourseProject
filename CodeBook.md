CodeBook.md
===========

Overview
--------
The data_summary.txt file provides summarizations of some of the measurement
data sourced from the "Human Activity Recognition Using Smartphones" Data Set
published by the UCI Machine Learning Repository.  The original UCI Data Set
represents accelerometer and gyroscope readings from smartphones worn by thirty
individuals (test subjects) while performing six activities (i.e., walking,
walking up or down stairs, sitting, standing, or lying down).  The UCI study
used Machine Learning to analyze the accelerometer and gyroscope measurements
("features") in order to predict the specific activities ("labels") being
performed by the test subjects.

The data_summary.txt file provides aggregated (i.e., grouped) average values for
each of the individual mean and standard deviation measurements in the UCI Data
Set.  The grouped average values are supplied for each unique combination of
the six activities and thirty test subjects.  Sixty-six such average values are
provided for each of the 180 combinations.

The original UCI Data Set is partitioned into separate training and test sets.
The training and test sets were combined before computing the summarizations
in this Data Set.  The README.md file in this repository discusses the steps
taken to compute these summarizations (grouped average values).  However, it
should be noted that no transformations were required to be performed on the
individual mean and standard deviation measurements in the source data.

Variables in This Data Set
--------------------------
The following table contains the name and brief description of the variables in
this data set.  As with the original UCI Data Set, each of the acceleration
variables here is measured in standard gravity 'g' units (9.80665 meters per
second squared); each of the gyroscope angular velocity variables is measured in
radians per second.

| Variable Name                                      | Description |
|----------------------------------------------------|-------------|
|activity                                            |Activity name: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING|
|subject                                             |Test subject identifier ranging from 1 to 30   |
|avgmeantimebodyaccelerationx                        |Average mean value of body acceleration X component in the time domain|
|avgmeantimebodyaccelerationy                        |Average mean value of body acceleration Y component in the time domain|
|avgmeantimebodyaccelerationz                        |Average mean value of body acceleration Z component in the time domain|
|avgstdtimebodyaccelerationx                         |Average standard deviation value of body acceleration X component in the time domain|
|avgstdtimebodyaccelerationy                         |Average standard deviation value of body acceleration Y component in the time domain|
|avgstdtimebodyaccelerationz                         |Average standard deviation value of body acceleration Z component in the time domain|
|avgmeantimegravityaccelerationx                     |Average mean value of gravity acceleration X component in the time domain|
|avgmeantimegravityaccelerationy                     |Average mean value of gravity acceleration Y component in the time domain|
|avgmeantimegravityaccelerationz                     |Average mean value of gravity acceleration Z component in the time domain|
|avgstdtimegravityaccelerationx                      |Average standard deviation value of gravity acceleration X component in the time domain|
|avgstdtimegravityaccelerationy                      |Average standard deviation value of gravity acceleration Y component in the time domain|
|avgstdtimegravityaccelerationz                      |Average standard deviation value of gravity acceleration Z component in the time domain|
|avgmeantimebodyaccelerationjerkx                    |Average mean value of body acceleration jerk signal X component in the time domain|
|avgmeantimebodyaccelerationjerky                    |Average mean value of body acceleration jerk signal Y component in the time domain|
|avgmeantimebodyaccelerationjerkz                    |Average mean value of body acceleration jerk signal Z component in the time domain|
|avgstdtimebodyaccelerationjerkx                     |Average standard deviation value of body acceleration jerk signal X component in the time domain|
|avgstdtimebodyaccelerationjerky                     |Average standard deviation value of body acceleration jerk signal Y component in the time domain|
|avgstdtimebodyaccelerationjerkz                     |Average standard deviation value of body acceleration jerk signal Z component in the time domain|
|avgmeantimebodygyroscopex                           |Average mean value of body gyroscope X component in the time domain|
|avgmeantimebodygyroscopey                           |Average mean value of body gyroscope Y component in the time domain|
|avgmeantimebodygyroscopez                           |Average mean value of body gyroscope Z component in the time domain|
|avgstdtimebodygyroscopex                            |Average standard deviation value of body gyroscope X component in the time domain|
|avgstdtimebodygyroscopey                            |Average standard deviation value of body gyroscope Y component in the time domain|
|avgstdtimebodygyroscopez                            |Average standard deviation value of body gyroscope Z component in the time domain|
|avgmeantimebodygyroscopejerkx                       |Average mean value of body gyroscope jerk signal X component in the time domain|
|avgmeantimebodygyroscopejerky                       |Average mean value of body gyroscope jerk signal Y component in the time domain|
|avgmeantimebodygyroscopejerkz                       |Average mean value of body gyroscope jerk signal Z component in the time domain|
|avgstdtimebodygyroscopejerkx                        |Average standard deviation value of body gyroscope jerk signal X component in the time domain|
|avgstdtimebodygyroscopejerky                        |Average standard deviation value of body gyroscope jerk signal Y component in the time domain|
|avgstdtimebodygyroscopejerkz                        |Average standard deviation value of body gyroscope jerk signal Z component in the time domain|
|avgmeantimebodyaccelerationmagnitude                |Average mean value of body acceleration magnitude in the time domain|
|avgstdtimebodyaccelerationmagnitude                 |Average standard deviation value of body acceleration magnitude in the time domain|
|avgmeantimegravityaccelerationmagnitude             |Average mean value of body acceleration magnitude in the gravity domain|
|avgstdtimegravityaccelerationmagnitude              |Average standard deviation value of body acceleration magnitude in the gravity domain|
|avgmeantimebodyaccelerationjerkmagnitude            |Average mean value of body acceleration jerk signal magnitude in the time domain|
|avgstdtimebodyaccelerationjerkmagnitude             |Average standard deviation value of body acceleration jerk signal magnitude in the time domain|
|avgmeantimebodygyroscopemagnitude                   |Average mean value of body gyroscope magnitude in the time domain|
|avgstdtimebodygyroscopemagnitude                    |Average standard deviation value of body gyroscope magnitude in the time domain|
|avgmeantimebodygyroscopejerkmagnitude               |Average mean value of body gyroscope jerk signal magnitude in the time domain|
|avgstdtimebodygyroscopejerkmagnitude                |Average standard deviation value of body gyroscope jerk signal magnitude in the time domain|
|avgmeanfrequencybodyaccelerationx                   |Average mean value of body acceleration X component in the frequency domain|
|avgmeanfrequencybodyaccelerationy                   |Average mean value of body acceleration Y component in the frequency domain|
|avgmeanfrequencybodyaccelerationz                   |Average mean value of body acceleration Z component in the frequency domain|
|avgstdfrequencybodyaccelerationx                    |Average standard deviation value of body acceleration X component in the frequency domain|
|avgstdfrequencybodyaccelerationy                    |Average standard deviation value of body acceleration Y component in the frequency domain|
|avgstdfrequencybodyaccelerationz                    |Average standard deviation value of body acceleration Z component in the frequency domain|
|avgmeanfrequencybodyaccelerationjerkx               |Average mean value of body acceleration jerk signal X component in the frequency domain|
|avgmeanfrequencybodyaccelerationjerky               |Average mean value of body acceleration jerk signal Y component in the frequency domain|
|avgmeanfrequencybodyaccelerationjerkz               |Average mean value of body acceleration jerk signal Z component in the frequency domain|
|avgstdfrequencybodyaccelerationjerkx                |Average standard deviation value of body acceleration jerk signal X component in the frequency domain|
|avgstdfrequencybodyaccelerationjerky                |Average standard deviation value of body acceleration jerk signal Y component in the frequency domain|
|avgstdfrequencybodyaccelerationjerkz                |Average standard deviation value of body acceleration jerk signal Z component in the frequency domain|
|avgmeanfrequencybodygyroscopex                      |Average mean value of body gyroscope X component in the frequency domain|
|avgmeanfrequencybodygyroscopey                      |Average mean value of body gyroscope Y component in the frequency domain|
|avgmeanfrequencybodygyroscopez                      |Average mean value of body gyroscope Z component in the frequency domain|
|avgstdfrequencybodygyroscopex                       |Average standard deviation value of body gyroscope X component in the frequency domain|
|avgstdfrequencybodygyroscopey                       |Average standard deviation value of body gyroscope Y component in the frequency domain|
|avgstdfrequencybodygyroscopez                       |Average standard deviation value of body gyroscope Z component in the frequency domain|
|avgmeanfrequencybodybodyaccelerationjerkmagnitude   |Average mean value of body body acceleration jerk signal X component in the frequency domain|
|avgstdfrequencybodybodyaccelerationjerkmagnitude    |Average mean value of body body acceleration jerk signal Y component in the frequency domain|
|avgmeanfrequencybodybodygyroscopemagnitude          |Average mean value of body body acceleration jerk signal Z component in the frequency domain|
|avgstdfrequencybodybodygyroscopemagnitude           |Average standard deviation value of body body acceleration jerk signal X component in the frequency domain|
|avgmeanfrequencybodybodygyroscopejerkmagnitude      |Average standard deviation value of body body acceleration jerk signal Y component in the frequency domain|
|avgstdfrequencybodybodygyroscopejerkmagnitude       |Average standard deviation value of body body acceleration jerk signal Z component in the frequency domain|

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
