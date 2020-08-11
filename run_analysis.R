## This script is the final assignment of the course
## Getting and Cleaning Data, of the Specialization
## Data Science, by John Hopkins University, offered
## by Coursera. Project made by Juan Pablo Loaiza R.
## This exercise is based on the following data:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Using plyr and dplyr libraries. If it is not
## installed, run: install.packages("plyr") and
## install.packages("dplyr") before continuing.

library(plyr)
library(dplyr)

## Assume the folder "UCI HAR Dataset" is
## in the working directory in order for the
## next lines work properly.

## Reading test data
## x_test: Test set.
## y_test: Test labels.
## subject_test: Each row identifies the subject who
##               performed the activity for each window
##               sample. Its range is from 1 to 30.

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Reading train data
## x_train: Train set.
## y_train: Train labels.
## subject_train: Each row identifies the subject who
##                performed the activity for each window
##                sample. Its range is from 1 to 30.

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Reading features
## features: List of all features.

features <- read.table("./UCI HAR Dataset/features.txt")

## Reading activity_labels
## activity_labels: Links the class labels with their
##                  activity name.

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Merging train and test sets
## x: x_test and x_train merged by rows
## y: y_test and y_train merged by rows
## subjects: subject_test and subject_train merged by rows

x <- rbind(x_test,x_train)
y <- rbind(y_test,y_train)
subject <- rbind(subject_test,subject_train)

## Getting the columns with "mean" and "std"
## from features. These values are assigned
## to x, taking out columns in x that do not
## contain "mean" or "std"
## mean_std_col: vector of "mean" of "std"
##               measurements from features

mean_std_col <- grep("mean|std", features[, 2])
x <- x[, mean_std_col]
names(x) <- features[mean_std_col, 2]

## Assigning activities from activity_labels to y
y[, 1] <- activity_labels[y[, 1], 2]
names(y) <- "activity"

## Renaming the column of subject

names(subject) <- "subject"

## Merging the data from x, y and subject
## data: data of mean and std from test and
##       train sets by subject

data <- cbind(x, y, subject)

## Creating a second tidy data set with the
## average of each variable for each activity
## and each subject.
## tidy_data: data averaged by activity and
##            subject

tidy_data <- data %>% group_by(subject, activity) %>% summarise_all(mean)

## Creating a .txt file with tidy_data

write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
