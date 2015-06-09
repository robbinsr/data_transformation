tidyData
========

This repository contains a file named run_analysis.R.

Run_analysis.R is an executable script written in the R statistical language.

Run_analysis.R uses data that was collected using a personal activity device.

The tasks that are performed by run_analysis.R are:

1. Change column/feature names from 1 through 6 to Walking, Walking Up Stairs, Walking Down Stairs, Standing, Sitting, and Laying.

2. Define a function that reads data about observations, subjects attached to observations, activities attached to observations,
activities performed by subjects, and variables captured or already created.

3. Define a function that creates variable names that are more readable by a analyst.

4. Execute the getData function and pass it the appropriate files related to training a statistical model based upon the data.

5. Pass the observations, subjects by observation, and acts by observation data from temp to the appropriate data frames, which are data containers in R where R can perform actions on the data.

6. Execute the function which alters the variable names and pass it the current names.



The tidyCodeBook in xlsx and pdf form is in this repo.
This README explains my process.
The merged files are in http://github.com/robbinsr/tidyMerged.
The extracted files are in http://github.com/robbinsr/tidyExtracted.
The averaged files are in http://github.com/robbinsr/tidyAveraged.
It was necessary to use more than one repo because of GitHub's 1 GB repo size constraint.

This is the result of the project for the course "Getting and Cleaning Data." The CodeBook is in the tidyData folder. The file run_analysis.R is in the tidyData folder. The results of running the run_analysis.R file are in three seperate repos named tidyMerged, tidyExtracted, and tidyAveraged, and all of these are public and under github.com/robbinsr/.

The instructions asked us to:

##Merge the training and the test sets to create one data set.

The result of this effort is in the repo named "tidyMerged." The file run_analysis.R merges the following files ("features.txt", "activityunderscorelabels", "train/subjectunderscoretrain.txt", "train/yunderscoretrain.txt", test/subjectunderscoretest.text", "test/yunderscoretest.txt" and outputs 561 seperate files into the folder tidyMerged. Each file has three columns: one for indicating subject, one for indicating activity, and one for indicating the variable that is reported. Each file has 10,299 observations.

##Extract only the measurements on the mean and standard deviation for each measurement.

The result of this effort is in the repo named "tidyExtracted." The file run_analysis.R takes the merged files, filters for files that include the name "Mean" or "StdDev" and then places those files into the folder named tidyExtracted. 

##Use descriptive activity names to name the activities in the data set.

The result of this effort is in the file named "tidyVariableNames" in this repo. The file run_analysis.R converts the names of the features provided in the semi-raw data to names that focus on the type of measurement as opposed to what the earlier analysts had done, which is focus on the measurement tool. Further, words were changed as necessary so that an English speaking person would be able to understand the type of measurement easily. Finally, punctuation marks that were previously embedded in the feature names were removed in the variable names.

##Label appropriately the data set with descriptive activity names.

Each file is named using one of the tidy variable names. This is within the run_analysis.R file.

##Create a second tidy data set with the average of each variable for each activity and each subject.

The result of this effort is in the tidyAveraged folder. This is within the run_analysis.R file.

********

##The algorithm that was followed to transform the data was the following.

1. Merge the two observation files. These were named "X_train.txt" and "X_test.txt" This led to an observations file that contained 561 columns and 10,299 observations. Each file was in its own directory, namely, train, and test.

2. Merge the two files that indicated the subject id affiliated with each of the 10,299 observations. These were named "y_train.txt" and "y_test.txt." Each file was in its own directory, namely, train, and test.

3. Merge the two files that indicated the activity id affiliated with each of the 10,299 observations. These were named "subject_train.txt" but were in two different directories, namely, train, and test.

4. Decode the activity ids by using the activity_labels.txt file.

5. Transform the cryptic feature names to more understandable variable names.

6. Attach a column to the beginning of the observations file which indicated an activity for each observation.

7. Attach a column to the beginning of the observations file which indicated a subject for each observation.

8. Slice the new observations file into 561 files, one for each variable, and place these into the tidyMerged folder/repo.

9. Filter the tidyMerged files so that only those files that report means or standard deviations remain, and place these in the tidyExtracted folder/repo.

10. Compute the mean of any variable, by subject id and activity, and place this in a new set of 561 files and place thse in the tidyAveraged folder/repo.


