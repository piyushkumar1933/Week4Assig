# Codebook
This is the final assignment in Week 4 of the course "Getting and Cleaning Data", in the "Data Science" Specialization, by Juan Pablo Loaiza Ramírez

## Files is this repository
* **README.md**: Describe how the script work.
* **CodeBook.md**: Codebook describing the variables.
* **run_analysis.R**: R code with the script.

## Libraries used
* $library(plyr)$
* $library(dplyr)$

## Variables used
* x_test: Test set. Taken from _"./UCI HAR Dataset/test/X_test.txt"_
* y_test: Test labels. Taken from _"./UCI HAR Dataset/test/y_test.txt"_
* subject_test: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. Taken from _"./UCI HAR Dataset/test/subject_test.txt"_
* x_train: Train set. Taken from _"./UCI HAR Dataset/train/X_train.txt"_
* y_train: Train labels. Taken from _"./UCI HAR Dataset/train/y_train.txt"_
* subject_train: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. Taken from _"./UCI HAR Dataset/train/subject_train.txt"_
* features: List of all features. Taken from _"./UCI HAR Dataset/features.txt"_
* activity_labels: Links the class labels with their activity name. Taken from _"./UCI HAR Dataset/activity_labels.txt"_
* x: x_test and x_train merged by rows
* y: y_test and y_train merged by rows
* subjects: subject_test and subject_train merged by rows
* mean_std_col: vector of "mean" of "std" measurements from features
* data: data of mean and std from test and train sets by subject
* tidy_data: data averaged by activity and subject

## Tracking changes
* x: in lines 69 and 70, it gets the columns with "mean" and "std" from features.
* y: in lines 73 and 74, it is assigned the activities from activity_labels.
* subject: in lines 78, it is assigned a new name to the column
