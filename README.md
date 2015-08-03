tidyData
========

This repository contains raw data that was collected from six individuals whose physical actions were measured by a particular type of mobile phone. This repository also contains a program (run_analysis.R) that integrates, organizes, and summarizes the raw data. The purpose for making the data "tidy" is to make the data more understandable. This repository contains a codebook (tidyCodeBook.xls, tidyCodeBook.pdf) that explains variable names. 

The algorithm performed in run_analysis.R is described below.

* Merge the two observation files. These were named "X_train.txt" and "X_test.txt" This led to an observations file that contained 561 columns and 10,299 observations. Each file was in its own directory, namely, train, and test.

* Change column/feature names from 1 through 6 to Walking, Walking Up Stairs, Walking Down Stairs, Standing, Sitting, and Laying.

* Define a function that reads data about observations, subjects attached to observations, activities attached to observations,
activities performed by subjects, and variables captured or already created.

* Define a function that creates variable names that are more readable by a analyst.

* Execute the getData function and pass it the appropriate files related to training a statistical model based upon the data.

*  Pass the observations, subjects by observation, and acts by observation data from temp to the appropriate data frames, which are data containers in R where R can perform actions on the data.

Execute the function which alters the variable names and pass it the current names.

Merge the two files that indicated the subject id affiliated with each of the 10,299 observations. These were named "y_train.txt" and "y_test.txt." Each file was in its own directory, namely, train, and test.

Merge the two files that indicated the activity id affiliated with each of the 10,299 observations. These were named "subject_train.txt" but were in two different directories, namely, train, and test.

Decode the activity ids by using the activity_labels.txt file.

Transform the cryptic feature names to more understandable variable names.

Attach a column to the beginning of the observations file which indicated an activity for each observation.

Attach a column to the beginning of the observations file which indicated a subject for each observation.

Slice the new observations file into 561 files, one for each variable, and place these into the tidyMerged folder/repo.

Filter the tidyMerged files so that only those files that report means or standard deviations remain, and place these in the tidyExtracted folder/repo.

Compute the mean of any variable, by subject id and activity, and place this in a new set of 561 files and place these in the tidyAveraged folder/repo.

The tidyCodeBook in xlsx and pdf form is in this repo.

This README explains my process.

