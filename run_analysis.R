# Getting and Cleaning Data - Assignment

# Downloading given file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Getting and cleaning data/Assignment/Dataset.zip")

# Unzipping Dataset
unzip(zipfile="./Getting and cleaning data/Assignment/Dataset.zip",exdir="./Getting and cleaning data/Assignment")

# Loading required libraries 
library(data.table)
library(reshape2)

# Reading trainings tables:
xtrain <- read.table("./Getting and cleaning data/Assignment/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./Getting and cleaning data/Assignment/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./Getting and cleaning data/Assignment/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
xtest <- read.table("./Getting and cleaning data/Assignment/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./Getting and cleaning data/Assignment/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./Getting and cleaning data/Assignment/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table("./Getting and cleaning data/Assignment/UCI HAR Dataset/features.txt")

# Reading activity labels:
activity_labels <- read.table("./Getting and cleaning data/Assignment/UCI HAR Dataset/activity_labels.txt")
colnames(xtrain) <- features[,2] 
colnames(ytrain) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(xtest) <- features[,2]
colnames(ytest) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityType')

# Binding datasets
mergetrain <- cbind(ytrain, subject_train, xtrain)
mergetest <- cbind(ytest, subject_test, xtest)
alltogether <- rbind(mergetrain, mergetest)

col_Names <- colnames(alltogether)
mean_and_std <- (grepl("activityId" , col_Names) | 
                   grepl("subjectId" , col_Names) | 
                   grepl("mean.." , col_Names) | 
                   grepl("std.." , col_Names) )
set_for_all <- alltogether[ , mean_and_std == TRUE]

# Merging dataset
set_Activity_Names <- merge(set_for_all, activity_labels, by='activityId', all.x=TRUE)

# Applying mean
Tidy_Set <- aggregate(. ~subjectId + activityId, set_Activity_Names, mean)
Tidy_Set <- Tidy_Set[order(Tidy_Set$subjectId, Tidy_Set$activityId),]

# Creating tidy data as a text file
write.table(Tidy_Set, "Required_Tidy_Data.txt", row.name=FALSE)
