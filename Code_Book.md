# Code Book of following run_analysis.R

This code book describes:
1. All the variables
2. Calculated summary 
3. Dataset
4. Required units
5. Codes with description

Given data was Human Activity Recognition Using Smartphones Data Set.
That data for analysis was obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original source of the above dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Required libraries were: data.table

# "run_analysis.R" develops through the following steps:

Merging the training and the test sets to create one data set.
1. Downloaded dataset from the website
2. Read training tables, testing tables, features and activity labels
3. Assign column names for training tables, testing tables, features and activity labels
4. Bound all data in a dataset 
5. Extract the measurements on the mean and standard deviation for each measurement
6. Defining ID, mean and standard deviation
7. Properly merging the data set with descriptive variable names
8. Creating tidy data set with the average of each variable for each activity and each subject
9. Ordered the required tidy data set 
10. Writing required tidy data set in txt file

# Variables used:

x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_data, y_data and subject_data develops the datasets for further analysis.
features contains the correct names for the dataset, which are applied to the column names
