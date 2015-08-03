tidyData
========

This repository contains raw data that was collected from thirty individuals whose physical actions were measured by a particular type of mobile phone. This repository also contains a program (run_analysis.R) that integrates, organizes, and summarizes the raw data. The purpose for making the data "tidy" is to make the data more understandable. This repository contains a codebook (tidyCodeBook.xls, tidyCodeBook.pdf) that explains variable names. 

The algorithm performed in run_analysis.R is described below.

1. Merge the two observation files. These were named "X_train.txt" and "X_test.txt" This led to an observations file that contained 561 columns and 10,299 observations. Each file was in its own directory, namely, train, and test.

2. Change column/feature names from 1 through 6 to Walking, Walking Up Stairs, Walking Down Stairs, Standing, Sitting, and Laying.

3. Define a function that reads data about observations, subjects attached to observations, activities attached to observations,
activities performed by subjects, and variables captured or already created.

4. Define a function that creates variable names that are more readable by a analyst.

5. Execute the getData function and pass it the appropriate files related to training a statistical model based upon the data.

6. Pass the observations, subjects by observation, and acts by observation data from temp to the appropriate data frames, which are data containers in R where R can perform actions on the data.

7. Execute the function which alters the variable names and pass it the current names.

8. Merge the two files that indicated the subject id affiliated with each of the 10,299 observations. These were named "y_train.txt" and "y_test.txt." Each file was in its own directory, namely, train, and test.

9. Merge the two files that indicated the activity id affiliated with each of the 10,299 observations. These were named "subject_train.txt" but were in two different directories, namely, train, and test.

10. Decode the activity ids by using the activity_labels.txt file.

11. Transform the cryptic feature names to more understandable variable names.

12. Attach a column to the beginning of the observations file which indicated an activity for each observation.

13. Attach a column to the beginning of the observations file which indicated a subject for each observation.

14. Slice the new observations file into 561 files, one for each variable, and place these into the tidyMerged folder/repo.

15. Filter the tidyMerged files so that only those files that report means or standard deviations remain, and place these in the tidyExtracted folder/repo.

16. Compute the mean of any variable, by subject id and activity, and place this in a new set of 561 files and place these in the tidyAveraged folder/repo.

