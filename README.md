Introduction
==========================
This repository contains course project for the Coursera course "Getting and Cleaning data".

Tasks
========
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive activity names.
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.



Execution 
===========

1. Download the data source and stored it in UCI HAR Dataset/ directory.

2. Set your working directory using setwd() function in RStudio, and run run_analysis.R in the folder of UCI HAR Dataset.

3. generate a new file tiny_data.txt in your working directory

Files
=========
1. CodeBook.md describes the variables, the data, and the steps performed to clean up the data.

2. run_analysis.R is the R script.

3. tidy.csv file is created to store the clean data.
