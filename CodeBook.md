Introduction
=================

This file describes the data, the variables, and the steps performed to clean the data.


The data source
=============

    Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
    Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The dataset files
===============

    'features_info.txt': Shows information about the variables used on the feature vector.
    'features.txt': List of all features.
    'activity_labels.txt': Links the class labels with their activity name.
    'train/X_train.txt': Training set.
    'train/y_train.txt': Training labels.
    'test/X_test.txt': Test set.
    'test/y_test.txt': Test labels.
    'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
    'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
    'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
    'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Transformation
=============



Implementation
==============

    Require data.table librareis.
    Load both test and train data
    Load the features and activity labels.
    Merge data set.
    Extract the mean and standard deviation column.
    Process the data and store it in tidy.txt.
    