rm(list=ls())
library(dplyr)
#setwd("C:/R/UCI HAR Dataset")

### Step 1. Merge the training and the test sets to create one data set.
### 
### Read in and combine the test data. The subjects and activities files are 
### matched to the measurements file by order, so NO MERGE STATEMENTS until 
### we have all the files read into R and combined into one data frame.
subjects_test <- read.table("test/subject_test.txt")
names(subjects_test) <- "subject"
activities_test <- read.table("test/y_test.txt")
names(activities_test) <- "activity"
measurements_test <- read.table("test/X_test.txt")
feature_names <- read.table("features.txt")
names(measurements_test) <- feature_names[,2]
measurements_test <- bind_cols(subjects_test,activities_test,measurements_test)

### Now do the same steps for the training data:
subjects_train <- read.table("train/subject_train.txt")
names(subjects_train) <- "subject"
activities_train <- read.table("train/y_train.txt")
names(activities_train) <- "activity"
measurements_train <- read.table("train/X_train.txt")
names(measurements_train) <- feature_names[,2]
measurements_train <- bind_cols(subjects_train,activities_train,measurements_train)

### combine the test and training sets, so all further steps can be done only
### once.
measurements <- bind_rows(measurements_test,measurements_train)

### drop some extraneous tables
rm(list = c("feature_names","measurements_test","measurements_train",
            "subjects_train","subjects_test","activities_train","activities_test"))

### Step 2. Extract only the measurements on the mean and standard deviation for each measurement.

### extract the variables we want - only the mean and standard deviation for 
### each of the original measurements (plus the subject and activity ID, of course)
measurements <- select(measurements, subject, activity, contains("mean()"), contains("std()"))

###Step 3. Use descriptive activity names to name the activities in the data set
activity_names <- read.table("activity_labels.txt")
names(activity_names) <- c("activity","activity_name")
measurements <- merge(measurements,activity_names,by = "activity")

### replace the activity code with the activity name, drop duplicate name
measurements <- measurements %>% 
    mutate(activity = activity_name) %>%
    select(-activity_name)

### Step 4. Appropriately label the data set with descriptive variable names.
### This was already included in Step 1, in the commands
###     names(measurements_train) <- feature_names[,2], and 
###     names(measurements_test) <- feature_names[,2]
### Full descriptions of the variables can be found in the code book

### Step 5. From the data set in step 4, create a second, independent tidy 
### data set with the average of each variable for each activity and each 
### subject.

measurements_means <- group_by(measurements, activity, subject) %>%
    summarize_all(mean)

### export measurements_means using write.table() for upload

write.table(measurements_means, file="measurements_means.txt", row.names = FALSE)
